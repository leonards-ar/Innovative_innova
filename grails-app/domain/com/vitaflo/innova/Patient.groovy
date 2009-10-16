package com.vitaflo.innova

class Patient {

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client
    Date birth
    Double dose
    String pathology
    String deliveryAddress
    String physician
    String clinicalStatus
    String clinicalHistory
    String adverseEvent
  
    //Transient properties
    Date startNTBC
    Product product
    Date lastOrderedDate
    Float orderedQuantity
    String reimbursement

    static transients = ['startNTBC', 'product', 'lastOrderedDate', 'orderedQuantity', 'reimbursement']

    static constraints = {
        firstName(blank:false)
        lastName(blank:false)
        country(blank:false)
        client(blank:false)
        dose(nullable:true, min:0.0d)
        birth(nullable:true)
        pathology(nullable:true)
        deliveryAddress(nullable:true)
        physician(nullable:true)
        clinicalStatus(nullable:true)
        clinicalHistory(nullable:true)
        adverseEvent(nullable:true)
    }

    static mapping = {
        table 'patients'
        phone column:'telephone'
        firstName column:'first_name'
        lastName column:'last_name'
        phone column:'telephone'
        contactName column:'contact'
        deliveryAddress column:'delivery_address'
    }

   String toString(){return "${this.lastName}, ${this.firstName}"}
}
