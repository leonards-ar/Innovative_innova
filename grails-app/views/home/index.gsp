<html>
  <head>
    <title>${grailsApplication.config.application.name}</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <sec:ifAnyGranted roles="ROLE_USER,ROLE_ADMIN">
      <span class="menuButton">
        <g:link controller="client" action="list"><g:message code="innova.bar.client"/></g:link>
      </span>

      <span class="menuButton">
        <g:link controller="patient" action="list"><g:message code="innova.bar.patient"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="pathology" action="list"><g:message code="innova.bar.pathology"/></g:link>
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
      </sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_USER,ROLE_ADMIN,ROLE_ACCOUNTANT">
      <span class="menuButton">
        <g:link controller="proforma" action="list"><g:message code="innova.bar.proforma"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="invoice" action="list"><g:message code="innova.bar.invoice"/></g:link>
      </span>
      <span class="menuButton">
        <g:link controller="purchase" action="list"><g:message code="innova.bar.purchase"/></g:link>
      </span>
      </sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_REPORT,ROLE_ACCOUNTANT">
        <span class="menuButton">
          <g:link controller="report" action="index"><g:message code="innova.bar.report"/></g:link>
        </span>
      </sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_ADMIN">
        <span class="menuButton">
          <g:link controller="user" action="list"><g:message code="innova.bar.user"/></g:link>
        </span>
      </sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_ADMIN">
        <span class="menuButton">
          <g:link controller="auditLog" action="list"><g:message code="innova.bar.auditLog"/></g:link>
        </span>
      </sec:ifAnyGranted>
    </div>
  </body>
</html>
