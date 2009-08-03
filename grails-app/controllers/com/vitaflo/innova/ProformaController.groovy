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

    def save = {
        def proformaInstance = new Proforma(params)
        if (!proformaInstance.hasErrors() && proformaInstance.save()) {
            flash.message = "proforma.created"
            flash.args = [proformaInstance.id]
            flash.defaultMessage = "Proforma ${proformaInstance.id} created"
            redirect(action: "show", id: proformaInstance.id)
        }
        else {
            render(view: "create", model: [proformaInstance: proformaInstance])
        }
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
            return [proformaInstance: proformaInstance]
        }
    }

    def update = {
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
}
