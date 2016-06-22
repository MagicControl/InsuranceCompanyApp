<div class="container navbar navbar-default">
        <nav class="navbar-inner">
            <ul class="nav nav-pills">

                <g:if test="${session.user?.isAdmin()}">
                    <li><a href="${g.createLink(controller: "client", action: "clients")}">Main</a></li>
                    <li><a href="${g.createLink(controller: "user", action: "users")}">User manager</a></li>
                </g:if>
                <g:else>
                    <li><a href="${g.createLink(controller: "client", action: "clients")}">Main</a></li>
                </g:else>
                    <li><a href="${g.createLink(controller: "client", action: "load")}">Load data</a></li>
                    <li><a href="${g.createLink(controller: "user", action: "changePassword")}">Change password</a></li>
            </ul>

        </nav>
        <a class="btn btn-primary btn-log-out" href="${g.createLink(controller: "login", action:"logout")}">Log out</a>
    </div>

