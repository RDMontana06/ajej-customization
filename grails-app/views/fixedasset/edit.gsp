<%@ page import="accounting.fixedasset.Bankasset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankasset.label', default: 'Bankasset')}" />
		<title>Edit Fixed Asset Information</title>
	</head>
	<body>
            <content tag="main-content">
		<div id="edit-bankasset" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${bankassetInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${bankassetInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="update" url="[resource:bankassetInstance, action:'update']" method="PUT" >
			<g:hiddenField name="version" value="${bankassetInstance?.version}" />
				<fieldset class="form">
					<g:render template="/fixedasset/formtemps/formedt"/>
				</fieldset>
			</g:form>
		</div>
            </content>
            <content tag="main-actions">
                <ul>
                    <li><g:submitButton name="update" form="update" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="
                                alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                                function(){
                                    checkIfAllowed('XXX00103', 'form#update', 'Update Fixed Asset', null); // params: policyTemplate.code, form to be saved
                                },
                                function(){
                                    return;
                                });
                    " /></li>
                    <li><g:link action="index"><g:message code="default.cancel.label" args="[entityName]" default="Cancel" /></g:link></li>
                </ul>
            </content>

	</body>
</html>
