
<%@ page contentType="text/html" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html">
     <title><g:message code="proforma.notification" default="Proforma Notification" /></title>
  </head>
  <body>
        <div class="body">
            <h3><g:message code="proforma.notification" default="Proforma Notification"/></h3>
                <div class="dialog">
                    <table style="margin-top: 5px;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "id")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.client" default="Client" />:</td>

                                <td valign="top" class="value">${proformaInstance?.client?.encodeAsHTML()}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.patient" default="Patient" />:</td>

                                <td valign="top" class="value">${proformaInstance?.patient?.encodeAsHTML()}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.createdAt" default="Created At" />:</td>

                                <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${proformaInstance?.createdAt}" /></td>

                            </tr>

                        </tbody>
                    </table>
                </div>

                <g:if test="${proformaInstance?.details?.size()> 0}">
                <div id="detailListPanel" class="list">
                  <table style="margin-top: 5px;">
                    <thead>
                        <tr>

                            <th><g:message code="proformaDetail.product" default="Product" /></th>

                            <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

                            <th><g:message code="proformaDetail.dailyDose" default="Daily Dose" /></th>

                            <th><g:message code="product.price" default="Price" /></th>

                            <th><g:message code="proformaDetail.total" default="Total" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                            <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                            <td>${fieldValue(bean: proformaDetail, field: "dailyDose")}</td>

                            <td><g:formatNumber number="${proformaDetail?.price}" format="#.##"/></td>

                            <td>${fieldValue(bean: proformaDetail, field: "total")}</td>
                        </tr>
                    </g:each>
                    <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
                    <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top:1px solid #ddd">
                        <td colspan="4"><g:message code="proforma.totalproducts" default="Total Products" /></td>
                        <td><g:formatNumber number="${totalDetails}" format="#.##"/></td>
                      </tr>
                    <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
                    <td colspan="4"><g:message code="proforma.courier" default="Courier" /></td>
                    <td><g:formatNumber number="${proformaInstance?.courier}" format="#.##"/></td>
                    </tr>
                    <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
                    <td colspan="4" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="#.##"/> %</td>
                    <td style="color:red"><g:formatNumber number="${discountAmount}" format="#.##"/></td>
                    </tr>
                    <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
                    <td colspan="4"><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
                    <td><b><g:formatNumber number="${totalAmount}" format="#.##"/></b></td>
                    </tr>
                   </tbody>
                  </table>
                </div>
                </g:if>
        </div>
  </body>
</html>
