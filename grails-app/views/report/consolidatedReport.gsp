
<%@ page import="com.vitaflo.innova.Purchase" %>
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="report.bar.consolidatedReport" default="Consolidated Report" /></title>
  <g:javascript library="prototype" />
  <g:javascript library="scriptaculous" />
  <g:javascript>

    function showPurchaseInvoice(purchase, invoice){

    if(status != 'Creada' && status != 'Rechazada'){
    $(purchase +'_' + invoice).update();
    }

    }
  </g:javascript>

</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="home" action="index"><g:message code="innova.bar.report" default="Report" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="report.bar.consolidatedReport" default="Consolidated Report" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'report',action:'consolidatedReport']">
        <table>
          <tr>
            <td>
              <div><g:message code="purchase.codeNumber"/> </div>
          <g:textField name="codeNumber" value="${codeNumber}" />
          </td>

          <td>
            <div><g:message code="invoice.number"/> </div>
          <g:textField name="number" value="${number}" />
          </td>

          <td>
            <div><g:message code="proforma.patient"/> </div>
          <g:textField id="autocompletePatient" name="patient" value="${patient}" />
          <div id="patient_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompletePatient", "patient_choices", "${createLink(controller:'patient', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="purchase.supplier"/> </div>
          <g:select name="status" from="${com.vitaflo.innova.Supplier.list()}" value="${supplier}" noSelection="['':'']" />
          </td>
          <td>
            <div>&nbsp;</div>
            <span class="button"><g:submitButton name="search" class="save" value="${message(code: 'find', 'default': 'Find')}" /></span>
          </td>
          </tr>
        </table>

      </g:form>

    </div>
    <div class="list">
      <table>
        <thead>
          <tr>
            <th>&nbsp;</th>
            <th><g:message code="consolidated.report.purchase" /></th>

        <th><g:message code="consolidated.report.invoice" default="Invoice"/></th>

        <th><g:message code="consolidated.report.supplier" default="Supplier"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${invoiceList}" status="i" var="invoiceInstance">

          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td></td>
            <td>
                <${invoiceInstance?.purchase}</td>
            <td>${invoiceInstance?.number}</td>
            <td>${invoiceInstance?.purchase?.supplier}</td>
          </tr>
          <tr>

            <td colspan="4">
              <div id="${invoiceInstance?.purchase?.id +'_'+ invoiceInstance?.id}" style="display:true;">
                <g:remoteLink controller="purchase" action="show" id="invoiceInstance?.purchase.id" />
                <g:remoteLink controller="invoice" action="show" id="invoiceInstance.id"/>
              </div></td>
          </tr>
        </g:each>

        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${total}" params="${params}" />
    </div>

  </div>
</body>
</html>
