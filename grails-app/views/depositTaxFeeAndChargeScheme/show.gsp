
<%@ page import="icbs.deposit.DepositTaxFeeAndChargeScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'depositTaxFeeAndChargeScheme.label', default: 'DepositTaxFeeAndChargeScheme')}" />
		<title>Show Deposit Taxes/Fees and Charges Scheme</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-depositTaxFeeAndChargeScheme" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                            <div class="box-body">
                                <div class="alert alert-info alert-dismissable">
                                    <i class="fa fa-info"></i>
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <b>Message</b> <div class="message" role="status">${flash.message}</div>
                                </div>
                            </div>
			</g:if>
			<ol class="property-list depositTaxFeeAndChargeScheme">
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">${depositTaxFeeAndChargeSchemeInstance?.type?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.taxRate}">
				<li class="fieldcontain">
					<span id="taxRate-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.taxRate.label" default="Tax Rate" /></span>
					
						<span class="property-value" aria-labelledby="taxRate-label"><g:formatNumber format="#,##0.00" number="${depositTaxFeeAndChargeSchemeInstance?.taxRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.feeRate}">
				<li class="fieldcontain">
					<span id="feeRate-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.feeRate.label" default="Fee Rate" /></span>
					
						<span class="property-value" aria-labelledby="feeRate-label"><g:formatNumber format="#,##0.00" number="${depositTaxFeeAndChargeSchemeInstance?.feeRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.feeAmt}">
				<li class="fieldcontain">
					<span id="feeAmt-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.feeAmt.label" default="Fee Amt" /></span>
					
						<span class="property-value" aria-labelledby="feeAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositTaxFeeAndChargeSchemeInstance?.feeAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.chargeRate}">
				<li class="fieldcontain">
					<span id="chargeRate-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.chargeRate.label" default="Charge Rate" /></span>
					
						<span class="property-value" aria-labelledby="chargeRate-label"><g:formatNumber format="#,##0.00" number="${depositTaxFeeAndChargeSchemeInstance?.chargeRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.chargeAmt}">
				<li class="fieldcontain">
					<span id="chargeAmt-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.chargeAmt.label" default="Charge Amt" /></span>
					
						<span class="property-value" aria-labelledby="chargeAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositTaxFeeAndChargeSchemeInstance?.chargeAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.specialCalculation}">
				<li class="fieldcontain">
					<span id="specialCalculation-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.specialCalculation.label" default="Special Calculation" /></span>
					
						<span class="property-value" aria-labelledby="specialCalculation-label">${depositTaxFeeAndChargeSchemeInstance?.specialCalculation?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.feeBaseAmtCondition}">
				<li class="fieldcontain">
					<span id="feeBaseAmtCondition-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.feeBaseAmtCondition.label" default="Fee Base Amt Condition" /></span>
					
						<span class="property-value" aria-labelledby="feeBaseAmtCondition-label"><g:formatBoolean boolean="${depositTaxFeeAndChargeSchemeInstance?.feeBaseAmtCondition}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.feeCountCondition}">
				<li class="fieldcontain">
					<span id="feeCountCondition-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.feeCountCondition.label" default="Fee Count Condition" /></span>
					
						<span class="property-value" aria-labelledby="feeCountCondition-label"><g:formatBoolean boolean="${depositTaxFeeAndChargeSchemeInstance?.feeCountCondition}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.gracePeriod}">
				<li class="fieldcontain">
					<span id="gracePeriod-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.gracePeriod.label" default="Grace Period" /></span>
					
						<span class="property-value" aria-labelledby="gracePeriod-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="gracePeriod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.feeRateBasis}">
				<li class="fieldcontain">
					<span id="feeRateBasis-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.feeRateBasis.label" default="Fee Rate Basis" /></span>
					
						<span class="property-value" aria-labelledby="feeRateBasis-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="feeRateBasis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.chargeRateBasis}">
				<li class="fieldcontain">
					<span id="chargeRateBasis-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.chargeRateBasis.label" default="Charge Rate Basis" /></span>
					
						<span class="property-value" aria-labelledby="chargeRateBasis-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="chargeRateBasis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.isApplyToClosingBal}">
				<li class="fieldcontain">
					<span id="isApplyToClosingBal-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.isApplyToClosingBal.label" default="Is Apply To Closing Bal" /></span>
					
						<span class="property-value" aria-labelledby="isApplyToClosingBal-label"><g:formatBoolean boolean="${depositTaxFeeAndChargeSchemeInstance?.isApplyToClosingBal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.minAmtException}">
				<li class="fieldcontain">
					<span id="minAmtException-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.minAmtException.label" default="Min Amt Exception" /></span>
					
						<span class="property-value" aria-labelledby="minAmtException-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="minAmtException"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositTaxFeeAndChargeSchemeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="depositTaxFeeAndChargeScheme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${depositTaxFeeAndChargeSchemeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="list" action="index">Deposit Taxes/Fees and Charges Scheme List</g:link></li>
                    <li><g:link class="create" action="create">New Deposit Taxes/Fees and Charges Scheme</g:link></li>
                    <li><button disabled="disabled">View Deposit Tax/Charges and Fees Scheme </button></li>
                    <li><g:link action="edit" id="${depositTaxFeeAndChargeSchemeInstance.id}">Update Deposit Taxes/Fees and Charges Scheme</g:link></li>                    
	       	</ul>
            </content>
	</body>
</html>
