package com.vitaflo.innova
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportController {

    def exportService

    def index = { 
    }

    def consolidatedReport = {

        params.max = Math.min(params.max ? params.max.toInteger() : 15, 100)
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "expireDate"
        if (!params.order) params.order = "desc"

        def query =  {

            isNotNull("purchase")
            if(params.codeNumber || params.supplier) {
                purchase {
                    if(params.codeNumber) {
                        eq('codeNumber', params.codeNumber)
                    }
                    if(params.supplier) {
                        supplier {
                            eq('name', params.supplier)
                        }
                    }

                }

            }

            if(params.number){
                eq('number', params.number)
            }

            if(params.patient){
                proforma{
                    patient {
                        def str = params.patient.split(',')
                        eq('lastName', str[0])

                        inList('country', session.countries)
                    }
                }
            }

        }

        def criteria = Invoice.createCriteria()

        def total = criteria.count(query)
        
        def invoices = Invoice.withCriteria{

            maxResults(params.max)
            firstResult(params.offset?.toInteger())
            

            isNotNull("purchase")
            //if(params.codeNumber || params.supplier) {
            purchase {
                order(params.sort, params.order)
                if(params.codeNumber) {
                    eq('codeNumber', params.codeNumber)
                    }
                    if(params.supplier) {
                        supplier {
                            eq('name', params.supplier)
                        }
                    }

                }
                
                //}

                if(params.number){
                    eq('number', params.number)
                }

                if(params.patient){
                    proforma{
                        patient {
                            def str = params.patient.split(',')
                            eq('lastName', str[0])

                        inList('country', session.countries)
                    }
                }
            }

        }

        if(params?.format && params.format != "html"){
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=ConsolidatedReport.${params.format}")
            def exportCriteria = Invoice.createCriteria()
            def exportInvoices = exportCriteria.list(query)

            List fields = ["purchase", "number", "purchase.supplier"]
            def purchaseLabel = g.message(code:"consolidated.report.purchase")
            def invoiceLabel = g.message(code:"consolidated.report.invoice")
            def supplierLabel = g.message(code:"consolidated.report.supplier")
            Map labels = ["purchase":"${purchaseLabel}", "number":"${invoiceLabel}","purchase.supplier":"${supplierLabel}" ]
            exportService.export(params.format, response.outputStream, exportInvoices, fields, labels, [:], [:])
        }
        render(view:'consolidatedReport', model:[invoiceList: invoices, total:total])

        }


        def showDetails = {
            def purchaseInstance = Purchase.get(params.purchaseId)
            def invoiceInstance = Invoice.get(params.invoiceId)

            return [purchaseInstance:purchaseInstance, invoiceInstance: invoiceInstance]
        }

    }
