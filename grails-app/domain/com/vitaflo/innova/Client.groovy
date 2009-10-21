package com.vitaflo.innova

class Client {

    String name
    String address
    String phone
    String email
    String contact
    Country country
    String status = 'Enabled'
    
    static constraints = {
        name(blank:false)
        address(blank:false)
        phone(blank:false)
        email(email:true)
        country(blank: false)
        status(nullable:false, blank:false, inList:['Enabled','Disabled','Deleted'])
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
