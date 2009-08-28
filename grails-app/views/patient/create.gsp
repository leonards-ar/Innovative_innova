
<%@ page import="com.vitaflo.innova.Patient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="patient.create" default="Create Patient" /></title>
          <g:javascript library="prototype"/>
          <g:javascript>
            function updateClients(e) {
            var clients = e.responseText.evalJSON();
            $('client.id').options.length=clients.size();
            for(i=0;i < clients.size();i++){
              $('client.id').options[i] = new Option(clients[i].name, clients[i].id);
            }

           }

          </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="patient.list" default="Patient List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="patient.create" default="Create Patient" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${patientInstance}">
            <div class="errors">
                <g:renderErrors bean="${patientInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="patient.firstName" default="First Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${fieldValue(bean: patientInstance, field: 'firstName')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="patient.lastName" default="Last Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${fieldValue(bean: patientInstance, field: 'lastName')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="patient.phone" default="Phone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${fieldValue(bean: patientInstance, field: 'phone')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="patient.country" default="Country" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'country', 'errors')}">
                                    <g:select name="country.id" from="${session.countries}" optionKey="id" value="${patientInstance?.country?.id}" onchange="${remoteFunction(controller:'client', action:'searchClientsByCountry',onSuccess:'updateClients(e)', params:'\'country=\'  + this.value')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="client"><g:message code="patient.client" default="Client" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${clientList}" optionKey="id" value="${patientInstance?.client?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contactName"><g:message code="patient.contactName" default="Contact Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'contactName', 'errors')}">
                                    <g:textField name="contactName" value="${fieldValue(bean: patientInstance, field: 'contactName')}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
