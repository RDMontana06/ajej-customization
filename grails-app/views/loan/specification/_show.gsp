<legend>Loan Specification</legend>
						
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.accountNo.label" default="Account No." />
	</label>

	<span>${loanInstance?.accountNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.pnNo.label" default="PN No." />
	</label>

	<span>${loanInstance?.pnNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.product.label" default="Product" />
	</label>

	<span><g:link controller="product" action="show" id="${loanApplicationInstance?.product?.id}">${loanApplicationInstance?.product?.name}</g:link></span>
</div>


<g:if test="${loanInstance?.branch?.id == null}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.branch.label" default="Branch" />
	</label>

	<span><g:link controller="branch" action="show" id="${loanApplicationInstance?.branch?.id}">${loanApplicationInstance?.branch?.name}</g:link></span>
</div>
 </g:if>
  <g:else>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.branch.label" default="Branch" />
	</label>

	<span><g:link controller="branch" action="show" id="${loanInstance?.branch?.id}">${loanInstance?.branch?.name}</g:link></span>
</div>
 </g:else>  


<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.currency.label" default="Currency" />
	</label>

	<span>${loanInstance?.currency?.name}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.grantedAmount.label" default="Granted Amount" />
	</label>

	<span><g:formatNumber format="###,###,##0.00" number="${loanInstance?.grantedAmount}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.ownershipType.label" default="Ownership Type" />
	</label>

	<span>${loanInstance?.ownershipType?.description}</span>
</div>

<%--<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.numberOfOwners.label" default="No. of Owners" />
	</label>

	<span>${loanInstance?.numberOfOwners}</span>
</div>--%>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.interestIncomeScheme.label" default="Interest Income Scheme" />
	</label>

	<span><g:link controller="interestIncomeScheme" action="show" id="${loanInstance?.interestIncomeScheme?.id}">${loanInstance?.interestIncomeScheme?.name}</g:link></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.currentPenaltyScheme.label" default="Current Penalty Income Scheme" />
	</label>

	<span><g:link controller="penaltyIncomeScheme" action="show" id="${loanInstance?.currentPenaltyScheme?.id}">${loanInstance?.currentPenaltyScheme?.name}</g:link></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.pastDuePenaltyScheme.label" default="Past Due Penalty Income Scheme" />
	</label>

	<span><g:link controller="penaltyIncomeScheme" action="show" id="${loanInstance?.pastDuePenaltyScheme?.id}">${loanInstance?.pastDuePenaltyScheme?.name}</g:link></span>
</div>

<%--<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.amortizedChargeScheme.label" default="Amortized Charge Scheme" />
	</label>

	<span>${loanInstance?.amortizedChargeScheme?.name}</span>
</div>--%>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.interestRate.label" default="Interest Rate" />
	</label>

	<span><g:formatNumber format="###,###,##0.00" number="${loanInstance?.interestRate}"/> %</span>
</div>

<g:if test="${loanInstance?.currentPenaltyScheme?.type?.id == 1}">
<div class="fieldcontain form-group">	
	<label class="control-label col-sm-4">
		<g:message code="loan.penaltyAmount.label" default="Penalty Amount" />
	</label>

	<span><g:formatNumber format="###,###,##0.00" number="${loanInstance?.penaltyAmount}"/></span>
</div>
</g:if>

<g:elseif test="${loanInstance?.currentPenaltyScheme?.type?.id == 1}">
<div>
	<label class="control-label col-sm-4">
		<g:message code="loan.penaltyRate.label" default="Penalty Rate" />
	</label>

	<span>${loanInstance?.penaltyRate} %</span>
</div>
</g:elseif>

<%--<g:if test="${loanInstance?.amortizedChargeScheme?.type?.id == 1}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.serviceCharge.label" default="Service Charge Amount" />
	</label>

	<span>${loanInstance?.amortizedChargeScheme?.amount}</span>
</div>	
</g:if>

<g:elseif test="${loanInstance?.amortizedChargeScheme?.type?.id == 2}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.serviceCharge.label" default="Service Charge Rate" />
	</label>

	<span>${loanInstance?.amortizedChargeScheme?.rate} %</span>
</div>	
</g:elseif>--%>

<g:else>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.serviceCharge.label" default="Service Charge Amount" />
	</label>

	<span><g:formatNumber format="###,###,##0.00" number="${loanInstance?.serviceCharge}"/></span>
</div>	
</g:else>


<g:if test="${loanInstance?.interestIncomeScheme?.installmentCalcType?.id == 1}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.term.label" default="Term" />
	</label>

	<span>${loanInstance?.term}</span>
</div>
</g:if>

<g:else>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.frequency.label" default="Frequency" />
	</label>

	<span>${loanInstance?.frequency?.description}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.numInstallments.label" default="No. of Installments" />
	</label>

	<span>${loanInstance?.numInstallments}</span>
</div>

<g:if test="${loanInstance?.interestIncomeScheme?.installmentCalcType?.id == 2 || loanInstance?.interestIncomeScheme?.installmentCalcType?.id == 5}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.balloonInstallments.label" default="Balloon Installments" />
	</label>

	<span>${loanInstance?.balloonInstallments}</span>
</div>
</g:if>

</g:else>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.applicationDate.label" default="Processing Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanInstance?.applicationDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.openingDate.label" default="Opening Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanInstance?.openingDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.interestStartDate.label" default="Interest Start Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanInstance?.interestStartDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.firstInstallmentDate.label" default="First Installment Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanInstance?.firstInstallmentDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.maturityDate.label" default="Maturity Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanInstance?.maturityDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loan.status.label" default="Status" />
	</label>

	<span id="Loan_Stat" value="${loanInstance?.status?.description}" >${loanInstance?.status?.description}</span>
</div>