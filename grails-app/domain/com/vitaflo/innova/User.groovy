package com.vitaflo.innova

class User {
    
    String username
    String password
    String email
    String firstName
    String lastName

    static hasMany = [countries:Country]

    static constraints = {
        username(blank:false, unique:true)
        password(blank:false)
        email(email:true)
    }

    static mapping = {
        table 'users'
        countries joinTable:[name:'user_to_countries']
    }

    String toString(){
        return username
    }
}
