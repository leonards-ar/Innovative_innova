package com.vitaflo.innova

class Proforma {

    Date createdAt = new Date()

    Integer discount =0.0
    Double courier =0.0
    String status = 'Creada'

    Patient patient

    List details
    
    static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']

    static hasMany = [details:ProformaDetail]

    static constraints = {
        patient(nullable:false)
        status(inList:STATUS_LIST)
        details(nullable:false,minSize:1)
    }

    static mapping = {
        table 'proformas'
        details cascade:'delete-orphan'
    }

    static transients = ['client']

    Client getClient(){
        this.patient.client
    }

    String toString(){return "${this.patient} - ${getClient()}"}

}
