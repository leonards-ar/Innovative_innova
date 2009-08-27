package com.vitaflo.innova

class ProformaController {

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def mailService

    def index = { redirect(action: "list", params: params) }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)
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
            //Total Details
            Double totalDetails = proformaInstance.getTotalDetails();

            //Total Amount
            Double totalAmount = proformaInstance.getTotalAmount();

            //Discount Amount
            Double discountAmount = proformaInstance.calculateDiscount(totalAmount)

            return [proformaInstance: proformaInstance, totalDetails:totalDetails, totalAmount:totalAmount, discountAmount: discountAmount]
        }
    }

    def proformaEmail = {
        def proformaInstance = Proforma.get(params.id)

        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }

        //Total Details
        def totalDetails = proformaInstance.getTotalDetails();

        //Total Amount
        def totalAmount = proformaInstance.getTotalAmount();

        //Discount Amount
        def discountAmount = proformaInstance.calculateDiscount(totalAmount)
        
        //Cliente email
        def clientEmail = proformaInstance.patient.client.email

        render(view:'sendEmail', model:[proformaInstance: proformaInstance, totalDetails:totalDetails,
                totalAmount:totalAmount, discountAmount: discountAmount, clientEmail:clientEmail])
        
    }

    def sendProformaEmail = {SendEmailCommand emailCmd ->

        def proformaInstance = Proforma.get(params.id)

        //Total Details
        def totalDetails = proformaInstance.getTotalDetails();
        //Total Amount
        def totalAmount = proformaInstance.getTotalAmount();
        //Discount Amount
        def discountAmount = proformaInstance.calculateDiscount(totalAmount)

        if (!emailCmd.hasErrors()){
            try{
                mailService.sendMail {
                    to emailCmd.clientEmail
                    subject "Proforma ${proformaInstance.id}"
                    body (view:"/emails/proforma", model:[proformaInstance:proformaInstance, totalDetails:totalDetails, totalAmount:totalAmount,
                        discountAmount: discountAmount])

                    flash.message = "proforma.emailsent"
                    flash.args = [proformaInstance.id, emailCmd.clientEmail]
                    flash.defaultMessage = "Proforma ${proformaInstance.id} was sent to ${emailCmd.clientEmail}"
                    redirect(action: "show", id: proformaInstance.id)
                }
            }catch(Exception e){
                log.error "Problem sending email $e.message", e
                def args = [proformaInstance.id, emailCmd.clientEmail].toArray()
                def defaultMsg = "There was a problem sending Proforma ${proformaInstance.id} to ${emailCmd.clientEmail}"

                proformaInstance.errors.reject("proforma.emailsent.problem",args, defaultMsg)
            }
        }

        render(view:'sendEmail', model:[proformaInstance: proformaInstance, totalDetails:totalDetails,
                totalAmount:totalAmount, discountAmount: discountAmount, clientEmail:emailCmd.clientEmail])
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
            def proformaDetailList = proformaInstance.details
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
                    def proformaDetailList = proformaInstance.details
                    render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList])
                    return
                }
            }

            proformaInstance.properties = params

            List updatedDetailList = updateCommand.createProformaDetailsList()

            updatedDetailList.each {updatedDetail ->
                if (updatedDetail.id){
                    def auxProformaDetail = proformaInstance.details.find{it.id == updatedDetail.id}
                    auxProformaDetail.quantity = updatedDetail.quantity
                    auxProformaDetail.dailyDose = updatedDetail.dailyDose
                    auxProformaDetail.product = updatedDetail.product
                }
            }

            List removeDetails = []
            
            proformaInstance.details.each { proformaDetail ->
                    def auxUpdatedDetail = updatedDetailList.find{it.id == proformaDetail.id}
                    if (!auxUpdatedDetail){
                        removeDetails.add(proformaDetail)
                    }
            }

            removeDetails.each { detailToRemove ->
                proformaInstance.removeFromDetails(detailToRemove)
            }

            updatedDetailList.each {updatedDetail ->
                if (updatedDetail.id == null){
                    proformaInstance.addToDetails(updatedDetail)
                }
            }

            if (!proformaInstance.hasErrors() && proformaInstance.save()) {
                flash.message = "proforma.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} updated"
                redirect(action: "show", id: proformaInstance.id)
            }
            else {
                render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: updatedDetailList])
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
        
        render formatNumber(number:price,format:"#.##")
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
            def proformaDetail = new ProformaDetail(product:auxProduct, quantity:quantities[i], dailyDose:dailyDoses[i])
            if(detailsIds[i]!=''){
                proformaDetail.id = detailsIds[i].toLong()
            }
            proformaDetailList.add(proformaDetail)
        }

        return proformaDetailList
    }
}


class SendEmailCommand {
    String clientEmail

    static constraints = {
        clientEmail(email:true, blank:false)
    }

}