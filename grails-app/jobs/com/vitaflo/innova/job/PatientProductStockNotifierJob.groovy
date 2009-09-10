package com.vitaflo.innova.job

import com.vitaflo.innova.service.PatientProductStockServiceService;

class PatientProductStockNotifierJob {
    PatientProductStockServiceService patientProductStockServiceService

    def cronExpresion = "0 1 0 ? * *" // Every day at 1:00 am
    //def timeout = 5000l // execute job once in 5 seconds

    def execute() {
        patientProductStockServiceService.listPatientsProductStockToNotify();
    }
}

