package com.vitaflo.innova

class Invoice implements Comparable {

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

    static transients = ['viewPurchase']

    static mapping = {
        table 'invoices'
        number column:'code'
    }

    String toString(){
        return this.number
    }

    //TODO: Resolve how to apply i18n without penalize performance.
    String getViewPurchase(){
        return "Factura de Venta: ${this.number} - Proforma: ${this.proforma}"
    }

    int compareTo(other) {
        if(other instanceof Invoice) {
            if(number.isLong() && other.number.isLong()) {
                return number.compareTo(other.number);
            } else {
                // Just in case one of the values is not a valid number
                return number.compareTo(other.number);
            }
        } else {
            return -1;
        }
    }
}
