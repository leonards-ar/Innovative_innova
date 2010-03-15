package com.vitaflo.innova.service

class ExportReportsService {

    boolean transactional = true

    def exportConsolidatedReportToPDF(List purchases, ByteArrayOutputStream baos) {

        Document document = new Document(PageSize.A4, 50, 50, 50, 50);

        PdfWriter.getInstance(document, baos)

        for(purchase in purchases){
            for(invoice in purchase.invoices){

            }
        }

    }
}
