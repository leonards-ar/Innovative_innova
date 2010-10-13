
<%@ page import="com.vitaflo.innova.ClinicalHistory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="clinicalHistory.new" default="New ClinicalHistory" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <h1>${patientName} </h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="date" title="Date" titleKey="clinicalHistory.date" />
                        
                   	    <g:sortableColumn property="description" title="Description" titleKey="clinicalHistory.description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clinicalHistoryInstanceList}" status="i" var="clinicalHistoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clinicalHistoryInstance.id}"><g:formatDate date="${clinicalHistoryInstance.date}" /></g:link></td>
                        
                            <td>${fieldValue(bean: clinicalHistoryInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: clinicalHistoryInstance, field: "patient")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clinicalHistoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
