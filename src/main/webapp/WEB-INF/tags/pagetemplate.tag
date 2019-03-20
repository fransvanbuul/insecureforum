<%@tag description="Main page template" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insecure Forum</title>
    <link rel="stylesheet" href="/css/fontawesome.min.css">
    <link rel="stylesheet" href="/css/solid.min.css">
    <link rel="stylesheet" href="/css/brands.min.css">
    <link rel="stylesheet" href="/css/bulma.css" />
    <link rel="stylesheet" href="/css/forum.css" />
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/forum.js"></script>
</head>
<body>
    <div class="container navcontainer">
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <span class="navbar-item">
                    <span class="is-size-4 has-text-weight-bold has-text-grey">Insecure Forum</span>
                </span>

                <c:if test="${loggedIn}">
                    <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                    </a>
                </c:if>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                </div>

                <div class="navbar-end">
                    <div class="navbar-item">
                        <c:if test="${loggedIn}">
                            <div class="buttons">
                                <a class="button is-light" href="/auth/logout">
                                    Log out
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </div>
<jsp:doBody/>
</body>
</html>