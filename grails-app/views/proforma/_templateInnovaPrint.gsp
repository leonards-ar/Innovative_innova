
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:grailsApplication.config.application.cssFile)}" type="text/css" media="screen" charset="utf-8">
        <style type="text/css">
          @media print {
            .print {
            display:none}
            }
          }
          </style>

          <g:javascript library="application" />
          <title><g:message code="proforma.print" default="Print Proforma" /></title>
  </head>
  <body>
    <div class="body">
      <div class="dialog">
        <table border="1" style="margin-top: 5px;">
          <tbody>
            <tr>
              <td colspan="2"><img src="${resource(dir:'images',file:grailsApplication.config.application.logoFile)}" alt="${grailsApplication.config.application.name}" /></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align:right">Montevideo,<g:formatDate date="${proformaInstance?.createdAt}" format="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>

          <tr>
            <td style="vertical-align:middle">
              INNOVATIVE MEDICINES SA<br/>
              <label>Direcci&oacute;n </label>
              Ruta 101, Km 23.500, Parque de las Ciencias<br/>
              Edificio Selenin, Macromanzana 3C<br/>
              14000, Canelones, Uruguay<br/>
              <label>Tel/Fax </label>
              (598 2) 917 0953<br/>
            </td>
            <td>
    <b>${proformaInstance?.client?.name}</b></b><br />
    <b>${proformaInstance?.client?.address}</b><br/>
    <b>${proformaInstance?.client?.phone}</b><br/>
    <b>${proformaInstance?.client?.email}</b><br/></b>
          <g:if test="${proformaInstance?.patient}">
            <label class="name"><g:message code="proforma.patient" default="Patient" /></label>
            <br/>
    ${proformaInstance?.patient?.firstName}, ${proformaInstance?.patient?.lastName}<br/>
          </g:if>
          </td>
          </tr>

        </table>
      </div>

      <h4><g:message code="proforma.number"/> ${proformaInstance?.code}</h4>
      <g:if test="${proformaInstance?.details?.size()> 0}">
        <div id="detailListPanel" class="list">
          <table style="margin-top: 5px;" border="1">
            <thead>
              <tr>

                <th><g:message code="proformaDetail.product" default="Product" /></th>

            <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

            <th><g:message code="product.price" default="Price" /></th>

            <th><g:message code="proformaDetail.total" default="Total" /></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                <td style="text-align:right"><g:formatNumber number="${proformaDetail?.price}" format="U\$S 0.00"/></td>

              <td style="text-align:right"><g:formatNumber number="${proformaDetail?.total}" format="U\$S 0.00"/></td>
              </tr>
            </g:each>
            <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
            <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top:1px solid #ddd">
              <td colspan="3"><g:message code="proforma.totalproducts" default="Total Products" /></td>
            <td style="text-align:right"><g:formatNumber number="${totalDetails}" format="U\$S 0.00"/></td>
            </tr>
            <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
              <td colspan="3"><g:message code="proforma.courier" default="Courier" /></td>
            <td style="text-align:right"><g:formatNumber number="${proformaInstance?.courier}" format="U\$S 0.00"/></td>
            </tr>
            <g:if test="${discountAmount  > 0}">
              <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
                <td colspan="3" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="0.00"/> %</td>
              <td class="currencyDiscountValue"><g:formatNumber number="${discountAmount}" format="U\$S 0.00"/></td>
              </tr>
            </g:if>
            <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
              <td colspan="2">&nbsp;</td>
              <td><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
              <td style="text-align:right"><b><g:formatNumber number="${totalAmount}" format="U\$S 0.00"/></b></td>
            </tr>
            </tbody>
          </table>
      </g:if>

      <br/>
      <p>US DOLLARS:
        <g:numToWords number="${formatNumber(number:totalAmount, format:'0.00')}" lang="en"/>
        (<g:numToWords number="${formatNumber(number:totalAmount, format:'0.00')}" lang="es"/>)<br/>

      <g:if test="${proformaInstance.patient?.country?.code == 'BR' || proformaInstance.client?.country?.code == 'BR'}">
        Sales Condition: Letter of credit at sight, irrevocable, confirmed  and  issued by a first class bank. <br/>
        Incoterm: Incoterms CPT. (Paraná, Brazil).<br/><br/>
        Manufacturer: <b>${proformaInstance?.manufacturer?.name ? proformaInstance?.manufacturer?.name : 'APOTEKET AB'}</b><br/>
        <g:if test="${proformaInstance?.manufacturer?.street}">Street:${proformaInstance?.manufacturer?.street}<br/></g:if>
        <g:if test="${proformaInstance?.manufacturer?.city}">City:${proformaInstance?.manufacturer?.city}<br/></g:if>
        <g:if test="${proformaInstance?.manufacturer?.pob}">POB:${proformaInstance?.manufacturer?.pob}<br/></g:if>
        <g:if test="${proformaInstance?.manufacturer?.country}">Country:${proformaInstance?.manufacturer?.country}<br/></g:if><br/>
        Distributer: INNOVATIVE MEDICINES SA<br/>
        Juan C. Gomez 1445 Ap. 505<br/>
        Tel./Fax: (+ 598 2) 917 0953<br/>
        Montevideo - Uruguay <br/><br/>
        Port of Loading/Airport of Departure: ${proformaInstance.loadingAirport ? proformaInstance.loadingAirport : 'Any port of Sweden.'} <br/>
        Port of Discharge/Airport of destination: ${proformaInstance?.destinationAirport} <br/><br/>

        NCM 30.04.90.99<br/><br/>
      </g:if>
      <g:else>
        Sales Terms/Condiciones: 100% advanced payment. 100% pago adelantado.<br/>
      </g:else>
        <b>Benef Bank:</b><br/>
        <b>Santander</b> (Sucursal Ciudad Vieja) Montevideo – Uruguay<br/>
        Swift: BSCHUYMM<br/>
        Benef Account: C/A Nro. 64106<br/>
        Benef Name: INNOVATIVE MEDICINES S.A.Benef Name: INNOVATIVE MEDICINES S.A. <br/>
        Benef Address: Ruta 101, Km 23.500, Parque de las Ciencias, Edificio Selenin, Macromanzana 3C
        14000, Canelones, Uruguay<br/>

        <b>Corresponsal Bank<br/>
        Wells Fargo Bank,N.A. - New York</b><br/>
        New York International Branch<br/>
        375 Park Avenue 4080<br/>
        Zip code 10152<br/>
        United States.<br/>
        Swift code PNBPUS3NNYC<br/>
        ABA 026005092<br/>      
      <ul>
        <li>Valid proforma for 30 days. Proforma v&aacute;lida por 30 d&iacute;as.</li>

        <li>No se entregar&aacute;n productos sin constancia de transferencia o efectivo pago.</li>

        <li>Tiempo de entrega 20 días a partir de la aprobación de la proforma.</li>
      </ul>

      <g:if test="${proformaInstance.patient?.country?.code == 'BR' || proformaInstance.client?.country?.code == 'BR'}">
        Peso Líquido, 60 caps = 15,84 gr (Vary 5 % +/-)<br/>
      </g:if>
    </p>
  </div>
  <br/><br/>
  <input type="button" class="print" onclick="window.print()" value="${message(code: 'print', 'default': 'print')}" />
  <input type="button" class="print" onclick="window.close()" value="${message(code: 'close', 'default': 'close')}" />

</div>
</body>
</html>
