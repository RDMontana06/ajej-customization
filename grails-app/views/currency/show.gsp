
<%@ page import="icbs.admin.Currency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title>Currency Information</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri:'/currency')}">Currency Maintenance</a>
          <span class="fa fa-chevron-right"></span><span class="current">Currency Information</span>
		</content>
		<content tag="main-content">
			<div id="show-currency" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ul class="property-list currency">
				
					<g:if test="${currencyInstance?.code}">
					<li class="fieldcontain">
						<span id="code-label" class="property-label"><g:message code="currency.code.label" default="Currency Code" /></span>
						
							<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${currencyInstance}" field="code"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${currencyInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="currency.name.label" default="Name" /></span>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${currencyInstance}" field="name"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${currencyInstance?.configItemStatus}">
					<li class="fieldcontain">
						<span id="configItemStatus-label" class="property-label"><g:message code="currency.configItemStatus.label" default="Config Item Status" /></span>
						
							<span class="property-value" aria-labelledby="configItemStatus-label">${currencyInstance?.configItemStatus?.description}</span>
						
					</li>
					</g:if>
				
				</ul>
			</div>
		</content>	

		<content tag="main-actions">
            <ul>
                <li><g:link action="edit" controller="currency" id="${currencyInstance.id}" >Edit</g:link></li>
                <li><g:link action="detailView" id="${currencyInstance.id}" >Currency Detail</g:link></li>
                <li><g:link action="index"  >Cancel</g:link></li>
                
            </ul>
        </content>

	</body>
</html>
