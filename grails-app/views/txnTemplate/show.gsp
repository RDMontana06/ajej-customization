
<%@ page import="icbs.admin.TxnTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'txnTemplate.label', default: 'TxnTemplate')}" />
		<title>Transaction Template Information</title>
	</head>
	<body>
	<content tag="breadcrumbs">
	  <span class="fa fa-chevron-right"></span><a href="${createLink(uri:'/txnTemplate')}">Transction Template List</a>
      <span class="fa fa-chevron-right"></span><span class="current">Transaction Template Information</span>
	</content>
    <content tag="main-content">   
		<div id="show-txnTemplate" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="nav-tab-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Transaction Template Details</a></li>
                <li><a href="#tab_2" data-toggle="tab">Charges</a></li>
              </ul>
            </div>

            <div class="tab-content">
            	<div class="tab-pane active fade in" id="tab_1">

					<ul class="property-list txnTemplate">
					
						<g:if test="${txnTemplateInstance?.txnModule}">
						<li class="fieldcontain">
							<span id="txnModule-label" class="property-label"><g:message code="txnTemplate.txnModule.label" default="Txn Module" /></span>
							
								<span class="property-value" aria-labelledby="txnModule-label">${txnTemplateInstance?.txnModule?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.txnType}">
						<li class="fieldcontain">
							<span id="txnType-label" class="property-label"><g:message code="txnTemplate.txnType.label" default="Txn Type" /></span>
							
								<span class="property-value" aria-labelledby="txnType-label">${txnTemplateInstance?.txnType?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.code}">
						<li class="fieldcontain">
							<span id="code-label" class="property-label"><g:message code="txnTemplate.code.label" default="Code" /></span>
							
								<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${txnTemplateInstance}" field="code"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.description}">
						<li class="fieldcontain">
							<span id="description-label" class="property-label"><g:message code="txnTemplate.description.label" default="Description" /></span>
							
								<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${txnTemplateInstance}" field="description"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.shortDescription}">
						<li class="fieldcontain">
							<span id="shortDescription-label" class="property-label"><g:message code="txnTemplate.shortDescription.label" default="Short Description" /></span>
							
								<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${txnTemplateInstance}" field="shortDescription"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.minAmt}">
						<li class="fieldcontain">
							<span id="minAmt-label" class="property-label"><g:message code="txnTemplate.minAmt.label" default="Min Amt" /></span>
							
								<span class="property-value" aria-labelledby="minAmt-label"><g:fieldValue bean="${txnTemplateInstance}" field="minAmt"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.maxAmt}">
						<li class="fieldcontain">
							<span id="maxAmt-label" class="property-label"><g:message code="txnTemplate.maxAmt.label" default="Max Amt" /></span>
							
								<span class="property-value" aria-labelledby="maxAmt-label"><g:fieldValue bean="${txnTemplateInstance}" field="maxAmt"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.amlaCode}">
						<li class="fieldcontain">
							<span id="amlaCode-label" class="property-label"><g:message code="txnTemplate.amlaCode.label" default="Amla Code" /></span>
							
								<span class="property-value" aria-labelledby="amlaCode-label"><g:fieldValue bean="${txnTemplateInstance}" field="amlaCode"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.requireTxnDescription}">
						<li class="fieldcontain">
							<span id="requireTxnDescription-label" class="property-label"><g:message code="txnTemplate.requireTxnDescription.label" default="Require Txn Description" /></span>
							
								<span class="property-value" aria-labelledby="requireTxnDescription-label"><g:formatBoolean boolean="${txnTemplateInstance?.requireTxnDescription}" true="Yes" false="No" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.requireTxnReference}">
						<li class="fieldcontain">
							<span id="requireTxnReference-label" class="property-label"><g:message code="txnTemplate.requireTxnReference.label" default="Require Txn Reference" /></span>
							
								<span class="property-value" aria-labelledby="requireTxnReference-label"><g:formatBoolean boolean="${txnTemplateInstance?.requireTxnReference}" true="Yes" false="No" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.validationCopyNo}">
						<li class="fieldcontain">
							<span id="validationCopyNo-label" class="property-label"><g:message code="txnTemplate.validationCopyNo.label" default="Validation Copy No" /></span>
							
								<span class="property-value" aria-labelledby="validationCopyNo-label"><g:fieldValue bean="${txnTemplateInstance}" field="validationCopyNo"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.validationFormCode}">
						<li class="fieldcontain">
							<span id="validationFormCode-label" class="property-label"><g:message code="txnTemplate.validationFormCode.label" default="Validation Form Code" /></span>
							
								<span class="property-value" aria-labelledby="validationFormCode-label"><g:fieldValue bean="${txnTemplateInstance}" field="validationFormCode"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.currency}">
						<li class="fieldcontain">
							<span id="currency-label" class="property-label"><g:message code="txnTemplate.currency.label" default="Currency" /></span>
							
								<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${txnTemplateInstance?.currency?.id}">${txnTemplateInstance?.currency?.name}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.requirePassbook}">
						<li class="fieldcontain">
							<span id="requirePassbook-label" class="property-label"><g:message code="txnTemplate.requirePassbook.label" default="Require Passbook" /></span>
							
								<span class="property-value" aria-labelledby="requirePassbook-label">${txnTemplateInstance?.requirePassbook?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.atmOnlyTxn}">
						<li class="fieldcontain">
							<span id="atmOnlyTxn-label" class="property-label"><g:message code="txnTemplate.atmOnlyTxn.label" default="Atm Only Txn" /></span>
							
								<span class="property-value" aria-labelledby="atmOnlyTxn-label">${txnTemplateInstance?.atmOnlyTxn?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.interbranchTxn}">
						<li class="fieldcontain">
							<span id="interbranchTxn-label" class="property-label"><g:message code="txnTemplate.interbranchTxn.label" default="Interbranch Txn" /></span>
							
								<span class="property-value" aria-labelledby="interbranchTxn-label">${txnTemplateInstance?.interbranchTxn?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.systemOnlyTxn}">
						<li class="fieldcontain">
							<span id="systemOnlyTxn-label" class="property-label"><g:message code="txnTemplate.systemOnlyTxn.label" default="System Only Txn" /></span>
							
								<span class="property-value" aria-labelledby="systemOnlyTxn-label"><g:formatBoolean boolean="${txnTemplateInstance?.systemOnlyTxn}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.memoTxnType}">
						<li class="fieldcontain">
							<span id="memoTxnType-label" class="property-label"><g:message code="txnTemplate.memoTxnType.label" default="Memo Txn Type" /></span>
							
								<span class="property-value" aria-labelledby="memoTxnType-label">${txnTemplateInstance?.memoTxnType?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.batchTxn}">
						<li class="fieldcontain">
							<span id="batchTxn-label" class="property-label"><g:message code="txnTemplate.batchTxn.label" default="Batch Txn" /></span>
							
								<span class="property-value" aria-labelledby="batchTxn-label">${txnTemplateInstance?.batchTxn?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${txnTemplateInstance?.configItemStatus}">
						<li class="fieldcontain">
							<span id="configItemStatus-label" class="property-label"><g:message code="txnTemplate.configItemStatus.label" default="Config Item Status" /></span>
							
								<span class="property-value" aria-labelledby="configItemStatus-label">${txnTemplateInstance?.configItemStatus?.description}</span>
							
						</li>
						</g:if>
					
					</ul>

				</div>

				<div class="tab-pane fade in" id="tab_2">
            		<ul>
					<g:each in="${txnTemplateInstance.charges}" var="charge" >
						<li>${charge.description}</li>
					</g:each>
					</ul>
            	</div>
            </div>

			<g:form url="[resource:txnTemplateInstance, action:'delete']" method="DELETE">
			</g:form>
		</div>
    </content>
    <content tag="main-actions">
        <ul>
        	<li><g:link class="edit" action="edit" resource="${txnTemplateInstance}"><g:message code="default.button.editTxnTemplate.label" default="Assign Charges" /></g:link></li>
		</ul>
    </content>
	</body>
</html>
