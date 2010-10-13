package com.vitaflo.innova

class ClinicalHistoryController extends BaseController {

	def index = { redirect(action: "list", params: params) }
	
	// the delete, save and update actions only accept POST requests
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def list = {

		def max = Math.min(params.max ? params.max.toInteger() : 15,  100)
		def sort = params.sort? params.sort : 'date'
		def order = params.order? params.order : 'desc'
		def offset = params.offset? params.offset : 0
      
		rememberListState([max: max, offset: offset, sort: sort, order: order])
      
		def patient = Patient.findById(params.id)
		def clinicalHistoryList = ClinicalHistory.findAllByPatient(patient, [sort:sort, order:order, offset:offset])
		def list = ClinicalHistory.findByPatient(patient)
		def total = list? list?.count():0
		
		render(view:"list", model:[clinicalHistoryInstanceList:clinicalHistoryList, clinicalHistoryInstanceTotal: total, patient:params.id, patientName:"${patient.lastName}, ${patient.firstName}"])
	}

  def create = {
       def clinicalHistoryInstance = new ClinicalHistory()
       def patient = Patient.findById(params.id)
       clinicalHistoryInstance.patient = patient

       render (view:"create", model:[clinicalHistoryInstance: clinicalHistoryInstance])
  }

  def save = {
      def clinicalHistoryInstance = new ClinicalHistory()
      clinicalHistoryInstance.date = params.date
      clinicalHistoryInstance.description = params.description
      def patient = Patient.findById(params.patient)
      clinicalHistoryInstance.patient = patient

       if (!clinicalHistoryInstance.hasErrors() && clinicalHistoryInstance.save()) {
            flash.message = "clinicalHistory.created"
            flash.args = [clinicalHistoryInstance.id]
            flash.defaultMessage = "Clinical History ${clinicalHistoryInstance.id} created"
            redirect(action: "list", id: params.patient)
      }
       else {
            render(view: "create", model: [clinicalHistoryInstance: clinicalHistoryInstance])
        }
  }
}
