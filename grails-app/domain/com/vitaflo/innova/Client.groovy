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

    static hasMany = [patients:Patient]

    static mapping = {
        table 'clients'
        phone column:'telephone'
    }

    String toString(){
        return name
    }
}
