<!doctype html>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
<g:render template="/layouts/header"/>

<div class="container">
    <g:if test="${clients.size() == 0}">
        <p>
            No clients found
        </p>
        <a href="${g.createLink(controller: "client", action: "clients")}" class="btn btn-primary">Back</a>
    </g:if>
    <g:else>
        <div class="col-md-8">
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
                        <td><a href="${g.createLink(controller: "client", action: "edit", id: "${client.id}")}" class="btn btn-default">Edit</a></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <a href="${g.createLink(controller: "client", action: "clients")}" class="btn btn-primary">Back</a>
        </div>
        <div class="col-md-4">
            <g:if test="${clients}">
                <g:render template="/layouts/map"/>
            </g:if>
        </div>

    </g:else>

</div>
</body>
</html>