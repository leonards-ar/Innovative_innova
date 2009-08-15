
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.list" default="Proforma List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="proforma.list" default="Proforma List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="proforma.id" />

                            <th><g:message code="proforma.client" default="Client" /></th>

                   	    <th><g:message code="proforma.patient" default="Patient" /></th>

                   	    <g:sortableColumn property="status" title="Status" titleKey="proforma.status" />

                   	    <g:sortableColumn property="createdAt" title="Created At" titleKey="proforma.createdAt" />
                                                
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${proformaInstanceList}" status="i" var="proformaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${proformaInstance.id}">${fieldValue(bean: proformaInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: proformaInstance, field: "client")}</td>

                            <td>${fieldValue(bean: proformaInstance, field: "patient")}</td>

                            <td>${fieldValue(bean: proformaInstance, field: "status")}</td>

                            <td><g:formatDate format="dd-MM-yyyy" date="${proformaInstance.createdAt}" /></td>
                                                
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${proformaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>