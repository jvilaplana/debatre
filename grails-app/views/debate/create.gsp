<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'debate.label', default: 'Debate')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-debate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-debate" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.debate}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.debate}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">

                    <div class='fieldcontain required'>
                        <label for='author'>Author
                            <span class='required-indicator'>*</span>
                        </label><select name="author.id" required="" id="author" >
                        <option value="${sec.loggedInUserInfo(field: "id")}" >
                            <sec:loggedInUserInfo field="givenName" /> <sec:loggedInUserInfo field="familyName" />
                        </option>
                    </select>
                    </div><div class='fieldcontain required'>
                    <label for='title'>Title
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="title" value="" required="" id="title" />
                </div><div class='fieldcontain required'>
                    <label for='content'>Content
                        <span class='required-indicator'>*</span>
                    </label><textarea name="content" value="" required="" id="content"></textarea>
                </div>
                    <%--<f:all bean="debate"/>--%>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
