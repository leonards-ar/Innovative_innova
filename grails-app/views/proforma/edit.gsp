
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.edit" default="Edit Proforma" /></title>
        <g:javascript library="prototype" />
        <script type="text/javascript" language="JavaScript">
          function submitForm(name)
          {
            document.editProforma.action = name;
            document.editProforma.submit();
          }

          function submitDeleteForm()
          {
           if (confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}'))
           {
             submitForm('delete');
           }else{
             return false;
           }
          }

          function updateComponents(e)
          {
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
        </script>
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
                                    <label for="patient"><g:message code="proforma.patient" default="Patient" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'patient', 'errors')}">
                                    <g:select name="patient.id" from="${patients}" optionKey="id" value="${proformaInstance?.patient?.id}"
                                               onchange="${remoteFunction(controller:'proforma', action:'lookUpClient',onSuccess:'updateComponents(e)', params:'\'patientId=\'  + this.value')}"/>

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="client"><g:message code="proforma.client" default="Client" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'client', 'errors')}">
                                  <div id="clientName">${proformaInstance?.client?.name?.encodeAsHTML()}</div>
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
                        
                        </tbody>
                    </table>
                </div>

                <div id="detailListPanel"><g:render template="proformaDetailList" model="[proformaDetailList:proformaDetailList]"/></div>

                <div class="buttons">
                    <g:if test="${(proformaInstance?.status == 'Creada') || (proformaInstance?.status == 'Rechazada')}">
                    <span class="button"><g:submitButton name="update" class="save" value="${message(code: 'update', 'default': 'Update')}" onclick="submitForm('update')"/></span>
                    </g:if>
                    <g:if test="${proformaInstance?.status == 'Creada'}">
                      <span class="button"><g:submitButton name="delete" class="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return submitDeleteForm()"/></span>
                    </g:if>
                </div>
            </g:form>
        </div>
    </body>
</html>
