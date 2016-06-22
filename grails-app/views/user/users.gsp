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
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Login</th>
            <th>Password</th>
            <th>Role</th>
            <th>Edit</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="user" in="${users}">
            <tr>
                <td>${user.login}</td>
                <td>${user.password}</td>
                <td>${user.role}</td>
                <td><a href="${g.createLink(controller: "user", action: "edit", id: "${user.id}")}"
                       class="btn btn-default">Edit</a></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    </div>
    <div class="container">
        <a href="${g.createLink(controller: "user", action: "newUser")}" class="btn-success btn">Add new user</a>
</g:if>
<g:else>
    <p>
        You do not have permissions to access this page!
    </p>
</g:else>
</div>
</body>
</html>