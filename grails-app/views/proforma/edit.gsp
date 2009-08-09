
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.edit" default="Edit Proforma" /></title>
        <g:javascript library="prototype" />
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
            <g:form method="post" >
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
                                    <g:select name="patient.id" from="${com.vitaflo.innova.Patient.list()}" optionKey="id" value="${proformaInstance?.patient?.id}"
                                               onchange="${remoteFunction(controller:'proforma', action:'lookUpClient',update:'clientName', params:'\'patientId=\'  + this.value')}"/>

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
                                    <g:textField name="courier" value="${fieldValue(bean: proformaInstance, field: 'courier')}" />

                                </td>
                            </tr>
                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="discount"><g:message code="proforma.discount" default="Discount" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'discount', 'errors')}">
                                    <g:textField name="discount" value="${fieldValue(bean: proformaInstance, field: 'discount')}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>