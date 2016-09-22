<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'debate.label', default: 'Debate')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            .debate-content {
                background-color: #fafafa;
                border: 1px solid #369;
                border-radius: 7px;
                padding: 10px;
                margin-top: 20px;
                margin-bottom: 20px;
            }
        </style>

    </head>
    <body>
        <a href="#show-debate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-debate" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h2>${debate.title}</h2>
            <div class="debate-content">
                <p>${debate.content}</p>
            </div>
            <g:each in="${comments}" var="comment">
                <div class="comment-content">
                    ${comment.content}
                </div>
            </g:each>

            <p>Speaking as Jordi Vilaplana</p>
            <g:form controller="comment" action="save">
                <g:hiddenField name="author.id" value="${sec.loggedInUserInfo(field: "id")}" />
                <g:hiddenField name="debate.id" value="${debate.id}" />
                <textarea class="form-control" rows="5" id="comment" name="content"
                          oninput="this.editor.update()"></textarea>

                <p><small><a id="md-tooltip" href="#">&lt;/&gt; Markdown is supported</a></small></p>
                <div id="markdown-tooltip" class="hidden-xs-up">
                    <p>
                        <small>
                            Comments use mini-Markdown formatting: [link](http://example.com) _italic_ **bold** `code`. The post author will always be notified of your comment. To also notify a previous commenter, mention their user name: @peter or @PeterSmith will both work. Learn more ...
                        </small>
                    </p>
                </div>
                <input type="submit" class="btn btn-primary" value="Send">
            </g:form>
            <hr />
            <div id="preview"> </div>

            <%--<f:display bean="debate" />--%>
            <g:form resource="${this.debate}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.debate}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>

    </body>
</html>

<content tag="footScripts">
    <g:javascript>
        $("#md-tooltip").click(function(){
            if($("#markdown-tooltip").hasClass("hidden-xs-up")) {
                $("#markdown-tooltip").removeClass("hidden-xs-up");
            }
            else {
                $("#markdown-tooltip").addClass("hidden-xs-up");
            }
        });
    </g:javascript>
    <g:javascript>
        function Editor(input, preview) {
            this.update = function () {
                preview.innerHTML = markdown.toHTML(input.value);
            };
            input.editor = this;
            this.update();
        }
        var $__ = function (id) { return document.getElementById(id); };
        new Editor($__("comment"), $__("preview"));
    </g:javascript>
    <g:javascript>
        $(".comment-content").each(function() {
            var content = $(this).text().trim();
            $(this).html(markdown.toHTML(content));
        });
    </g:javascript>
</content>