<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
<g:render template="/layouts/header"/>
<div class="container">
    <g:form controller="user" action="applyChanges" id="${user.id}" class="form">
        <div class="form-group">
            <g:passwordField name="password" class="form-control" placeholder="New password"/>
        </div>
        <g:submitButton name="btn" class="btn btn-primary pull-left" value="Edit"/>
        <a href="${g.createLink(controller: "client", action: "clients")}"
           class="btn btn-default btn-cancel pull-left">Cancel</a>
    </g:form>
</div>
</body>
</html>