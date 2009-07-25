package com.vitaflo.innova

class Supplier {

    String name
    String phone
    String email
    String contact

    static constraints = {
        name(blank:false)
        email(email:true)
    }

   static mapping = {
        table 'suppliers'
        phone column:'telephone'
    }

    String toString(){
        return name
    }
}
