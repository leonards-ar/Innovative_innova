
<%@ page import="com.vitaflo.innova.Patient" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="patient.show" default="Show Patient" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="patient.list" default="Patient List" /></g:link></span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton"><g:link class="create" action="create"><g:message code="patient.new" default="New Patient" /></g:link></span>
      </g:ifAnyGranted>
    </div>
    <div class="body">
      <h1><g:message code="patient.show" default="Show Patient" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <g:form>
        <g:hiddenField name="id" value="${patientInstance?.id}" />
        <div class="dialog">
          <table>
            <tbody>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="patient.firstName" default="First Name" />:</td>

            <td valign="top" class="value">${fieldValue(bean: patientInstance, field: "firstName")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="patient.lastName" default="Last Name" />:</td>

            <td valign="top" class="value">${fieldValue(bean: patientInstance, field: "lastName")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="patient.phone" default="Phone" />:</td>

            <td valign="top" class="value">${fieldValue(bean: patientInstance, field: "phone")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="patient.contactName" default="Contact Name" />:</td>

            <td valign="top" class="value">${fieldValue(bean: patientInstance, field: "contactName")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="patient.country" default="Country" />:</td>

            <td valign="top" class="value"><g:link controller="country" action="show" id="${patientInstance?.country?.id}">${patientInstance?.country?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="patient.client" default="Client" />:</td>

            <td valign="top" class="value"><g:link controller="client" action="show" id="${patientInstance?.client?.id}">${patientInstance?.client?.encodeAsHTML()}</g:link></td>

            </tr>

            </tbody>
          </table>
        </div>
        <g:ifAnyGranted role="ROLE_ADMIN">
          <div class="buttons">
            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
          </div>
        </g:ifAnyGranted>
      </g:form>
    </div>
  </body>
</html>
