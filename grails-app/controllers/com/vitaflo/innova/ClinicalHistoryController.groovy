package com.vitaflo.innova

class ClinicalHistoryController extends BaseController {

	def index = { redirect(action: "list", params: params) }
	
	// the delete, save and update actions only accept POST requests
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def list = {
		rememberListState([max: 15, offset: 0, sort: 'date', order: 'asc'])
		def max = Math.min(params.max ? params.max.toInteger() : 15,  100)
		def sort = params.sort? params.sort : 'date'
		def order = params.order? params.order : 'asc'
		def offset = params.offset? params.offset : 0
		
		def patient = Patient.findById(params.id)
		def clinicalHistoryList = ClinicalHistory.findByPatient(patient, [max:max,sort:sort, order:order, offset:offset])
		def list = ClinicalHistory.findByPatient(patient)
		def total = list? list?.count():0
		
		render(view:"list", model:[clinicalHistoryInstanceList:clinicalHistoryList, clinicalHistoryInstanceTotal: total, patient:params.id, patientName:"${patient.lastName}, ${patient.firstName}"])
	}
}
