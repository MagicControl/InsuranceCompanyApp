<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
<g:render template="/layouts/header"/>
<div class="container">
<g:if test="${session?.user?.isAdmin()}">
    <g:form controller="User" action="add" class="form">
        <div class="form-group">
            <g:textField name="login" class="form-control" placeholder="Login" required="required"/>
        </div>
        <div class="form-group">
            <g:passwordField name="password" class="form-control" placeholder="Password" required="required"/>
        </div>
        <g:submitButton name="btn" class="btn btn-primary pull-left" value="Create"/>
    </g:form>
    <a href="${g.createLink(controller: "user", action: "users")}"class="btn btn-default btn-cancel pull-left">Cancel</a>
</g:if>
    <g:else>
        <p>
            You do not have permissions to access this page!
        </p>
    </g:else>
</div>
</body>
</html>