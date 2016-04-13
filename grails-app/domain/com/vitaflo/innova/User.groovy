package com.vitaflo.innova

class User implements Serializable {
    static auditable = true
    
    String username
    String passwd
    String email
    String firstName
    String lastName
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false
    String pass = '[secret]'

    static hasMany = [countries:Country, authorities:Role]
    static transients = ['pass','accountExpired','accountLocked','passwordExpired']
    static belongsTo = Role
    
    static constraints = {
        username(blank:false, unique:true)
        passwd(blank:false)
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
