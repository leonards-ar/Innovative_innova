package com.vitaflo.innova

class Drug {

    String name

    static constraints = {
        name(blank:false)
    }

    static mapping = {
        table 'drugs'
    }

    String toString(){
        return name
    }
}
