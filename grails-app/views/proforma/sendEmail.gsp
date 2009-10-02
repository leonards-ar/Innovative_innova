
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
      <g:hasErrors>
        <div class="errors">
          <g:renderErrors bean="${proformaInstance}" as="list" />
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
          <table borde="1" style="margin-top: 5px;" width="70%">
            <tbody>
              <tr>
                <td width="720" colspan="2"><img src="${resource(dir:'images',file:'innovative.gif')}" alt="Innovative" /></td>
              </tr>
              <tr>
                <td width="720" colspan="2" style="text-align:right">Montevideo,<g:formatDate date="${proformaInstance?.createdAt}" format="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>

            <tr>
              <td width="720">
                INNOVATIVE MEDICINES SA<br/>
                <label>Dirección </label>
                Juan C. Gomez 1445 Ap. 505<br/>
                <label>Código Postal </label>
                11100, Montevideo, Uruguay<br/>
                <label>Tel/Fax </label>
                (598 2) 917 0953<br/>
              </td>
              <td width="720">
                ${proformaInstance?.client?.name}<br />
                ${proformaInstance?.client?.address}<br />
                ${proformaInstance?.client?.phone}<br />
                ${proformaInstance?.client?.email}<br />
                <label class="name"><g:message code="proforma.patient" default="Patient" /></label>
                <br/>
                ${proformaInstance?.patient?.firstName}, ${proformaInstance?.patient?.lastName}<br/>
              </td>
            </tr>

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

                  <td><g:formatNumber number="${proformaDetail?.price}" format="0.00"/></td>

                <td>${fieldValue(bean: proformaDetail, field: "total")}</td>
                </tr>
              </g:each>
              <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
              <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top:1px solid #ddd">
                <td colspan="4"><g:message code="proforma.totalproducts" default="Total Products" /></td>
              <td><g:formatNumber number="${totalDetails}" format="0.00"/></td>
              </tr>
              <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
                <td colspan="4"><g:message code="proforma.courier" default="Courier" /></td>
              <td><g:formatNumber number="${proformaInstance?.courier}" format="0.00"/></td>
              </tr>
              <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
                <td colspan="4" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="0.00"/> %</td>
              <td style="color:red"><g:formatNumber number="${discountAmount}" format="0.00"/></td>
              </tr>
              <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
                <td colspan="4"><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
                <td><b><g:formatNumber number="${totalAmount}" format="0.00"/></b></td>
              </tr>
              </tbody>
            </table>
          </div>
        </g:if>
      </g:form>
    </div>
  </body>
</html>
