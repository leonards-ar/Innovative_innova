package com.vitaflo.innova.job

import com.vitaflo.innova.service.PatientProductStockService;

class PatientProductStockNotifierJob {
    PatientProductStockService patientProductStockService

    def concurrent = false
    
    def cronExpresion = "0 0 1 ? * *" // Every day at 1:00 am

    def timeout = 5000l // execute job once in 5 seconds

    def execute() {
        patientProductStockService.sendPatientsProductStockNotifications();
    }
}

