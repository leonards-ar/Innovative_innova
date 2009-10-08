package com.vitaflo.innova

class Patient {

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client
    Date birth
    Double weight
    Double height
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
        weight(nullable:true, min:1.00d, max:1000.00d)
        height(nullable:true, min:0.01d, max:3.00d)
    }

    static mapping = {
        table 'patients'
        phone column:'telephone'
        firstName column:'first_name'
        lastName column:'last_name'
        phone column:'telephone'
        contactName column:'contact'
    }

   String toString(){return "${this.lastName}, ${this.firstName}"}
}
