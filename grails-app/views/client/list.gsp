
<%@ page import="com.vitaflo.innova.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="client.list" default="Client List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="client.new" default="New Client" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="client.list" default="Client List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                                                
                   	    <g:sortableColumn property="name" title="Name" titleKey="client.name" />
                                                
                   	    <g:sortableColumn property="phone" title="Phone" titleKey="client.phone" />
                                                
                   	    <g:sortableColumn property="contact" title="Contact" titleKey="client.contact" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientInstanceList}" status="i" var="clientInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                
                            <td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>
                                                
                            <td>${fieldValue(bean: clientInstance, field: "phone")}</td>
                                                
                            <td>${fieldValue(bean: clientInstance, field: "contact")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clientInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
