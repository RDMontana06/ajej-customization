
<%@ page import="icbs.deposit.Deposit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deposit.label', default: 'Deposit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-deposit" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                            <!-- <div class="message" role="status">${flash.message}</div> -->
                            <script>
                                $(function(){
                                    var x = '${flash.message}';
                                        notify.message(x);
                                });
                            </script>
			</g:if>
			<ol class="property-list deposit">
			
				<g:if test="${depositInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="deposit.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${depositInstance?.customer?.id}">${depositInstance?.customer?.id.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.signatories}">
				<li class="fieldcontain">
					<span id="signatories-label" class="property-label"><g:message code="deposit.depositSignatoryRules.label" default="Sig Rules" /></span>
					
						<g:each in="${depositInstance.signatories}" var="s">
						<span class="property-value" aria-labelledby="signatories-label"><g:link controller="signatories" action="show" id="${s.id}">${s.id}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="deposit.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${depositInstance?.branch?.id}">${depositInstance?.branch?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="deposit.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="depositType" action="show" id="${depositInstance?.type?.id}">${depositInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.acctNo}">
				<li class="fieldcontain">
					<span id="acctNo-label" class="property-label"><g:message code="deposit.acctNo.label" default="Acct No" /></span>
					
						<span class="property-value" aria-labelledby="acctNo-label"><g:fieldValue bean="${depositInstance}" field="acctNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.acctName}">
				<li class="fieldcontain">
					<span id="acctName-label" class="property-label"><g:message code="deposit.acctName.label" default="Acct Name" /></span>
					
						<span class="property-value" aria-labelledby="acctName-label"><g:fieldValue bean="${depositInstance}" field="acctName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.acctNoFormat}">
				<li class="fieldcontain">
					<span id="acctNoFormat-label" class="property-label"><g:message code="deposit.acctNoFormat.label" default="Acct No Format" /></span>
					
						<span class="property-value" aria-labelledby="acctNoFormat-label"><g:link controller="acctNoFormat" action="show" id="${depositInstance?.acctNoFormat?.id}">${depositInstance?.acctNoFormat?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.ownershipType}">
				<li class="fieldcontain">
					<span id="ownershipType-label" class="property-label"><g:message code="deposit.ownershipType.label" default="Ownership Type" /></span>
					
						<span class="property-value" aria-labelledby="ownershipType-label"><g:link controller="ownershipType" action="show" id="${depositInstance?.ownershipType?.id}">${depositInstance?.ownershipType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.signatories}">
				<li class="fieldcontain">
					<span id="sigRules-label" class="property-label"><g:message code="deposit.signatories.label" default="Signatories" /></span>
					
						<span class="property-value" aria-labelledby="signatories-label"><g:fieldValue bean="${depositInstance}" field="signatories"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.sigRemarks}">
				<li class="fieldcontain">
					<span id="sigRemarks-label" class="property-label"><g:message code="deposit.sigRemarks.label" default="Sig Remarks" /></span>
					
						<span class="property-value" aria-labelledby="sigRemarks-label"><g:fieldValue bean="${depositInstance}" field="sigRemarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.depositInterestScheme}">
				<li class="fieldcontain">
					<span id="depositInterestScheme-label" class="property-label"><g:message code="deposit.depositInterestScheme.label" default="Deposit Interest Scheme" /></span>
					
						<span class="property-value" aria-labelledby="depositInterestScheme-label"><g:link controller="depositInterestScheme" action="show" id="${depositInstance?.depositInterestScheme?.id}">${depositInstance?.depositInterestScheme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.depositTaxChargeScheme}">
				<li class="fieldcontain">
					<span id="depositTaxChargeScheme-label" class="property-label"><g:message code="deposit.depositTaxChargeScheme.label" default="Deposit Tax Charge Scheme" /></span>
					
						<span class="property-value" aria-labelledby="depositTaxChargeScheme-label"><g:link controller="depositTaxFeeAndChargeScheme" action="show" id="${depositInstance?.depositTaxChargeScheme?.id}">${depositInstance?.depositTaxChargeScheme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.fixedDepositPreTermScheme}">
				<li class="fieldcontain">
					<span id="fixedDepositPreTermScheme-label" class="property-label"><g:message code="deposit.fixedDepositPreTermScheme.label" default="Fixed Deposit Pre Term Scheme" /></span>
					
						<span class="property-value" aria-labelledby="fixedDepositPreTermScheme-label"><g:link controller="fixedDepositPreTermScheme" action="show" id="${depositInstance?.fixedDepositPreTermScheme?.id}">${depositInstance?.fixedDepositPreTermScheme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.dateOpened}">
				<li class="fieldcontain">
					<span id="dateOpened-label" class="property-label"><g:message code="deposit.dateOpened.label" default="Date Opened" /></span>
					
						<span class="property-value" aria-labelledby="dateOpened-label"><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.dateOpened}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.dateClosed}">
				<li class="fieldcontain">
					<span id="dateClosed-label" class="property-label"><g:message code="deposit.dateClosed.label" default="Date Closed" /></span>
					
						<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.dateClosed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="deposit.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="depositStatus" action="show" id="${depositInstance?.status?.id}">${depositInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.statusChangeDate}">
				<li class="fieldcontain">
					<span id="statusChangeDate-label" class="property-label"><g:message code="deposit.statusChangeDate.label" default="Status Change Date" /></span>
					
						<span class="property-value" aria-labelledby="statusChangeDate-label"><g:formatDate date="${depositInstance?.statusChangeDate}" /></span>
					
				</li>
				</g:if>
					
				<g:if test="${depositInstance?.ledgerBalAmt}">
				<li class="fieldcontain">
					<span id="ledgerBalAmt-label" class="property-label"><g:message code="deposit.ledgerBalAmt.label" default="Ledger Bal Amt" /></span>
					
						<span class="property-value" aria-labelledby="ledgerBalAmt-label"><g:fieldValue bean="${depositInstance}" field="ledgerBalAmt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.availableBalAmt}">
				<li class="fieldcontain">
					<span id="availableBalAmt-label" class="property-label"><g:message code="deposit.availableBalAmt.label" default="Available Bal Amt" /></span>
					
						<span class="property-value" aria-labelledby="availableBalAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositInstance?.availableBalAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.passbookBalAmt}">
				<li class="fieldcontain">
					<span id="passbookBalAmt-label" class="property-label"><g:message code="deposit.passbookBalAmt.label" default="Passbook Bal Amt" /></span>
					
						<span class="property-value" aria-labelledby="passbookBalAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositInstance?.passbookBalAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.interestBalAmt}">
				<li class="fieldcontain">
					<span id="interestBalAmt-label" class="property-label"><g:message code="deposit.interestBalAmt.label" default="Interest Bal Amt" /></span>
					
						<span class="property-value" aria-labelledby="interestBalAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositInstance?.interestBalAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.lmAveBalAmt}">
				<li class="fieldcontain">
					<span id="lmAveBalAmt-label" class="property-label"><g:message code="deposit.lmAveBalAmt.label" default="Lm Ave Bal Amt" /></span>
					
						<span class="property-value" aria-labelledby="lmAveBalAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositInstance?.lmAveBalAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.interestRate}">
				<li class="fieldcontain">
					<span id="interestRate-label" class="property-label"><g:message code="deposit.interestRate.label" default="Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="interestRate-label"><g:formatNumber format="#,##0.00000" number="${depositInstance?.interestRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.acrintAmt}">
				<li class="fieldcontain">
					<span id="acrintAmt-label" class="property-label"><g:message code="deposit.acrintAmt.label" default="Acrint Amt" /></span>
					
						<span class="property-value" aria-labelledby="acrintAmt-label"><g:formatNumber format="###,###,##0.00" number="${depositInstance?.acrintAmt}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.acrintDate}">
				<li class="fieldcontain">
					<span id="acrintDate-label" class="property-label"><g:message code="deposit.acrintDate.label" default="Acrint Date" /></span>
					
						<span class="property-value" aria-labelledby="acrintDate-label"><g:formatDate date="${depositInstance?.acrintDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.debitAcrintAmt}">
				<li class="fieldcontain">
					<span id="debitAcrintAmt-label" class="property-label"><g:message code="deposit.debitAcrintAmt.label" default="Debit Acrint Amt" /></span>
					
						<span class="property-value" aria-labelledby="debitAcrintAmt-label"><g:fieldValue bean="${depositInstance}" field="debitAcrintAmt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.debitAcrintDate}">
				<li class="fieldcontain">
					<span id="debitAcrintDate-label" class="property-label"><g:message code="deposit.debitAcrintDate.label" default="Debit Acrint Date" /></span>
					
						<span class="property-value" aria-labelledby="debitAcrintDate-label"><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.debitAcrintDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.passbooks}">
				<li class="fieldcontain">
					<span id="passbooks-label" class="property-label"><g:message code="deposit.passbooks.label" default="Passbooks" /></span>
					
						<g:each in="${depositInstance.passbooks}" var="p">
						<span class="property-value" aria-labelledby="passbooks-label"><g:link controller="passbook" action="show" id="${p.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.txnWithdrawalsCounterMonthly}">
				<li class="fieldcontain">
					<span id="txnWithdrawalsCounterMonthly-label" class="property-label"><g:message code="deposit.txnWithdrawalsCounterMonthly.label" default="Txn Withdrawals Counter Monthly" /></span>
					
						<span class="property-value" aria-labelledby="txnWithdrawalsCounterMonthly-label"><g:fieldValue bean="${depositInstance}" field="txnWithdrawalsCounterMonthly"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.txnWithdrawalsCounterCummulative}">
				<li class="fieldcontain">
					<span id="txnWithdrawalsCounterCummulative-label" class="property-label"><g:message code="deposit.txnWithdrawalsCounterCummulative.label" default="Txn Withdrawals Counter Cummulative" /></span>
					
						<span class="property-value" aria-labelledby="txnWithdrawalsCounterCummulative-label"><g:fieldValue bean="${depositInstance}" field="txnWithdrawalsCounterCummulative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.lastCapitalizationDate}">
				<li class="fieldcontain">
					<span id="lastCapitalizationDate-label" class="property-label"><g:message code="deposit.lastCapitalizationDate.label" default="Last Capitalization Date" /></span>
					
						<span class="property-value" aria-labelledby="lastCapitalizationDate-label"><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.lastCapitalizationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="deposit.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${depositInstance}" field="currency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.isSweep}">
				<li class="fieldcontain">
					<span id="isSweep-label" class="property-label"><g:message code="deposit.isSweep.label" default="Is Sweep" /></span>
					
						<span class="property-value" aria-labelledby="isSweep-label"><g:formatBoolean boolean="${depositInstance?.isSweep}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.txnDepCounterCummulative}">
				<li class="fieldcontain">
					<span id="txnDepCounterCummulative-label" class="property-label"><g:message code="deposit.txnDepCounterCummulative.label" default="Txn Dep Counter Cummulative" /></span>
					
						<span class="property-value" aria-labelledby="txnDepCounterCummulative-label"><g:fieldValue bean="${depositInstance}" field="txnDepCounterCummulative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInstance?.txnDepCounterMonthly}">
				<li class="fieldcontain">
					<span id="txnDepCounterMonthly-label" class="property-label"><g:message code="deposit.txnDepCounterMonthly.label" default="Txn Dep Counter Monthly" /></span>
					
						<span class="property-value" aria-labelledby="txnDepCounterMonthly-label"><g:fieldValue bean="${depositInstance}" field="txnDepCounterMonthly"/></span>
					
				</li>
				</g:if>
			
			</ol>
                        <!--
			<g:form url="[resource:depositInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${depositInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                        </-->
		</div>
            </content>
             <content tag="main-actions">
                 <ul>
                    <li><g:link  action="depositInquiry" id="${depositInstance.id}" resource="${depositInstance}">Proceed to Deposit Inquiry</g:link><li>
                    <li><g:link class="edit" action="edit" resource="${depositInstance}"><g:message code="default.button.edit.label" default="Edit" /> this Deposit Account</g:link></li>
                </ul>
            </content>
	</body>
</html>