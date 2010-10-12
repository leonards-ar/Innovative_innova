
<%@ page import="com.vitaflo.innova.ClinicalHistory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="clinicalHistory.create" default="Create ClinicalHistory" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="clinicalHistory.create" default="Create ClinicalHistory" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${clinicalHistoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${clinicalHistoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="clinicalHistory.date" default="Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" value="${clinicalHistoryInstance?.date}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="clinicalHistory.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'description', 'errors')}">
                                    <!--g:textField name="description" value="${fieldValue(bean: clinicalHistoryInstance, field: 'description')}" /-->
                                    <fckeditor:editor
                                        name="description"
                                        width="80%"
                                        height="400"
                                        toolbar="Default"
                                        fileBrowser="default">
                                    Initial text
                                    </fckeditor:editor>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="patient"><g:message code="clinicalHistory.patient" default="Patient" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'patient', 'errors')}">
                                    <g:select name="patient.id" from="${com.vitaflo.innova.Patient.list()}" optionKey="id" value="${clinicalHistoryInstance?.patient?.id}"  />

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
