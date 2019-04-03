<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankasset.label', default: 'Bankasset')}" />
		<title>Purchase</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/fixedasset')}">Fixed Asset</a>
          <span class="fa fa-chevron-right"></span><span class="current">Create/Purchase</span>
		</content>

            <content tag="main-content">
		<div id="create-bankasset" class="content scaffold-create" role="main">
			
			<g:form id="create" url="[resource:fixedassetInstance, action:'save']" >
			
			</g:form>
		</div>
            </content>
            <content tag="main-actions">
                <ul>
                    <li><g:submitButton name="create" form="create" value="${message(code: 'default.button.create.label', default: 'Create')}" /></li>
                    <li><g:link action="index"><g:message code="default.cancel.label" args="[entityName]" default="Cancel" /></g:link></li>
                </ul>
            </content>
	</body>
</html>
