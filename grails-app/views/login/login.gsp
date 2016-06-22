<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body class="login-page">
<div class="container">
<g:form controller="login" action="authenticate">
    <p class="error">${flash.message}</p>
    <div class="form-group">
        <g:textField name="login" class="form-control" placeholder="Login"/>
    </div>
    <div class="form-group">
        <g:passwordField name="password" class="form-control" placeholder="Password"/>
    </div>
    <g:submitButton name="btn" class="btn btn-primary" value="Login"/>
</g:form>
</div>

</body>
</html>