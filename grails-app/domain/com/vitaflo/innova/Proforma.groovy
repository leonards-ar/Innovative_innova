package com.vitaflo.innova

class Proforma {
	static auditable = true
	
	Date createdAt = new Date()
	Date deliveryDate
	String code
	Integer discount = 0
	Double courier = 250.0
	String status = 'Creada'
	Boolean donation = false
	Patient patient
	Client client
	String destinationAirport
	String loadingAirport
	Manufacturer manufacturer
	
	static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']
	
	static hasMany = [details:ProformaDetail]
	
	static constraints = {
		patient(nullable:true)
		client(nullable:false)
		status(inList:STATUS_LIST)
		details(nullable:false,minSize:1)
		destinationAirport(nullable:true)
		loadingAirport(nullable:true)
		deliveryDate(nullable:true, blank:true)
        code(nullable:true, blank:true)
		manufacturer(nullable:true)
	}
	
	static mapping = {
		table 'proformas'
		details cascade:'all, delete-orphan'
	}
	
	static transients = ['totalAmount', 'totalDetails', 'discountAmount']
	
	Double getTotalAmount(){
		
		Double totalAmount = this.courier        
		
		totalAmount += getTotalDetails()
		
		totalAmount -= getDiscountAmount()
		
		return totalAmount
	}
	
	Double getDiscountAmount() {
		return calculateDiscount(getTotalDetails())
	}
	
	Double getTotalDetails(){
		return this.details.sum{it.total}
	}
	
	Double calculateDiscount(Double amount){
		return amount * (this.discount/100d)
	}
	
	
	String toString(){
		return "${this.code} - ${this.client} - ${(this.patient)?this.patient:'---'}"
	}
}
