package com.vitaflo.innova

class Product {
    static auditable = true

    String name
    String description
    Double price=0.0
    Double presentation
    String doseUnit
    String comercialName
    
    Supplier supplier
    Drug drug

    static final def UNIT_LIST = ['mg', 'ml']

    static constraints = {
        name(blank:false)
        presentation(nullable:false, scale:4)
        supplier(nullable:false)
        drug(nullable:false)
        comercialName(nullable:true)
        doseUnit(nullable:true, inList:UNIT_LIST)
    }

    static mapping = {
        table 'products'
    }

    static transients = ['deliveryPeriod']

    String toString() {
        return name
    }

    String shortName() {
      def words = name.split(" ")
      return "${words[0]} ${(presentation)?presentation:""}${(doseUnit)? doseUnit:""}"
    }

    Integer getDeliveryPeriod() {
        return supplier?.deliveryPeriod;
    }
}
