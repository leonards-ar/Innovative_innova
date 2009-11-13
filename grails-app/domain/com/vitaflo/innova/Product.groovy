package com.vitaflo.innova

class Product {

    String name
    String description
    Double price=0.0
    Double presentation
    String comercialName
    
    Supplier supplier
    Drug drug

    static constraints = {
        name(blank:false)
        presentation(nullable:false, scale:4)
        supplier(nullable:false)
        drug(nullable:false)
        comercialName(nullable:true)
    }

    static mapping = {
        table 'products'
    }

    static transients = ['deliveryPeriod']

    String toString() {
        return name
    }

    Integer getDeliveryPeriod() {
        return supplier?.deliveryPeriod;
    }
}
