package com.vitaflo.innova
import grails.converters.JSON
class ProformaController {

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def mailService

    def index = { redirect(action: "list", params: params) }

    def list = {
        
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "id"
        if (!params.order) params.order = "desc"
        
        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)

        def query = {

            if(params.status) {
                eq('status', params.status)
            }
            patient {
                if(params.client) {
                    eq('client', Client.findByName(params.client))
                }
                if(params.patient) {
                    def str = params.patient.split(',')
                    eq('lastName', str[0])
                }
              
                inList('country', session.countries)
            }
        }

        def criteria = Proforma.createCriteria()
        def total = criteria.count(query)
        
        def proformas = Proforma.withCriteria {
            maxResults(params.max)
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)
            
            if(params.status) {
                eq('status', params.status)
            }

            patient {
                if(params.client) {
                    eq('client', Client.findByName(params.client))
                }
                if(params.patient) {
                    def str = params.patient.split(',')
                    eq('lastName', str[0])
                }

                inList('country', session.countries)
            }
        }
        [proformaInstanceList: proformas, proformaInstanceTotal: total, client: params.client, patient: params.patient, status: params.status]
    }

    def create = {
        def proformaInstance = new Proforma()
        proformaInstance.properties = params
        
        def patients = Patient.withCriteria{
            inList('country', session.countries)
            order('lastName', 'asc')
        }
        
        def clients = Client.withCriteria {
            inList('country', session.countries)
            order('name', 'asc')
        }
        
        return [proformaInstance: proformaInstance, patients: patients, clients: clients]
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

        def patients = Patient.findAllByCountryInList(session.countries)

        render(view: "create", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList, patients:patients])
    }

    def addBatch = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }

        def batchNumbers = []
        proformaInstance.details.eachWithIndex{obj, i->
            batchNumbers[i] = obj.lot
        }

        AddBatchNumberCommand addBatchCmd = new AddBatchNumberCommand(invoiceId: params.invoiceId, batchNumbers:batchNumbers)
        render(view:'addBatch', model:[proformaInstance: proformaInstance, addBatchCmd:addBatchCmd])
    }

    def updateBatch = {AddBatchNumberCommand addBatchCmd ->
        def proformaInstance = Proforma.get(params.id)
        
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(controller:"invoice", action: "list")
        }
        
        //If a new product was added to the promforma while were editing the batch numbers an error is thrown.
        if (proformaInstance.details.size() != addBatchCmd.batchNumbers.size()) {
            proformaInstance.errors.rejectValue("version", "proforma.optimistic.locking.failure", "Another user has updated this Proforma while you were editing")
            def proformaDetailList = proformaInstance.details
            redirect(action:"addBatch",  id: proformaInstance.id)
        }

        //Updating the batch numbers in the proforma
        proformaInstance.details.eachWithIndex{obj, i->
            obj.lot = addBatchCmd.batchNumbers[i]
        }

        //Persisting the proforma
        if (!proformaInstance.hasErrors() && proformaInstance.save()) {
            flash.message = "batch.updated"
            flash.args = [params.id]
            flash.defaultMessage = "Batch number for proforma ${params.id} updated"
            redirect(controller:"invoice", action: "show", id: addBatchCmd.invoiceId)
        }
        
        render(view:'addBatch', model:[proformaInstance: proformaInstance, addBatchCmd:addBatchCmd])
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
                    from "labs@mindpool.com.ar"
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
            def patients = Patient.findAllByCountryInList(session.countries)
            return [proformaInstance: proformaInstance, proformaDetailList:proformaDetailList, patients: patients]
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
                    
                    def patients = Patient.findAllByCountryInList(session.countries)

                    render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList, patients:patients])
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
                    auxProformaDetail.price = updatedDetail.price
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
               def patients = Patient.findAllByCountryInList(session.countries)
               render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: updatedDetailList, patients:patients])
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

        def clients = []
        Double dose = 0.0
       
        if (params.patientId != 'null'){
            def patientInstance = Patient.get(params.patientId)
            clients.add(patientInstance?.client)

            if(patientInstance?.dose){
                dose = patientInstance?.dose 
            }
        } else {
            clients = Client.withCriteria {
            fetchMode("patients", org.hibernate.FetchMode.LAZY)
            inList('country', session.countries)
            order('name', 'asc')
            }
        }

        def data = []
        data = [clients:clients, dose:formatNumber(number:dose,format:"#.##")]
        render  data as JSON
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
    Double addPrice


    static constraints = {
        addProductId(nullable:false)
        addQuantity(nullable:false, min:1)
        addDailyDose(nullable:false, min:0.1d)
        addPrice(nullable:false, min:0d)
    }

    ProformaDetail createNewProformaDetail(){
        def auxProduct = Product.get(addProductId)
        def proformaDetail = new ProformaDetail(product:auxProduct, quantity:addQuantity, dailyDose:addDailyDose, price:addPrice)

        return proformaDetail
    }

    void updateAddProductPrice(){

        addPrice = 0d
        if (addProductId != null && addProductId != ''){
            def auxProduct = Product.get(addProductId)
            addPrice = auxProduct.getPrice()
        }
    }

}


class UpdateProformaDetailsListCommand {
    List productIds = []
    List quantities = []
    List dailyDoses = []
    List detailsIds = []
    List prices = []
    

    List createProformaDetailsList(){
        List proformaDetailList = []
        productIds.eachWithIndex(){ productId, i->
            def auxProduct = Product.get(productId)
            def proformaDetail = new ProformaDetail(product:auxProduct, quantity:quantities[i], dailyDose:dailyDoses[i].replace(',','.').toDouble(), price:prices[i].replace(',','.').toDouble())
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

class AddBatchNumberCommand {
    def invoiceId
    List batchNumbers = []
}