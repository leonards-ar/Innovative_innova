package com.vitaflo.innova

class ReportController {

    def index = { 
    }

    def consolidatedReport = {ConsolidatedReportCommand consolidatedReportCommand ->

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

    render(view:'consolidatedReport', model:[invoiceList: invoices, total:total])

}



}

class ConsolidatedReportCommand {
Purchase purchase
Invoice invoice
Supplier supplier

List consolidatedReportList(List purchases) {
    List list = []
    //def purchases = Purchase.list(params)
    for(Purchase purchase in purchases){
        for(Invoice invoice in purchase?.invoices){
            def element = new ConsolidatedReportCommand(purchase: purchase, invoice:invoice, supplier:purchase?.supplier)
            list.add(element)
        }
    }
    return list
}
}


