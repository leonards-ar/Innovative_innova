
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="invoice.list" default="Invoice List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="invoice.new" default="New Invoice" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="invoice.list" default="Invoice List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                                                
                   	    <g:sortableColumn property="number" title="Number" titleKey="invoice.number" />

                            <th><g:message code="invoice.proforma" default="Proforma" /></th>

                   	    <g:sortableColumn property="amount" title="Amount" titleKey="invoice.amount" />
                        
                   	    <g:sortableColumn property="status" title="Status" titleKey="invoice.status" />

                            <g:sortableColumn property="date" title="Date" titleKey="invoice.date" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                                                
                            <td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "number")}</g:link></td>

                            <td>${fieldValue(bean: invoiceInstance, field: "proforma")}</td>

                            <td>${formatNumber(number: invoiceInstance.amount, format: "#.##")}</td>

                            <td>${fieldValue(bean: invoiceInstance, field: "status")}</td>

                            <td><g:formatDate date="${invoiceInstance.date}" format="dd/MM/yyyy"/></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
