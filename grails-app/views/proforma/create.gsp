
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="proforma.create" default="Create Proforma" /></title>
    <g:javascript library="prototype" />
    <g:javascript>
      function updateComponents(e){
        $('clientName').innerHTML = e.responseText.evalJSON().clientName;

        $('addDailyDose').value = e.responseText.evalJSON().dose;
      }

      function updateAddPrice(e)
      {
        document.getElementById('addPrice').value = e.responseText;
      }

      function updateProformaDetailsPrice(e, index)
      {
        document.getElementById('prices['+index+']').value = e.responseText;
      }
    </g:javascript>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="proforma.create" default="Create Proforma" /></h1>
    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <g:hasErrors bean="${proformaInstance}">
      <div class="errors">
        <g:renderErrors bean="${proformaInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="patient"><g:message code="proforma.patient" default="Patient" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'patient', 'errors')}">
          <g:select name="patient.id" from="${patients}" optionKey="id" value="${proformaInstance?.patient?.id}"
                    noSelection="${['null':message(code:'noselect')]}"
                    onchange="${remoteFunction(controller:'proforma', action:'lookUpClient',onSuccess:'updateComponents(e)', params:'\'patientId=\'  + this.value')}"/>
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="client"><g:message code="proforma.client" default="Client" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'client', 'errors')}">
              <div id="clientName"></div>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="courier"><g:message code="proforma.courier" default="Courier" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'courier', 'errors')}">
          <g:textField name="courier" value="${formatNumber(number:proformaInstance?.courier, format:'0.00')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="discount"><g:message code="proforma.discount" default="Discount" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'discount', 'errors')}">
          <g:textField name="discount" value="${formatNumber(number:proformaInstance?.discount)}" />

          </td>
          </tr>
          </tbody>
        </table>
      </div>

      <div id="detailListPanel" ><g:render template="proformaDetailList" model="[proformaDetailList:proformaDetailList]"/></div>

      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
