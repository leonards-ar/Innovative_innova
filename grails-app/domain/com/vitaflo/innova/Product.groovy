package com.vitaflo.innova

class Product {

    String name
    String description
    Double price=0.0
    Double presentation
    
    Supplier supplier
    Drug drug

    static constraints = {
        name(blank:false)
        presentation(nullable:false, scale:4)
        supplier(nullable:false)
        drug(nullable:false)
    }

    static mapping = {
        table 'products'
    }

    String toString(){
        return name
    }

}
