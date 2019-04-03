
<legend>Loan Specification</legend>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.customer.label" default="Customer" />
	</label>

	<span><g:link controller="customer" action="customerInquiry" id="${loanApplicationInstance?.customer?.id}">${loanApplicationInstance?.customer?.displayName}</g:link></span>
</div>

<div id="customer-info">
    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Date of Birth</span>
        <span id="birth-date"></span>
    </div>
       
    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Address</span>
        <span id="address"></span>
    </div>

    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Photo</span>
        <span id="photo"></span>
    </div>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.product.label" default="Product" />
	</label>

	<span><g:link controller="product" action="show" id="${loanApplicationInstance?.product?.id}">${loanApplicationInstance?.product?.name}</g:link></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.branch.label" default="Branch" />
	</label>

	<span><g:link controller="branch" action="show" id="${loanApplicationInstance?.branch?.id}">${loanApplicationInstance?.branch?.name}</g:link></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.currency.label" default="Currency" />
	</label>

	<span>${loanApplicationInstance?.currency?.name}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.amount.label" default="Amount" />
	</label>

	<span><g:formatNumber format="###,##0.00" number="${loanApplicationInstance?.amount}" /></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.term.label" default="Term in Months (Days)" />
	</label>

	<span><g:fieldValue bean="${loanApplicationInstance}" field="term"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.purpose.label" default="Purpose" />
	</label>

	<span><g:fieldValue bean="${loanApplicationInstance}" field="purpose"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.accountOfficer.label" default="Account Officer" />
	</label>

	<span><g:fieldValue bean="${loanApplicationInstance}" field="accountOfficer"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.applicationDate.label" default="Application Date" />
	</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${loanApplicationInstance.applicationDate}"/></span>
</div>

<g:if test="${loanApplicationInstance.product?.id == 66 ||
              loanApplicationInstance.product?.id == 67 ||
              loanApplicationInstance.product?.id == 74 ||
              loanApplicationInstance.product?.id == 78 }">
<div class="fieldcontain form-group">
        <label class="control-label col-sm-4">
		<g:message code="loanApplication.applicationMaturityDate.label" default="Maturity Date" />
	</label>
	<span><g:formatDate format="MM/dd/yyyy" date="${loanApplicationInstance.applicationDate.plus(loanApplicationInstance.term)}"/></span>
</div> 
        </g:if>


<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.status.label" default="Status" />
	</label>

	<span>${loanApplicationInstance?.approvalStatus?.description}</span>
</div>

<g:if test="${comakers}">
<legend>Co-Makers</legend>
<g:each var="comaker" in="${comakers}">
<div class="form-group">
<div class="col-sm-6">     
    <g:link controller="customer" action="customerInquiry" id="${comaker?.customer?.id}">${comaker.customer?.displayName}</g:link></span>
</div>
</div>
</g:each>
</g:if>
		
