
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
                                    <label for="birth"><g:message code="patient.birth" default="Day of Birth" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'birth', 'errors')}">
                                    <g:datePicker name="birth" value="${patientInstance?.birth}" precision="day" />

                                </td>
                            </tr>

                            <tr class="prop">
                              <td valign="top" class="name">
                                <label for="weight"><g:message code="patient.weight" default="Weight" />:</label>
                              </td>

                              <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'weight', 'errors')}">
                                  <g:textField name="weight" value="${fieldValue(bean: patientInstance, field: 'weight')}" />


                            </tr>

                            <tr class="prop">
                              <td valign="top" class="name">
                                <label for="height"><g:message code="patient.height" default="Height" />:</label>
                              </td>

                              <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'height', 'errors')}">
                                  <g:textField name="height" value="${fieldValue(bean: patientInstance, field: 'height')}" />
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
                                    <label for="contactName"><g:message code="patient.contactName" default="Contact Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'contactName', 'errors')}">
                                    <g:textField name="contactName" value="${fieldValue(bean: patientInstance, field: 'contactName')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryAddress"><g:message code="patient.deliveryAddress" default="Delivery Address" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'deliveryAddress', 'errors')}">
                                    <g:textField name="deliveryAddress" value="${fieldValue(bean: patientInstance, field: 'deliveryAddress')}" />

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
                                    <label for="dose"><g:message code="patient.dose" default="Dose" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'dose', 'errors')}">
                                    <g:textField name="dose" value="${fieldValue(bean: patientInstance, field: 'dose')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pathology"><g:message code="patient.pathology" default="Pathology" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'pathology', 'errors')}">
                                    <g:textField name="pathology" value="${fieldValue(bean: patientInstance, field: 'pathology')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="physician"><g:message code="patient.physician" default="Physician" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'physician', 'errors')}">
                                    <g:textField name="physician" value="${fieldValue(bean: patientInstance, field: 'physician')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="clinicalStatus"><g:message code="patient.clinicalStatus" default="Clinical Status" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'clinicalStatus', 'errors')}">
                                    <g:textField name="clinicalStatus" value="${fieldValue(bean: patientInstance, field: 'clinicalStatus')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="clinicalHistory"><g:message code="patient.clinicalHistory" default="Clinical History" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'clinicalHistory', 'errors')}">
                                    <g:textField name="clinicalHistory" value="${fieldValue(bean: patientInstance, field: 'clinicalHistory')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="adverseEvent"><g:message code="patient.adverseEvent" default="Adverse Event" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'adverseEvent', 'errors')}">
                                    <g:textField name="adverseEvent" value="${fieldValue(bean: patientInstance, field: 'adverseEvent')}" />

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
