
<%@ page import="com.vitaflo.innova.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.list" default="User List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="home" action="index"><g:message code="innova.bar.report" default="Report" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="user.list" default="User List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="purchase" title="Purchase" titleKey="consolidated.report.purchase" />

                            <g:sortableColumn property="invoice" title="Invoice" titleKey="consolidated.report.invoice" />

                            <g:sortableColumn property="invoice" title="Invoice" titleKey="consolidated.report.supplier" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseList}" status="i" var="purchaseInstance">
                      <g:each in="${purchaseInstance?.invoices}" status="j" var="invoiceInstance">
                        <tr class="${(j % 2) == 0 ? 'odd' : 'even'}">

                            <td>${purchaseInstance?.codeNumber}</td>

                            <td>${invoiceInstance?.number}</td>
                            <td>${purchaseInstance?.supplier}</td>

                        </tr>
                      </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseList.count()}" />
            </div>
           
        </div>
    </body>
</html>
