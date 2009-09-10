package com.vitaflo.innova

class PatientProductStock {

    Patient patient
    Product product
    Date runningOutOfStockDate
    // This is the proforma that supplied the product that is being
    // currently "in use" by the patient". The product bought in
    // proformas before this one, has already ran out.
    // This is to simplify and optimize re calculation of the new
    // runningOutOfStockDate
    Proforma currentProforma

    Boolean notified
    
    static constraints = {
        patient(nullable:false)
        product(nullable:false)
        runningOutOfStockDate(nullable:false)
        currentProforma(nullable:true)
    }

    String toString(){
        return "${this.id} - ${this.patient} - ${this.product} - ${this.runningOutOfStockDate} - ${this.notified}"
    }
}
