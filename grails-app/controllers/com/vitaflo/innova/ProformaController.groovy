package com.vitaflo.innova

class ProformaController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [proformaInstanceList: Proforma.list(params), proformaInstanceTotal: Proforma.count()]
    }

    def create = {
        def proformaInstance = new Proforma()
        proformaInstance.properties = params

        return [proformaInstance: proformaInstance]
    }

    def save = { UpdateProformaDetailsListCommand updateCommand ->

        def proformaInstance = new Proforma(params)
        List proformaDetailList = updateCommand.createProformaDetailsList()

        proformaDetailList.each {proformaDetail ->
            proformaInstance.addToDetails(proformaDetail)
        }

        if (!proformaInstance.hasErrors()){

            if (proformaInstance.save()){
                flash.message = "proforma.created"
                flash.args = [proformaInstance.id]
                flash.defaultMessage = "Proforma ${proformaInstance.id} created"
                redirect(action: "show", id: proformaInstance.id)
            }
        }

        render(view: "create", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList])
        
    }

    def show = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [proformaInstance: proformaInstance]
        }
    }

    def edit = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            List proformaDetailList = proformaInstance.details
            return [proformaInstance: proformaInstance, proformaDetailList:proformaDetailList]
        }
    }

    def update = {UpdateProformaDetailsListCommand updateCommand ->
        
        def proformaInstance = Proforma.get(params.id)
        if (proformaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (proformaInstance.version > version) {
                    
                    proformaInstance.errors.rejectValue("version", "proforma.optimistic.locking.failure", "Another user has updated this Proforma while you were editing")
                    render(view: "edit", model: [proformaInstance: proformaInstance])
                    return
                }
            }
            proformaInstance.properties = params

            

            if (!proformaInstance.hasErrors() && proformaInstance.save()) {
                flash.message = "proforma.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} updated"
                redirect(action: "show", id: proformaInstance.id)
            }
            else {
                render(view: "edit", model: [proformaInstance: proformaInstance])
            }
        }
        else {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def proformaInstance = Proforma.get(params.id)
        if (proformaInstance) {
            try {
                proformaInstance.delete()
                flash.message = "proforma.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "proforma.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def lookUpClient ={

        def clientName = ''

        if (params.patientId != 'null'){
            def patientInstance = Patient.get(params.patientId)
            clientName = patientInstance?.client?.name
        }

        render clientName
    }

    def addDetail = { UpdateProformaDetailsListCommand updateCommand, AddProformaDetailsListCommand addCommand ->
        List proformaDetailList = updateCommand.createProformaDetailsList()
        
        if (!addCommand.hasErrors()){
            def proformaDetail = addCommand.createNewProformaDetail()
            proformaDetailList.add(proformaDetail)
            render (template:"proformaDetailList", model:[proformaDetailList:proformaDetailList])
        }else{
            addCommand.updateAddProductPrice()
            render (template:"proformaDetailList", model:[addCommand:addCommand, proformaDetailList:proformaDetailList])
        }
    }


    def removeDetail = { UpdateProformaDetailsListCommand updateCommand ->
        List proformaDetailList = updateCommand.createProformaDetailsList()
        int i = params.id.toInteger()
        proformaDetailList.remove(i)
        render (template:"proformaDetailList", model:[proformaDetailList:proformaDetailList])
    }


    def updatePrice ={
        double price = 0d
        if (params.addProductId != ''){
            def auxProduct = Product.get(params.addProductId)
            price = auxProduct.getPrice()
        }
        
        render formatNumber(number:price)
    }
}

class AddProformaDetailsListCommand {
    Long addProductId
    Integer addQuantity
    Double addDailyDose
    Double addProductPrice = 0d


    static constraints = {
        addProductId(nullable:false)
        addQuantity(nullable:false, min:1)
        addDailyDose(nullable:false, min:0.1d)
    }

    ProformaDetail createNewProformaDetail(){
        def auxProduct = Product.get(addProductId)
        def proformaDetail = new ProformaDetail(product:auxProduct, quantity:addQuantity, dailyDose:addDailyDose)

        return proformaDetail
    }

    void updateAddProductPrice(){

        addProductPrice = 0d

        if (addProductId != null && addProductId != ''){
            def auxProduct = Product.get(addProductId)
            addProductPrice = auxProduct.getPrice()
        }
    }

}


class UpdateProformaDetailsListCommand {
    List productIds = []
    List quantities = []
    List dailyDoses = []
    List detailsIds = []
    

    List createProformaDetailsList(){
         List proformaDetailList = []
         productIds.eachWithIndex(){ productId, i->
            def auxProduct = Product.get(productId)
            def proformaDetail = new ProformaDetail(id:detailsIds[i],product:auxProduct, quantity:quantities[i], dailyDose:dailyDoses[i])
            proformaDetailList.add(proformaDetail)
        }

        return proformaDetailList
    }
}
