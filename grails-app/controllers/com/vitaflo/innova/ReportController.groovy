package com.vitaflo.innova

class ReportController {

    def index = { 
    }

    def consolidatedReport = {

        params.max = Math.min(params.max ? params.max.toInteger() : 15, 100)
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "expireDate"
        if (!params.order) params.order = "desc"
        render(view:'consolidatedReport', model:[purchaseList: Purchase.list(params)])

    }



}


