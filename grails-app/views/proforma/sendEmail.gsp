
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.send" default="Send Proforma" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="proforma.send" default="Send Proforma" /></h1>
            <g:if test="${flash.message}">
              <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors field="clientEmail">
              <div class="errors">
                <g:renderErrors field="clientEmail" as="list" />
              </div>
            </g:hasErrors>
            <g:form>
                <g:hiddenField name="id" value="${proformaInstance?.id}" />
                <div class="dialog">
                  <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="baseline" class="name" style="vertical-align:middle;"><g:message code="proforma.clientEmail" default="Client email" />:</td>
                            <td valign="baseline" style="vertical-align:middle;" class="value ${hasErrors(field: 'clientEmail', 'errors')}">
                              <g:textField name="clientEmail" value="${clientEmail}"/>
                            </td>
                            <td style="vertical-align:middle;">
                                <div class="buttons">
                                  <span class="button"><g:actionSubmit class="edit" action="sendProformaEmail" value="${message(code: 'send', 'default': 'send')}" /></span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                  </table>
                </div>
                <div class="dialog">
                    <table style="margin-top: 5px;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "id")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.client" default="Client" />:</td>

                                <td valign="top" class="value"><g:link controller="client" action="show" id="${proformaInstance?.client?.id}">${proformaInstance?.client?.encodeAsHTML()}</g:link></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.patient" default="Patient" />:</td>

                                <td valign="top" class="value"><g:link controller="patient" action="show" id="${proformaInstance?.patient?.id}">${proformaInstance?.patient?.encodeAsHTML()}</g:link></td>

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

                            <td><g:formatNumber number="${proformaDetail?.productPrice}" format="#.##"/></td>

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
            </g:form>
        </div>
    </body>
</html>
