package com.vitaflo.innova

class InvoiceController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [invoiceInstanceList: Invoice.list(params), invoiceInstanceTotal: Invoice.count()]
    }

    def create = {
        def invoiceInstance = new Invoice()
        invoiceInstance.properties = params

        List proformasToSelect = findAllProformasWithNoInvoice()

        return [invoiceInstance: invoiceInstance, proformasToSelect: proformasToSelect]
    }

    def save = {
        def invoiceInstance = new Invoice(params)
        if (!invoiceInstance.hasErrors() && invoiceInstance.save()) {
            flash.message = "invoice.created"
            flash.args = [invoiceInstance.id]
            flash.defaultMessage = "Invoice ${invoiceInstance.id} created"
            redirect(action: "show", id: invoiceInstance.id)
        }
        else {
            List proformasToSelect = findAllProformasWithNoInvoice()
            render(view: "create", model: [invoiceInstance: invoiceInstance, proformasToSelect: proformasToSelect])
        }
    }

    def show = {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "invoice.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Invoice not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [invoiceInstance: invoiceInstance]
        }
    }

    def edit = {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "invoice.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Invoice not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            List proformasToSelect = findAllProformasWithNoInvoice()
            proformasToSelect.add(invoiceInstance.proforma)
            proformasToSelect.sort{it.id}
            return [invoiceInstance: invoiceInstance, proformasToSelect:proformasToSelect]
        }
    }

    def update = {
        def invoiceInstance = Invoice.get(params.id)

        //Storing the original proforma to be included in the list of proformas in case
        //of a validation error.
        def originalProforma = invoiceInstance.proforma

        if (invoiceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceInstance.version > version) {
                    
                    invoiceInstance.errors.rejectValue("version", "invoice.optimistic.locking.failure", "Another user has updated this Invoice while you were editing")
                    render(view: "edit", model: [invoiceInstance: invoiceInstance])
                    return
                }
            }
            invoiceInstance.properties = params
            if (!invoiceInstance.hasErrors() && invoiceInstance.save()) {
                flash.message = "invoice.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Invoice ${params.id} updated"
                redirect(action: "show", id: invoiceInstance.id)
            }
            else {
                List proformasToSelect = findAllProformasWithNoInvoice()
                //Adding the original proforma to the list
                proformasToSelect.add(originalProforma)
                proformasToSelect.sort{it.id}                
                render(view: "edit", model: [invoiceInstance: invoiceInstance, proformasToSelect:proformasToSelect])
            }
        }
        else {
            flash.message = "invoice.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Invoice not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def invoiceInstance = Invoice.get(params.id)
        if (invoiceInstance) {
            try {
                invoiceInstance.delete()
                flash.message = "invoice.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Invoice ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "invoice.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Invoice ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "invoice.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Invoice not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def List findAllProformasWithNoInvoice(){
        List proformasWithNoInvoice = []
        proformasWithNoInvoice = Proforma.findAll('from Proforma as p where p not in (select distinct i.proforma from Invoice as i)')
        proformasWithNoInvoice.sort{it.id}
        return proformasWithNoInvoice
    }

    def lookUpAmountProforma ={
        double amount = 0d
        if (params.amountProformaId != ''){
            def auxProforma = Proforma.get(params.amountProformaId)
            amount = auxProforma.getTotalAmount()
        }

        render formatNumber(number:amount,format:"#.##")
    }
}
