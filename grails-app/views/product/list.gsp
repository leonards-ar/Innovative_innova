
<%@ page import="com.vitaflo.innova.Product" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="product.list" default="Product List" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span>
      </g:ifAnyGranted>
    </div>
    <div class="body">
      <h1><g:message code="product.list" default="Product List" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <div class="list">
        <table>
          <thead>
            <tr>
          <g:sortableColumn property="name" title="Name" titleKey="product.name" />

          <g:sortableColumn property="presentation" title="Presentation" titleKey="product.presentation" />

          <g:sortableColumn property="price" title="Price" titleKey="product.price" />

          <th><g:message code="product.supplier" default="Supplier" /></th>
          </tr>
          </thead>
          <tbody>
          <g:each in="${productInstanceList}" status="i" var="productInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

              <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>

            <td>${fieldValue(bean: productInstance, field: "presentation")}</td>

            <td class="currencyValue"><g:formatNumber number="${productInstance?.price}" format="0.00"/></td>

            <td>${fieldValue(bean: productInstance, field: "supplier")}</td>

            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${productInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
