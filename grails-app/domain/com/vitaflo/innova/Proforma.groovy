package com.vitaflo.innova

class Proforma {

    Date createdAt = new Date()

    Integer discount =0.0
    Double courier =0.0
    String status = 'Creada'

    Patient patient

    List details = []
    
    static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']

    static hasMany = [details:ProformaDetail]

    static constraints = {
        patient(nullable:false)
        status(inList:STATUS_LIST)
        details(nullable:false,minSize:1)
    }

    static mapping = {
        table 'proformas'
        details cascade:'all, delete-orphan'
    }

    static transients = ['client', 'totalAmount', 'totalDetails']

    Client getClient(){
        this.patient.client
    }

    Double getTotalAmount(){

        Double totalAmount = this.courier        

        totalAmount += getTotalDetails()

        totalAmount *= (this.discount > 0?(100 - this.discount)/100d:1)

        return totalAmount
    }

    Double getTotalDetails(){
        return this.details.sum{it.total}
    }

    Double calculateDiscount(Double amount){
        return amount * (this.discount/100d)
    }


    String toString(){return "${this.patient} - ${getClient()}"}

}
