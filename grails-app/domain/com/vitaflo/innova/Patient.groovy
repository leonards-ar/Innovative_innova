package com.vitaflo.innova

class Patient {

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client
    Date birth
    Float weight
    Float height
    Float dose
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
        weight(min:1.00f, max:1000.00f)
        height(min:0.01f, max:3.00f)
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
