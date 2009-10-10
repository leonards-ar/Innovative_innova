package com.vitaflo.innova

import org.grails.plugins.springsecurity.service.AuthenticateService

class PatientController {

    def authenticateService
    
    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)

        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "lastName"
        if (!params.order) params.order = "asc"

        def query = {
            if(params.patient) {
                or{
                    like('lastName', '%' + params.patient + '%')
                    like('firstName', '%' + params.patient + '%')
                }
            }

            if(params.selectedCountry){
                country{
                    eq('code', params.selectedCountry)
                }
            } else {
                inList('country', session.countries)
            }

            if(params.client) {
                client{
                    like('name', '%' + params.client + '%')
                }
            }
        }

        def criteria = Patient.createCriteria()

        def total = criteria.count(query)

        def patients = Patient.withCriteria {
            maxResults(params.max)
            firstResult(params.offset?.toInteger())
            if (params.sort == 'clientName') {
                client { order('name', params.order) }
            } else{
                order(params.sort, params.order)
            }

            if(params.patient) {
                or{
                    like('lastName', '%' + params.patient + '%')
                    like('firstName', '%' + params.patient+ '%')
                }
            }

            if(params.selectedCountry){
                country{
                    eq('code', params.selectedCountry)
                }

            } else {
                inList('country',session.countries)
            }

            if(params.client) {
                client{
                    like('name', '%' + params.client + '%')
                }
            }
        }

        [patientInstanceList: patients, patientInstanceTotal: total, client: params.client, patient:params.patient, selectedCountry: params.selectedCountry]
    }

    def create = {
        def patientInstance = new Patient()
        patientInstance.properties = params

        def clientList = Client.findAllByCountry(session.countries[0], [sort:'name', order:'asc'])
        return [patientInstance: patientInstance, clientList: clientList]
    }

    def save = {
        def patientInstance = new Patient(params)
        if (!patientInstance.hasErrors() && patientInstance.save()) {
            flash.message = "patient.created"
            flash.args = [patientInstance.id]
            flash.defaultMessage = "Patient ${patientInstance.id} created"
            redirect(action: "show", id: patientInstance.id)
        }
        else {
            def clientList = Client.findAllByCountry(patientInstance.country, [sort:'name', order:'asc'])
            render(view: "create", model: [patientInstance: patientInstance, clientList: clientList])
        }
    }

    def show = {
        def patientInstance = Patient.get(params.id)
        if (!patientInstance) {
            flash.message = "patient.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Patient not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [patientInstance: patientInstance]
        }
    }

    def edit = {
        def patientInstance = Patient.get(params.id)
        if (!patientInstance) {
            flash.message = "patient.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Patient not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            def clientList = Client.findAllByCountry(patientInstance.country, [sort:'name', order:'asc'])
            return [patientInstance: patientInstance, clientList: clientList]
        }
    }

    def update = {
        def patientInstance = Patient.get(params.id)
        if (patientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (patientInstance.version > version) {
                    
                    patientInstance.errors.rejectValue("version", "patient.optimistic.locking.failure", "Another user has updated this Patient while you were editing")
                    render(view: "edit", model: [patientInstance: patientInstance])
                    return
                }
            }
            patientInstance.properties = params
            if (!patientInstance.hasErrors() && patientInstance.save()) {
                flash.message = "patient.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Patient ${params.id} updated"
                redirect(action: "show", id: patientInstance.id)
            }
            else {
                def clientList = Client.findAllByCountry(patientInstance.country, [sort:'name', order:'asc'])
                render(view: "edit", model: [patientInstance: patientInstance, clientList: clientList])
            }
        }
        else {
            flash.message = "patient.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Patient not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def patientInstance = Patient.get(params.id)
        if (patientInstance) {
            try {
                patientInstance.delete()
                flash.message = "patient.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Patient ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "patient.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Patient ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "patient.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Patient not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def searchAutocomplete = {
        def patients = Patient.withCriteria{
            or{
                like('lastName', '%' + params.patient + '%')
                like('firstName', '%' + params.patient + '%')
            }
            
            inList('country', session.countries)
        }

        StringBuffer idList = new StringBuffer()
        idList.append('<ul>')

        patients?.each{p -> idList.append('<li>' + p.lastName +', ' + p.firstName + '</li>')}

        idList.append('</ul')

        render idList.toString()
    }

}
