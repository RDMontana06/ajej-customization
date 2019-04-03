
<%@ page import="icbs.gl.GlAccount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'glAccount.label', default: 'GlAccount')}" />
		<title>${glAccountInstance?.name.encodeAsHTML()}</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-glAccount" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list glAccount">
			
				<g:if test="${glAccountInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="glAccount.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="glAcctType" action="show" id="${glAccountInstance?.type?.id}">${glAccountInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="glAccount.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${glAccountInstance?.currency?.id}">${glAccountInstance?.currency?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="glAccount.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${glAccountInstance?.branch?.id}">${glAccountInstance?.branch?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="glAccount.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${glAccountInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="glAccount.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${glAccountInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="glAccount.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="glSortCode" action="show" id="${glAccountInstance?.parent?.id}">${glAccountInstance?.parent?.sort_name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.shortName}">
				<li class="fieldcontain">
					<span id="shortName-label" class="property-label"><g:message code="glAccount.shortName.label" default="Short Name" /></span>
					
						<span class="property-value" aria-labelledby="shortName-label"><g:fieldValue bean="${glAccountInstance}" field="shortName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.debit}">
				<li class="fieldcontain">
					<span id="debit-label" class="property-label"><g:message code="glAccount.debit.label" default="Debit" /></span>
					
						<span class="property-value" aria-labelledby="debit-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.debit}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.credit}">
				<li class="fieldcontain">
					<span id="credit-label" class="property-label"><g:message code="glAccount.credit.label" default="Credit" /></span>
					
						<span class="property-value" aria-labelledby="credit-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.credit}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.debitToday}">
				<li class="fieldcontain">
					<span id="debitToday-label" class="property-label"><g:message code="glAccount.debitToday.label" default="Debit Today" /></span>
					
						<span class="property-value" aria-labelledby="debitToday-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.debitToday}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.creditToday}">
				<li class="fieldcontain">
					<span id="creditToday-label" class="property-label"><g:message code="glAccount.creditToday.label" default="Credit Today" /></span>
					
						<span class="property-value" aria-labelledby="creditToday-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.creditToday}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.debitBalance}">
				<li class="fieldcontain">
					<span id="debitBalance-label" class="property-label"><g:message code="glAccount.debitBalance.label" default="Debit Balance" /></span>
					
						<span class="property-value" aria-labelledby="debitBalance-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.debitBalance}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.creditBalance}">
				<li class="fieldcontain">
					<span id="creditBalance-label" class="property-label"><g:message code="glAccount.creditBalance.label" default="Credit Balance" /></span>
					
						<span class="property-value" aria-labelledby="creditBalance-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.creditBalance}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.balance}">
				<li class="fieldcontain">
					<span id="balance-label" class="property-label"><g:message code="glAccount.balance.label" default="Balance" /></span>
					
						<span class="property-value" aria-labelledby="balance-label"><g:formatNumber format="###,###,##0.00" number="${glAccountInstance?.balance}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${glAccountInstance?.batchUpdate}">
				<li class="fieldcontain">
					<span id="batchUpdate-label" class="property-label"><g:message code="glAccount.batchUpdate.label" default="Batch Update" /></span>
					
						<span class="property-value" aria-labelledby="batchUpdate-label"><g:formatBoolean boolean="${glAccountInstance?.batchUpdate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="list" action="index">GL Accounts</g:link></li>
                    <li><g:link class="edit" action="edit" resource="${glAccountInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
                    <li><g:form url="[resource:glAccountInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form></li>
                    <li><g:link class="create" action="create">Create New GL Account</g:link></li>

		</ul>
            </content>
	</body>
</html>
