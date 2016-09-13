<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="Jordi Vilaplana">
    <title>
        <g:layoutTitle default="debatre: let the debate begin"/>
    </title>

    <asset:stylesheet src="application.css"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" crossorigin="anonymous">

    <style>
    /* Space out content a bit */
    body {
        padding-top: 1.5rem;
        padding-bottom: 1.5rem;
    }

    /* Everything but the jumbotron gets side spacing for mobile first views */
    .header,
    .marketing,
    .footer {
        padding-right: 1rem;
        padding-left: 1rem;
    }

    /* Custom page header */
    .header {
        padding-bottom: 1rem;
        border-bottom: .05rem solid #e5e5e5;
    }
    /* Make the masthead heading the same height as the navigation */
    .header h3 {
        margin-top: 0;
        margin-bottom: 0;
        line-height: 3rem;
    }

    /* Custom page footer */
    .footer {
        padding-top: 1.5rem;
        color: #777;
        border-top: .05rem solid #e5e5e5;
    }

    /* Customize container */
    @media (min-width: 48em) {
        .container {
            max-width: 46rem;
        }
    }
    .container-narrow > hr {
        margin: 2rem 0;
    }

    /* Main marketing message and sign up button */
    .jumbotron {
        text-align: center;
        border-bottom: .05rem solid #e5e5e5;
    }
    .jumbotron .btn {
        padding: .75rem 1.5rem;
        font-size: 1.5rem;
    }

    /* Supporting marketing content */
    .marketing {
        margin: 3rem 0;
    }
    .marketing p + h4 {
        margin-top: 1.5rem;
    }

    /* Responsive: Portrait tablets and up */
    @media screen and (min-width: 48em) {
        /* Remove the padding we set earlier */
        .header,
        .marketing,
        .footer {
            padding-right: 0;
            padding-left: 0;
        }
        /* Space out the masthead */
        .header {
            margin-bottom: 2rem;
        }
        /* Remove the bottom border on the jumbotron for visual effect */
        .jumbotron {
            border-bottom: 0;
        }
    }


    .navbar-login
    {
        width: 305px;
        padding: 10px;
        padding-bottom: 0px;
    }

    .navbar-login-session
    {
        padding: 10px;
        padding-bottom: 0px;
        padding-top: 0px;
    }

    .icon-size
    {
        font-size: 87px;
    }
    </style>

    <g:layoutHead/>
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-xs-right">
                <li class="nav-item">
                    <g:link controller="home" class="nav-link active">Home <span class="sr-only">(current)</span></g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="debate" class="nav-link">Debate</g:link>
                </li>
                <sec:ifLoggedIn>
                    <li class="nav-item dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span> 
                            <strong>Nombre</strong>
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="navbar-login">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <p class="text-center">
                                                <span class="glyphicon glyphicon-user icon-size"></span>
                                            </p>
                                        </div>
                                        <div class="col-lg-8">
                                            <p class="text-left"><strong><sec:loggedInUserInfo field="givenName" /></strong></p>
                                            <p class="text-left small"><sec:username /></p>
                                            <p class="text-left">
                                                <a href="#" class="btn btn-primary btn-block btn-sm">Actualizar Datos</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="navbar-login navbar-login-session">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p>
                                                <g:link elementId="_logout" controller="logout" class="btn btn-danger btn-block">Logout</g:link>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>
            </ul>
        </nav>
        <h3 class="text-muted"><g:link controller="home" action="index"><asset:image src="debatre-logo.svg" width="64" /> debatre.com</g:link></h3>
    </div>


    <g:layoutBody/>


    <footer class="footer">
        <p>&copy; Jordi Vilaplana 2016</p>
    </footer>
</div>

<asset:javascript src="application.js"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js" crossorigin="anonymous"></script>

<!-- Custom placeholder for page scripts -->
<g:ifPageProperty name="page.footScripts">
    <g:pageProperty name="page.footScripts" />
</g:ifPageProperty>

</body>
</html>
