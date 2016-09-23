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
            <h2><g:message code="default.create.label" args="[entityName]" /></h2>
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
            <p>Posting as ${sec.loggedInUserInfo(field: "givenName")} ${sec.loggedInUserInfo(field: "familyName")}</p>
            <g:form action="save">
                <g:hiddenField name="author.id" value="${sec.loggedInUserInfo(field: "id")}" />
                <div class="form-group required">
                    <label for='title'>Title <span class='required-indicator'>*</span></label>
                    <input type="text" name="title" value="" required="" id="title" maxlength="140" class="form-control" aria-describedby="titleHelp" placeholder="Enter title" />
                    <small id="titleHelp" class="form-text text-muted">Enter a short and descriptive title for your debate.</small>
                </div>
                <div class="form-group required">
                    <label for='content'>Content <span class='required-indicator'>*</span></label>
                    <textarea name="content" value="" required="" id="content" class="form-control"  aria-describedby="titleHelp" placeholder="So, what do you want to argue about?"></textarea>
                    <small id="contentHelp" class="form-text text-muted">Be respectful.</small>
                </div>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
