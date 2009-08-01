<head>
  <meta name='layout' content='main' />
  <title>Innovative</title>
</head>

<body>
  <div class="nav">&nbsp;</div>
  <div id="loginBox" class="loginBox">
    <g:if test='${flash.message}'>
      <div class='login_message'>${flash.message}</div>
    </g:if>
    <form action='${postUrl}' method='POST' id='loginForm' >
      <p>
        <div class="form_label"><g:message code="user.username"/></div>
      <g:textField name='j_username' id='j_username' value='${request.remoteUser}' />
      </p>
      <p>
        <div class="form_label"><g:message code="user.password"/></div>
        <g:passwordField name='j_password' id='j_password' />
      </p>
      <p>
        <label for='remember_me'>Remember me</label>
        <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
      <g:if test='${hasCookie}'>checked='checked'</g:if> />
      </p>
      <p>
        <input type='submit' class="button" value='Login' />
      </p>
    </form>
  </div>

<script type='text/javascript'>
<!--
(function(){
        document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
