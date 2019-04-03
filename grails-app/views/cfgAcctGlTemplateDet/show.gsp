
<%@ page import="icbs.gl.CfgAcctGlTemplateDet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cfgAcctGlTemplateDet.label', default: 'CfgAcctGlTemplateDet')}" />
		<title>${cfgAcctGlTemplateDetInstance?.glDescription.encodeAsHTML()}</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-cfgAcctGlTemplateDet" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cfgAcctGlTemplateDet">
			
				<g:if test="${cfgAcctGlTemplateDetInstance?.glAcct}">
				<li class="fieldcontain">
					<span id="glAcct-label" class="property-label"><g:message code="cfgAcctGlTemplateDet.glAcct.label" default="GL Account" /></span>
					
						<span class="property-value" aria-labelledby="glAcct-label"><g:link controller="glAccount" action="show" id="${cfgAcctGlTemplateDetInstance?.glAcct?.id}">${cfgAcctGlTemplateDetInstance?.glAcct?.shortName.encodeAsHTML()} (${cfgAcctGlTemplateDetInstance?.glAcct?.code.encodeAsHTML()})</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cfgAcctGlTemplateDetInstance?.glDescription}">
				<li class="fieldcontain">
					<span id="glDescription-label" class="property-label"><g:message code="cfgAcctGlTemplateDet.glDescription.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="glDescription-label"><g:fieldValue bean="${cfgAcctGlTemplateDetInstance}" field="glDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cfgAcctGlTemplateDetInstance?.glTemplate}">
				<li class="fieldcontain">
					<span id="glTemplate-label" class="property-label"><g:message code="cfgAcctGlTemplateDet.glTemplate.label" default="Template" /></span>
					
						<span class="property-value" aria-labelledby="glTemplate-label"><g:link controller="cfgAcctGlTemplate" action="show" id="${cfgAcctGlTemplateDetInstance?.glTemplate?.id}">${cfgAcctGlTemplateDetInstance?.glTemplate?.description.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="list" action="index">Back</g:link></li>
		</ul>
            </content>
	</body>
</html>
