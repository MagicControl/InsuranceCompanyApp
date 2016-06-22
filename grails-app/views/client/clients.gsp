<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>

<body>
<g:render template="/layouts/header"/>

<div class="container">
<div class="col-md-8">
    <g:if test="${clients.size() == 0}">
        <p>
            You don't have any clients yet...
        </p>
    </g:if>
    <g:else>
        <p>
            <g:form controller="client" action="search">
                <g:textField name="query" placeholder="Search" class="form-control search-field" required="required"/>
                <g:submitButton name="btn" class="btn btn-primary" value="Search"/>
            </g:form>
        </p>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>Name</th>
                <th>E-mail</th>
                <th>Street</th>
                <th>Zip code</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="client" in="${clients}">
                <tr>
                    <td>${client.name}</td>
                    <td>${client.email}</td>
                    <td>${client.street}</td>
                    <td>${client.zipcode}</td>
                    <td><a href="${g.createLink(controller: "client", action: "edit", id: "${client.id}")}"
                           class="btn btn-default">Edit</a></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        </div>
        <div class="col-md-4">
            <g:render template="/layouts/map"/>
        </div>
    </g:else>
</div>
</body>
</html>