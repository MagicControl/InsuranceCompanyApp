<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
    <g:render template="/layouts/header"/>

<div class="container" style="">
    <g:form controller="client" action="applyChanges" id="${client.id}"  class="form">
        <div class="form-group">
            <g:textField name="name" class="form-control" value="${client.name}" />
        </div>
        <div class="form-group">
            <g:textField name="email" class="form-control" value="${client.email}" />
        </div>
        <div class="form-group">
            <g:textField name="street" class="form-control" value="${client.street}" />
        </div>
        <div class="form-group">
            <g:textField name="zipcode" class="form-control" value="${client.zipcode}" />
        </div>
        <g:submitButton name="btn" class="btn btn-primary pull-left" value="Update"/>
        <a href="${g.createLink(controller: "client", action: "clients")}"class="btn btn-default btn-cancel pull-left">Cancel</a>
        <a href="${g.createLink(controller: "client", action: "delete", id: "${client.id}")}" class="btn btn-danger pull-right">Delete</a>
    </g:form>
</div>
</body>
</html>