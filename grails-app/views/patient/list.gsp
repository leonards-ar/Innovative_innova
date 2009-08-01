
<%@ page import="com.vitaflo.innova.Patient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="patient.list" default="Patient List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
             <g:ifAnyGranted role="ROLE_ADMIN">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="patient.new" default="New Patient" /></g:link></span>
             </g:ifAnyGranted>
        </div>
        <div class="body">
            <h1><g:message code="patient.list" default="Patient List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                      <tr>
                   	    <g:sortableColumn property="lastName" title="Name" titleKey="patient.firstName" />
                            <th><g:message code="patient.country" default="Country" /></th>
                            <g:sortableColumn property="clientName" title="Client" titleKey="patient.client" />
                      </tr>
                    </thead>
                    <tbody>
                    <g:each in="${patientInstanceList}" status="i" var="patientInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                
                            <td><g:link action="show" id="${patientInstance.id}">${patientInstance}</g:link></td>  
                                                
                            <td>${fieldValue(bean: patientInstance, field: "country")}</td>
                        
                            <td>${fieldValue(bean: patientInstance, field: "client")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${patientInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
