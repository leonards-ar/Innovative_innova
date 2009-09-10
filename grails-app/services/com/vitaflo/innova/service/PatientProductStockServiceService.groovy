package com.vitaflo.innova.service

import com.vitaflo.innova.Patient
import com.vitaflo.innova.Product

class PatientProductStockServiceService {

    boolean transactional = true

    def listPatientsProductStockToNotify() {
        System.out.println("Called listPatientsProductStockToNotify: " + new Date());
    }

    def updatePatientProductStock(Patient patient, Product product, Integer stockDays) {

    }
}