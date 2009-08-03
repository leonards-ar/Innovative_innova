
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.show" default="Show Proforma" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="proforma.show" default="Show Proforma" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${proformaInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "id")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.patient" default="Patient" />:</td>

                                <td valign="top" class="value"><g:link controller="patient" action="show" id="${proformaInstance?.patient?.id}">${proformaInstance?.patient?.encodeAsHTML()}</g:link></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.client" default="Client" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="client" action="show" id="${proformaInstance?.client?.id}">${proformaInstance?.client?.encodeAsHTML()}</g:link></td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.status" default="Status" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "status")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.createdAt" default="Created At" />:</td>

                                <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${proformaInstance?.createdAt}" /></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.courier" default="Courier" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "courier")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.discount" default="Discount" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "discount")}</td>

                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
