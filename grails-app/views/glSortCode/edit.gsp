<%@ page import="icbs.gl.GlSortCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'glSortCode.label', default: 'Gl Sort Code')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
            <content tag="main-content">
		<div id="edit-glSortCode" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${glSortCodeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${glSortCodeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form name="update" url="[resource:glSortCodeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${glSortCodeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                                <!--
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
                                -->    
			</g:form>
		</div>
            </content>
            <content tag="main-actions">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    <li><g:actionSubmit class="save" form="update" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Save?')}');"/></li>
                </ul>
            </content>
            
	</body>
</html>
