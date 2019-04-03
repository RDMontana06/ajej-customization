
<%@ page import="icbs.admin.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title>Product Information</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-product" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="nav-tab-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Product Details</a></li>
                <li><a href="#tab_2" data-toggle="tab">Branches</a></li>
                <li><a href="#tab_3" data-toggle="tab">Customer Groups</a></li>
                <li><a href="#tab_4" data-toggle="tab">Transactions</a></li>
              </ul>
            </div>

            <div class="tab-content">
            	<div class="tab-pane active fade in" id="tab_1">
					<ul class="property-list product">
					
						<g:if test="${productInstance?.code}">
						<li class="fieldcontain">
							<span id="code-label" class="property-label"><g:message code="product.code.label" default="Code" /></span>
							
								<span class="property-value" aria-labelledby="code-label">${fieldValue(bean: productInstance, field: "code").padLeft(3, '0')}</span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.name}">
						<li class="fieldcontain">
							<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
							
								<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
							
						</li>
						</g:if>

						<g:if test="${productInstance?.productType}">
						<li class="fieldcontain">
							<span id="productType-label" class="property-label"><g:message code="product.productType.label" default="Product Type" /></span>
							
								<span class="property-value" aria-labelledby="productType-label">${productInstance?.productType?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.shortName}">
						<li class="fieldcontain">
							<span id="shortName-label" class="property-label"><g:message code="product.shortName.label" default="Short Name" /></span>
							
								<span class="property-value" aria-labelledby="shortName-label"><g:fieldValue bean="${productInstance}" field="shortName"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.allowFdPartialWithrawal}">
						<li class="fieldcontain">
							<span id="allowFdPartialWithrawal-label" class="property-label"><g:message code="product.allowFdPartialWithrawal.label" default="Allow Fd Partial Withrawal" /></span>
							
								<span class="property-value" aria-labelledby="allowFdPartialWithrawal-label"><g:formatBoolean boolean="${productInstance?.allowFdPartialWithrawal}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.allowFdMultiplePlacement}">
						<li class="fieldcontain">
							<span id="allowFdMultiplePlacement-label" class="property-label"><g:message code="product.allowFdMultiplePlacement.label" default="Allow Fd Multiple Placement" /></span>
							
								<span class="property-value" aria-labelledby="allowFdMultiplePlacement-label"><g:formatBoolean boolean="${productInstance?.allowFdMultiplePlacement}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.depositDormancyMonths}">
						<li class="fieldcontain">
							<span id="depositDormancyMonths-label" class="property-label"><g:message code="product.depositDormancyMonths.label" default="Deposit Dormancy Months" /></span>
							
								<span class="property-value" aria-labelledby="depositDormancyMonths-label"><g:fieldValue bean="${productInstance}" field="depositDormancyMonths"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.depositDormancyTransferFreq}">
						<li class="fieldcontain">
							<span id="depositDormancyTransferFreq-label" class="property-label"><g:message code="product.depositDormancyTransferFreq.label" default="Deposit Dormancy Transfer Freq" /></span>
							
								<span class="property-value" aria-labelledby="depositDormancyTransferFreq-label"><g:link controller="depositAcctDormancyTransferFreq" action="show" id="${productInstance?.depositDormancyTransferFreq?.id}">${productInstance?.depositDormancyTransferFreq?.description}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.hasDepositDormancyInterest}">
						<li class="fieldcontain">
							<span id="hasDepositDormancyInterest-label" class="property-label"><g:message code="product.hasDepositDormancyInterest.label" default="Has Deposit Dormancy Interest" /></span>
							
								<span class="property-value" aria-labelledby="hasDepositDormancyInterest-label"><g:formatBoolean boolean="${productInstance?.hasDepositDormancyInterest}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.depositDormancyAmt}">
						<li class="fieldcontain">
							<span id="depositDormancyAmt-label" class="property-label"><g:message code="product.depositDormancyAmt.label" default="Deposit Dormancy Amt" /></span>
							
								<span class="property-value" aria-labelledby="depositDormancyAmt-label"><g:fieldValue bean="${productInstance}" field="depositDormancyAmt"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.depositChargeStart}">
						<li class="fieldcontain">
							<span id="depositChargeStart-label" class="property-label"><g:message code="product.depositChargeStart.label" default="Dormancy Charge Start" /></span>
							
								<span class="property-value" aria-labelledby="depositChargeStart-label"><g:fieldValue bean="${productInstance}" field="depositChargeStart"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.isMicrofinance}">
						<li class="fieldcontain">
							<span id="isMicrofinance-label" class="property-label"><g:message code="product.isMicrofinance.label" default="Is Microfinance" /></span>
							
								<span class="property-value" aria-labelledby="isMicrofinance-label"><g:formatBoolean boolean="${productInstance?.isMicrofinance}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.documentTemplate}">
						<li class="fieldcontain">
							<span id="documentTemplate-label" class="property-label"><g:message code="product.documentTemplate.label" default="Document Template" /></span>
							
								<span class="property-value" aria-labelledby="documentTemplate-label"><g:fieldValue bean="${productInstance}" field="documentTemplate"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.amortizedChargeSchemes}">
						<li class="fieldcontain">
							<span id="amortizedChargeSchemes-label" class="property-label"><g:message code="product.amortizedChargeSchemes.label" default="Amortized Charge Schemes" /></span>
							
								<g:each in="${productInstance.amortizedChargeSchemes}" var="a">
								<span class="property-value" aria-labelledby="amortizedChargeSchemes-label"><g:link controller="amortizedChargeSchemeProduct" action="show" id="${a.id}">${a?.name}</g:link></span>
								</g:each>
							
						</li>
						</g:if>
					
						
					
						<g:if test="${productInstance?.currency}">
						<li class="fieldcontain">
							<span id="currency-label" class="property-label"><g:message code="product.currency.label" default="Currency" /></span>
							
								<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${productInstance?.currency?.id}">${productInstance?.currency?.name}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.interestIncomeSchemes}">
						<li class="fieldcontain">
							<span id="interestIncomeSchemes-label" class="property-label"><g:message code="product.interestIncomeSchemes.label" default="Interest Income Schemes" /></span>
							
								<g:each in="${productInstance.interestIncomeSchemes}" var="i">
								<span class="property-value" aria-labelledby="interestIncomeSchemes-label"><g:link controller="interestIncomeSchemeProduct" action="show" id="${i.id}">${i?.name}</g:link></span>
								</g:each>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.loanDeductionSchemes}">
						<li class="fieldcontain">
							<span id="loanDeductionSchemes-label" class="property-label"><g:message code="product.loanDeductionSchemes.label" default="Loan Deduction Schemes" /></span>
							
								<g:each in="${productInstance.loanDeductionSchemes}" var="l">
								<span class="property-value" aria-labelledby="loanDeductionSchemes-label"><g:link controller="loanDeductionSchemeProduct" action="show" id="${l.id}">${l?.name}</g:link></span>
								</g:each>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.loanPerformanceClassificationSchemes}">
						<li class="fieldcontain">
							<span id="loanPerformanceClassifications-label" class="property-label"><g:message code="product.loanPerformanceClassifications.label" default="Loan Performance Classifications" /></span>
							
								<g:each in="${productInstance.loanPerformanceClassificationSchemes}" var="l">
								<span class="property-value" aria-labelledby="loanPerformanceClassifications-label"><g:link controller="loanPerformanceClassificationProduct" action="show" id="${l.id}">${l?.name}</g:link></span>
								</g:each>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.maxBalance}">
						<li class="fieldcontain">
							<span id="maxBalance-label" class="property-label"><g:message code="product.maxBalance.label" default="Max Balance" /></span>
							
								<span class="property-value" aria-labelledby="maxBalance-label"><g:formatNumber format="###,###,##0.00" number="${productInstance?.maxBalance}"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.maxOpen}">
						<li class="fieldcontain">
							<span id="maxOpen-label" class="property-label"><g:message code="product.maxOpen.label" default="Max Open" /></span>
							
								<span class="property-value" aria-labelledby="maxOpen-label"><g:fieldValue bean="${productInstance}" field="maxOpen"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.maxTerm}">
						<li class="fieldcontain">
							<span id="maxTerm-label" class="property-label"><g:message code="product.maxTerm.label" default="Max Term" /></span>
							
								<span class="property-value" aria-labelledby="maxTerm-label"><g:formatNumber format="#####" number="${productInstance?.maxTerm}"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.minBalance}">
						<li class="fieldcontain">
							<span id="minBalance-label" class="property-label"><g:message code="product.minBalance.label" default="Min Balance" /></span>
							
								<span class="property-value" aria-labelledby="minBalance-label"><g:formatNumber format="###,###,##0.00" number="${productInstance?.minBalance}"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.minOpen}">
						<li class="fieldcontain">
							<span id="minOpen-label" class="property-label"><g:message code="product.minOpen.label" default="Min Open" /></span>
							
								<span class="property-value" aria-labelledby="minOpen-label"><g:formatNumber format="###,###,##0.00" number="${productInstance?.minOpen}"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.minTerm}">
						<li class="fieldcontain">
							<span id="minTerm-label" class="property-label"><g:message code="product.minTerm.label" default="Min Term" /></span>
							
								<span class="property-value" aria-labelledby="minTerm-label"><g:formatNumber format="#####" number="${productInstance?.minTerm}"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.penaltyIncomeSchemes}">
						<li class="fieldcontain">
							<span id="penaltyIncomeSchemes-label" class="property-label"><g:message code="product.penaltyIncomeSchemes.label" default="Penalty Income Schemes" /></span>
							
								<g:each in="${productInstance.penaltyIncomeSchemes}" var="p">
								<span class="property-value" aria-labelledby="penaltyIncomeSchemes-label">${p?.name}</span>
								</g:each>
							
						</li>
						</g:if>

						<g:if test="${productInstance?.loanProvisionFreq}">
						<li class="fieldcontain">
							<span id="loanProvisionFreq-label" class="property-label"><g:message code="product.loanProvisionFreq.label" default="Loan Provision Freq" /></span>
							
								<span class="property-value" aria-labelledby="loanProvisionFreq-label">${productInstance?.loanProvisionFreq?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.loanReclassFreq}">
						<li class="fieldcontain">
							<span id="loanReclassFreq-label" class="property-label"><g:message code="product.loanReclassFreq.label" default="Loan Reclass Freq" /></span>
							
								<span class="property-value" aria-labelledby="loanReclassFreq-label">${productInstance?.loanReclassFreq?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${productInstance?.loanUidTransferFreq}">
						<li class="fieldcontain">
							<span id="loanUidTransferFreq-label" class="property-label"><g:message code="product.loanUidTransferFreq.label" default="Loan Uid Transfer Freq" /></span>
							
								<span class="property-value" aria-labelledby="loanUidTransferFreq-label">${productInstance?.loanUidTransferFreq?.description}</span>
							
						</li>
						</g:if>

						<g:if test="${productInstance?.configItemStatus}">
						<li class="fieldcontain">
							<span id="configItemStatus-label" class="property-label"><g:message code="product.configItemStatus.label" default="Config Item Status" /></span>
							
								<span class="property-value" aria-labelledby="configItemStatus-label">${productInstance?.configItemStatus?.description}</span>
							
						</li>
						</g:if>
					
						
					
					</ul>
				</div>
				<div class="tab-pane fade in" id="tab_2">
					<ul>
					<g:each in="${productBranches}" var="productBranch" >
						<li>${productBranch.branch.name}</li>
					</g:each>
					</ul>
				</div>
				<div class="tab-pane fade in" id="tab_3">
					<ul>
					<g:each in="${productInstance.customerGroups}" var="customerGroup" >
						<li>${customerGroup.name}</li>
					</g:each>
					</ul>
				</div>
				<div class="tab-pane fade in" id="tab_4">
					<ul>
					<g:each in="${productInstance.txnTemplates}" var="txnTemplate" >
						<li>${txnTemplate.description}</li>
					</g:each>
					</ul>
				</div>	
			</div>
                        <g:form id="delete" url="[resource:productInstance, action:'delete']" method="DELETE">
                        </g:form>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    <g:if test="${productInstance.configItemStatus.id.toInteger() in [1, 2]}">      
                        <li><g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
                        <li><g:actionSubmit id="deleteProduct" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG00703', 'form#delete', 'Override delete Product.', null);
                                },
                                function(){
                                    return;
                                });                                 
                            " /></li>
                    </g:if>
                    <!--
                    <script type="text/javascript">
                    $(document).ready(function() {
                        $( "#deleteProduct" ).click(function() {
                                 checkIfAllowed('CFG00703', 'form#delete', 'Override edit Product.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                    </script>
                    -->
                      <li><g:link action="index">Product Index</g:link></li>
		</ul>
            </content>
	</body>
</html>
