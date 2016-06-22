<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
<g:render template="/layouts/header"/>
<div class="container">
<g:if test="${session?.user?.isAdmin()}">
    <g:form controller="user" action="applyChanges" id="${user.id}" class="form">
        <div class="form-group">
            <g:textField name="login" class="form-control" value="${user.login}"/>
        </div>
        <div class="form-group">
            <g:passwordField name="password" class="form-control" placeholder="New password"/>
        </div>
        <g:submitButton name="btn" class="btn btn-primary pull-left" value="Edit"/>
        <a href="${g.createLink(controller: "user", action: "users")}"class="btn btn-default btn-cancel pull-left">Cancel</a>
        <a href="${g.createLink(controller: "user", action: "delete", id: "${user.id}")}"class="btn btn-danger pull-right">Delete</a>
    </g:form>

</g:if>
    <g:else>
        <p>
            You do not have permissions to access this page!
        </p>
    </g:else>
</div>
</body>
</html>