<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="layout" content="main">
</head>

<body>

<div class="jumbotron">
    <h1 class="display-3">Let the debate begin</h1>
    <p class="lead">debate (v.) discuss, deliberate upon the pros and cons of,</p>
    <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
</div>

<div class="row marketing">
    <div class="col-lg-6">
        <h3>Top Debates</h3>
        <h4>Subheading</h4>
        <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>

        <h4>Subheading</h4>
        <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>

        <h4>Subheading</h4>
        <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
    </div>

    <div class="col-lg-6">
        <h3>Latest Debates</h3>
        <g:each in="${debateList}" var="debate">
            <h4><g:link controller="debate" action="show" id="${debate.id}">${debate.title}</g:link></h4>
            <p>${debate.content}</p>
        </g:each>
    </div>
</div>


</body>

</html>
