
<%@ page import="com.vitaflo.innova.Purchase" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="purchase.list" default="Purchase List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="purchase.new" default="New Purchase" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="purchase.list" default="Purchase List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                                                
                   	    <g:sortableColumn property="codeNumber" title="Code Number" titleKey="purchase.codeNumber" />

                   	    <th><g:message code="purchase.supplier" default="Supplier" /></th>

                   	    <g:sortableColumn property="expireDate" title="Expire Date" titleKey="purchase.expireDate" />
                        
                   	    <g:sortableColumn property="amount" title="Amount" titleKey="purchase.amount" />
                        
                   	    <g:sortableColumn property="status" title="Status" titleKey="purchase.status" />
                                           	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                
                            <td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "codeNumber")}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseInstance, field: "supplier")}</td>

                            <td><g:formatDate date="${purchaseInstance.expireDate}" format="dd/MM/yyyy" /></td>
                        
                            <td>${fieldValue(bean: purchaseInstance, field: "amount")}</td>
                        
                            <td>${message(code: 'purchase.status.'+purchaseInstance?.status)}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
