package com.vitaflo.innova.service

import com.vitaflo.innova.Invoice
import com.vitaflo.innova.Product
import com.vitaflo.innova.Proforma
import com.vitaflo.innova.ProformaDetail
import com.vitaflo.innova.PatientProductStock
import com.vitaflo.innova.User

class PatientProductStockService {
    def mailService

    boolean transactional = true

    def updatePatientProductStock(Invoice invoice) {
        if(invoice.deliveryDate != null) {
            Proforma proforma = invoice.getProforma();

            proforma?.getDetails().each {
                def patientProductStock = PatientProductStock.findByPatientAndProduct(proforma.patient, it.product);
                if(patientProductStock == null) {
                    patientProductStock = new PatientProductStock();
                    patientProductStock.setPatient(proforma.patient);
                    patientProductStock.setProduct(it.product);
                }
                patientProductStock.setRunningOutOfStockDate(invoice.deliveryDate + it.getTotalDoseDays());
                //:TODO: Check if the flag should always be cleaned!
                patientProductStock.setNotified(false);
                if(!patientProductStock.save()) {
                    patientProductStock.errors.each {
                        log.error it
                    }
                }
            }
        }
    }

    def sendPatientsProductStockNotifications() {
        listPatientsProductStockToNotify().each { patientProductStock ->
            if(sendNotification(it)) {
                patientProductStock.setNotified(true);
                if(!patientProductStock.save(flush:true)) {
                    patientProductStock.errors.each { err ->
                        log.error err
                    }
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