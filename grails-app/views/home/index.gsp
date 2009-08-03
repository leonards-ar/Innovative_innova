<html>
  <head>
    <title>Innovative</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <g:link controller="client" action="list"><g:message code="innova.bar.client"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="patient" action="list"><g:message code="innova.bar.patient"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="drug" action="list"><g:message code="innova.bar.drug"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="supplier" action="list"><g:message code="innova.bar.supplier"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="product" action="list"><g:message code="innova.bar.product"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="proforma" action="list"><g:message code="innova.bar.proforma"/></g:link>
      </span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton">
          <g:link controller="user" action="list"><g:message code="innova.bar.user"/></g:link>
        </span>
      </g:ifAnyGranted>
    </div>
  </body>
</html>
