package com.vitaflo.innova

class Country {

    String name
    String code
    
    static constraints = {
        name(blank:false)
    }

    static mapping = {
        table 'countries'
    }

    String toString(){
        return name
    }
}
