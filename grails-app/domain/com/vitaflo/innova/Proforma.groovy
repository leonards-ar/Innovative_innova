package com.vitaflo.innova

class Proforma {

    Date createdAt = new Date()

    Integer discount =0.0
    Double courier =0.0
    String status = 'Creada'

    Patient patient

    static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']

    static constraints = {
        patient(nullable:false)
        status(inList:STATUS_LIST)
    }

    static mapping = {
        table 'proformas'
    }

    static transients = ['client']

    Client getClient(){
        this.patient.client
    }

    String toString(){return "${this.patient} - ${getClient()}"}

}
