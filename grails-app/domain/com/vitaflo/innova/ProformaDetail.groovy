package com.vitaflo.innova

class ProformaDetail {

    Integer quantity = 0
    String lot
    Double dailyDose
    Product product

    static belongsTo = [proforma: Proforma]
    
    static constraints = {
        quantity(nullable:false)
        product(nullable:false)
        lot(nullable:true)
    }

    static mapping = {
        table 'proformaDetails'
    }

    static transients = ['total','productName','productPrice']


    Double getTotal(){
        getProductPrice() * this.quantity
    }

    Double getProductPrice(){
        this.product.price
    }

    String getProductName(){
        this.product.name;
    }

    String toString(){return "${this.proforma} - ${this.product}"}

}
