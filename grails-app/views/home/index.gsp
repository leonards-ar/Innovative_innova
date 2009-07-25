<html>
    <head>
        <title>Innovative</title>
	<meta name="layout" content="main" />
    </head>
    <body>
       <g:if test="${session.user}">
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
        </div>
       </g:if>
    <g:else>
      <div class="nav">&nbsp;</div>
      <div id="loginBox" class="loginBox">
      <g:form
              name="loginForm"
              url="[controller:'user',action:'login']">
        <div class="form_label"><g:message code="user.username"/></div>
              <g:textField name="username" value="${fieldValue(bean:loginCmd, field:'username')}"></g:textField>
              <div class="form_label"><g:message code="user.password"/></div>
              <g:passwordField name="password"></g:passwordField>
              <br/><br/>
              <input type="submit" class="button" value="${message(code: 'login', 'default': 'Login')}">
      </g:form>
      <g:renderErrors bean="${loginCmd}"></g:renderErrors>
      </div>
    </g:else>
    </body>
</html>