package com.vitaflo.innova

class Manufacturer {

	String name
	String street
	String city
	String pob
	String country
	
	static belongsTo = [proforma:Proforma]
	
    static constraints = {
    }
}
