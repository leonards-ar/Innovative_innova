package com.vitaflo.innova

class Purchase {

    String codeNumber
    Double amount
    Date creationDate = new Date()
    Date expireDate
    String status = 'Pending'

    Supplier supplier
    List invoices

    static hasMany = [invoices:Invoice]

    static final def STATUS_LIST = ['Paid','Pending','Free']

    static constraints = {
        codeNumber(nullable:false, blank:false, unique:true)
        creationDate(nullable:false)
        expireDate(nullable:false)
        amount(nullable:false,min:0.01d)
        status(inList:STATUS_LIST)
        supplier(nullable:false)
        invoices(nullable:false,minSize:1)
    }

    static mapping = {
        table 'purchases'
        codeNumber column:'code'
        creationDate column:'date'
        invoices joinTable:[name:'purchase_invoices', key:'purchase_id', column:'invoice_id']
    }

    String toString(){
        return this.codeNumber
    }

}
