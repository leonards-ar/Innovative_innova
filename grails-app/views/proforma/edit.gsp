
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="proforma.edit" default="Edit Proforma" /></title>
  <g:javascript library="prototype" />
  <g:javascript>
    function submitForm(name)
    {
    document.editProforma.action = name;
    document.editProforma.submit();
    }

    function submitDeleteForm(){
    if (confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}')) {
    submitForm('delete');
    } else {
    return false;
    }
    }

    function updateComponents(e) {
    var client = e.responseText.evalJSON().client;

    if (client != null) {
    for (i = 0; i < $('client.id').options.length; i++) {
    if ($('client.id').options[i].value == client) {
    $('client.id').options[i].selected = true;
    break;
    }
    }
    } else {
    $('client.id').options.selectedIndex = 0;
    }

    $('addDailyDose').value = e.responseText.evalJSON().dose;

    var units = e.responseText.evalJSON().doseUnit;

    if (units != null) {
    for (i = 0; i < $('addDoseUnit').options.length; i++) {
    if ($('addDoseUnit').options[i].value == units) {
    $('addDoseUnit').options[i].selected = true;
    break;
    }
    }
    } else {
    $('addDoseUnit').options.selectedIndex = 0;
    }

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
    <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="proforma.edit" default="Edit Proforma" /></h1>
    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <g:hasErrors bean="${proformaInstance}">
      <div class="errors">
        <g:renderErrors bean="${proformaInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form name="editProforma" method="post" onSubmit="return onSubmitForm();">
      <g:hiddenField name="id" value="${proformaInstance?.id}" />
      <g:hiddenField name="version" value="${proformaInstance?.version}" />
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="code"><g:message code="proforma.id" default="id" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'code', 'errors')}">
              <g:ifAllGranted role="ROLE_ADMIN">
                <g:textField name="code" value="${proformaInstance.code}" />
              </g:ifAllGranted>
              <g:ifNotGranted role="ROLE_ADMIN">
              	<g:textField name="code" value="${proformaInstance.code}" readonly="readonly"/>
              </g:ifNotGranted>
            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="createdAt"><g:message code="proforma.createdAt" default="Created At" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'createdAt', 'errors')}">
            <g:datePicker name="createdAt" value="${proformaInstance?.createdAt}" precision="day" year="${1990..Calendar.instance.get(Calendar.YEAR) + 5}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="patient"><g:message code="proforma.patient" default="Patient" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'patient', 'errors')}">
          <g:select name="patient.id" from="${patients}" optionKey="id" value="${proformaInstance?.patient?.id}"  noSelection="${['null':message(code:'noselect')]}"
                    onchange="${remoteFunction(controller:'proforma', action:'lookUpClient',onSuccess:'updateComponents(e)', params:'\'patientId=\'  + this.value')}"/>

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="client"><g:message code="proforma.client" default="Client" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'client', 'errors')}">
          <g:select name="client.id" from="${clients}" optionKey="id" value="${proformaInstance?.client?.id}" />
          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="patient"><g:message code="proforma.status" default="Patient" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'patient', 'errors')}">
          <g:select name="status" from="${com.vitaflo.innova.Proforma.STATUS_LIST}" value="${fieldValue(bean: proformaInstance, field: 'status')}" valueMessagePrefix="proforma.status.list"/>

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="courier"><g:message code="proforma.courier" default="Courier" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'courier', 'errors')}">
          <g:textField name="courier" value="${formatNumber(number:proformaInstance.courier, format:'0.00')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="discount"><g:message code="proforma.discount" default="Discount" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'discount', 'errors')}">
          <g:textField name="discount" value="${formatNumber(number:proformaInstance.discount)}" />

          </td>
          </tr>
          <tr>
            <td valign="top" class="name">
              <label for="donation"><g:message code="proforma.donation" default="Donation"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'donation', 'errors')}">
          <g:checkBox name="donation" value="${proformaInstance.donation}"/>
          </td>
          </tr>
          <div id="manufacturer" class="dialog">
          <tr class="prop">
            <td valign="top" class="name">
              <label for="manufacturer"><g:message code="proforma.manufacturer" default="Manufacturer"/>:</label>
            </td>
            <td>
          		<table name="manufacturer">
           		  <tr class="pop">
          		    <td valign="top" class="name">
          		      <label for="name"><g:message code="manufacturer.name" default="Manufacturer"/>:</label>
          		    </td>
          		    <td valign="top" class="value ${hasErrors(bean: proformaInstance.manufacturer, field: 'name', 'errors')}">
	          	      <g:textField name="manufacturer.name" value="${proformaInstance?.manufacturer?.name}" size="40"/>
          	        </td>
          		  </tr>
           		  <tr class="pop">
          		    <td valign="top" class="name">
          		      <label for="name"><g:message code="manufacturer.street" default="Street"/>:</label>
          		    </td>
          		    <td valign="top" class="value ${hasErrors(bean: proformaInstance.manufacturer, field: 'street', 'errors')}">
	          	      <g:textField name="manufacturer.street" value="${proformaInstance?.manufacturer?.street}" size="40"/>
          	        </td>
          		  </tr>
           		  <tr class="pop">
          		    <td valign="top" class="name">
          		      <label for="name"><g:message code="manufacturer.city" default="City"/>:</label>
          		    </td>
          		    <td valign="top" class="value ${hasErrors(bean: proformaInstance.manufacturer, field: 'city', 'errors')}">
	          	      <g:textField name="manufacturer.city" value="${proformaInstance?.manufacturer?.city}" size="40"/>
          	        </td>
          		  </tr>
           		  <tr class="pop">
          		    <td valign="top" class="name">
          		      <label for="name"><g:message code="manufacturer.pob" default="POB"/>:</label>
          		    </td>
          		    <td valign="top" class="value ${hasErrors(bean: proformaInstance.manufacturer, field: 'pob', 'errors')}">
	          	      <g:textField name="manufacturer.pob" value="${proformaInstance?.manufacturer?.pob}" size="40"/>
          	        </td>
          		  </tr>
           		  <tr class="pop">
          		    <td valign="top" class="name">
          		      <label for="name"><g:message code="manufacturer.country" default="Country"/>:</label>
          		    </td>
          		    <td valign="top" class="value ${hasErrors(bean: proformaInstance.manufacturer, field: 'country', 'errors')}">
	          	      <g:textField name="manufacturer.country" value="${proformaInstance?.manufacturer?.country}" size="40"/>
          	        </td>
          		  </tr>
          		</table>
          	</td>
          </tr>
          </div>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="loadingAirport"><g:message code="proforma.loadingAirport" default="Port of Discharge"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'loadingAirport', 'errors')}">
          <g:textField name="loadingAirport" value="${proformaInstance.loadingAirport}" />
          </tr>
          
          <tr>
            <td valign="top" class="name">
              <label for="destinationAirport"><g:message code="proforma.destinationAirport" default="Port of Discharge"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'destinationAirport', 'errors')}">
          <g:textField name="destinationAirport" value="${proformaInstance.destinationAirport}" />
          </tr>
          
          <tr class="prop">
              <td valign="top" class="name">
                  <label for="deliveryDate"><g:message code="proforma.deliveryDate" default="Date of delivery" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'deliveryDate', 'errors')}">
                  <g:datePicker default="none" noSelection="${['':message(code:'noselect.dash')]}" name="deliveryDate" value="${proformaInstance?.deliveryDate}" precision="day" years="${Calendar.instance.get(Calendar.YEAR)..Calendar.instance.get(Calendar.YEAR) + 5}" />
              </td>
          </tr>          
          </tbody>
        </table>
      </div>

      <div id="detailListPanel"><g:render template="proformaDetailList" model="[proformaDetailList:proformaDetailList]"/></div>

      <div class="buttons">
        <g:if test="${(proformaInstance?.status == 'Creada') || (proformaInstance?.status == 'Rechazada')}">
          <span class="button"><g:submitButton name="update" class="save" value="${message(code: 'update', 'default': 'Update')}" onclick="return submitForm('update')"/></span>
        </g:if>
        <g:if test="${proformaInstance?.status == 'Creada'}">
          <span class="button"><g:submitButton name="delete" class="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return submitDeleteForm()" /></span>
        </g:if>
      </div>
    </g:form>
  </div>
</body>
</html>
