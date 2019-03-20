<%@tag description="Main page template" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insecure Forum</title>
    <link rel="icon" type="image/png" sizes="32x32" href="/images/skull-crossbones-32.png">
    <link rel="stylesheet" href="/css/fontawesome.min.css">
    <link rel="stylesheet" href="/css/solid.min.css">
    <link rel="stylesheet" href="/css/brands.min.css">
    <link rel="stylesheet" href="/css/bulma.css" />
    <link rel="stylesheet" href="/css/forum.css" />
</head>
<body>
<nav class="navbar is-white">
    <div class="container">
        <div class="navbar-brand">
            <div class="navbar-item">
                <img src="/images/insecureforum.png" alt="Logo">
            </div>
        </div>
        <div class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item is-active">
                    Home
                </a>
            </div>
            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="field is-grouped">
                        <p class="control">
                            <a class="button is-small is-info is-outlined">
                                <span class="icon">
                                    <i class="fas fa-user"></i>
                                </span>
                                <span>Login</span>
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<jsp:doBody/>
</body>
</html>