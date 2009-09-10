package com.vitaflo.innova.service

import com.vitaflo.innova.Patient
import com.vitaflo.innova.Product
import com.vitaflo.innova.PatientProductStock
import com.vitaflo.innova.User

class PatientProductStockService {
   def mailService

    boolean transactional = true


    def sendPatientsProductStockNotifications() {
        listPatientsProductStockToNotify().each {

            if(sendNotification(it)) {
                it.setNotified(true);
                if(!it.save(flush:true)) {
                    log.error it.errors
                }
            }

        }
    }

    def listPatientsProductStockToNotify() {
        def patientProductStocksToNotify = []
        def today = new Date()

        getCandidateProductsToNotify().each {
            def deliveryPeriod = it?.deliveryPeriod != null ? it.deliveryPeriod : 0;
            def productId = it?.id;

            patientProductStocksToNotify.addAll(
                PatientProductStock.withCriteria {
                    if(productId != null) {
                        product {
                            eq("id", productId)
                        }
                    }
                    eq("notified", false)
                    or {
                        eq("runningOutOfStockDate", today + deliveryPeriod)
                        lt("runningOutOfStockDate", today + deliveryPeriod)
                    }
                }
           )
        }
        return patientProductStocksToNotify;
    }

    def updatePatientProductStock(Patient patient, Product product, Integer stockDays) {

    }

    private sendNotification(PatientProductStock patientProductStock) {
        def recipients = getRecipientsToNotify(patientProductStock).toArray();

        if(recipients != null && recipients.length > 0) {
            try{
                mailService.sendMail {
                    from "labs@mindpool.com.ar"
                    to recipients
                    subject "${patientProductStock.patient} - ${patientProductStock.product}"
                    body (view:"/emails/runningoutofstocknotification", model:[patientProductStockInstance:patientProductStock])
                }
                return true;
            } catch(Exception e) {
                log.error "Problem sending email $e.message", e
                return false;
            }
        } else {
            log.warn "There are no recipients for ${patientProductStock}"
            return true;
        }
    }

    private getRecipientsToNotify(PatientProductStock patientProductStock) {
         User.withCriteria {
            projections {
                distinct("email")
            }
            isNotNull("email")

            if(patientProductStock?.patient?.country != null) {
                countries {
                    eq("id", patientProductStock?.patient?.country?.id)
                }
            }
        }
    }

    private getCandidateProductsToNotify() {
        // First fetch all the diferent products available to notify
        PatientProductStock.withCriteria {
            projections {
                distinct("product")
            }
            eq("notified", false)
        }
    }
}