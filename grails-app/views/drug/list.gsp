
<%@ page import="com.vitaflo.innova.Drug" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="drug.list" default="Drug List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="drug.new" default="New Drug" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="drug.list" default="Drug List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                                           
                   	    <g:sortableColumn property="name" title="Name" titleKey="drug.name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${drugInstanceList}" status="i" var="drugInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                        
                            <td><g:link action="show" id="${drugInstance.id}">${fieldValue(bean: drugInstance, field: "name")}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${drugInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
