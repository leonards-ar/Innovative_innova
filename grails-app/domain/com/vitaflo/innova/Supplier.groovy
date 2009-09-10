package com.vitaflo.innova

class Supplier {

    String name
    String phone
    String email
    String contact
    // Time (in DAYS) it takes between the order is placed and the
    // product is delivered.
    //:TODO: Find a better way to set the default value!
    Integer deliveryPeriod = 15

    static constraints = {
        name(blank:false)
        email(email:true)
        deliveryPeriod(min:1)

    }

   static mapping = {
        table 'suppliers'
        phone column:'telephone'
    }

    String toString(){
        return name
    }
}
