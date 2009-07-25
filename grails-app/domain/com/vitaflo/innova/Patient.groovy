package com.vitaflo.innova

class Patient {

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client

    static constraints = {
        firstName(blank:false)
        lastName(blank:false)
        country(blank:false)
        client(blank:false)
    }

    static mapping = {
        table 'patients'
        phone column:'telephone'
        firstName column:'first_name'
        lastName column:'last_name'
        phone column:'telephone'
        contactName column:'contact'
    }

   String toString(){return "${this.lastName}, ${this.firstName}"}
}
