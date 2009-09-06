package com.vitaflo.innova

class PatientProductStock {

    Patient patient
    Product product
    Date lastDeliveryDate
    Date runningOutOfStockDate
    Boolean notified
    
    static constraints = {
        patient(nullable:false)
        product(nullable:false)
        runningOutOfStockDate(nullable:false)
    }

    String toString(){
        return "${this.id} - ${this.patient} - ${this.product} - ${this.runningOutOfStockDate}"
    }
}
