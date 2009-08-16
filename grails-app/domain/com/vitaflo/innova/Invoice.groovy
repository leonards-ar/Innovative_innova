package com.vitaflo.innova

class Invoice {

    Date createdAt = new Date()
    Date date = new Date()
    String number
    String status = 'Pendiente'
    Double amount

    static belongsTo = [proforma:Proforma]

    static final def STATUS_LIST = ['Pendiente','Pagada']

    static constraints = {
        number(nullable:false, blank:false, unique:true)
        date(nullable:false)
        amount(nullable:false,min:0.01d)
        status(inList:STATUS_LIST)
        proforma(nullable:false, unique:true)
    }

    static mapping = {
        table 'invoices'
        number column:'code'
    }

    String toString(){
        return this.number
    }
}
