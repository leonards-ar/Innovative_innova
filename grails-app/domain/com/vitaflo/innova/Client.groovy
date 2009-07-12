package com.vitaflo.innova

class Client {

    String name
    String address
    String phone
    String email
    String contact

    static constraints = {
        name(blank:false)
        address(blank:false)
        phone(blank:false)
        email(email:true)
    }

    static mapping = {
        table 'clients'
        phone column:'telephone'
    }

    String toString(){
        return name
    }
}
