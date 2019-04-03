
<div class="fieldcontain form-group" style="display:none">
	<span id="customer-id">${loanApplicationInstance?.customer?.id}</span>
	<span id="product-id">${loanApplicationInstance?.product?.id}</span>
	<span id="loan-amount">${loanApplicationInstance?.amount}</span>
	<span id="loan-term">${loanApplicationInstance?.term}</span>
	<span id="loan-application-date"><g:formatDate format="MM/dd/yyyy" date="${loanApplicationInstance?.applicationDate}"/></span>
        <span id="loan-application-status">${loanApplicationInstance?.approvalStatus?.description}</span>
</div>

<div class="fieldcontain form-group">
    <span class="control-label col-sm-4">Loan Application</span>
    <span id="loan-application"><g:link  controller="loanApplication" action="show" id="${loanApplicationInstance?.id}">${loanApplicationInstance?.id}</g:link></span>
</div>
<div class="fieldcontain form-group">
    <span class="control-label col-sm-4">Customer Name</span>    
    <span id="customer-name2"><g:link controller="customer" action="customerInquiry" id="${loanApplicationInstance?.customer?.id}">${loanApplicationInstance?.customer?.displayName}</g:link></span>
</div>

<div id="customer-info">
    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Date of Birth</span>
        <span id="birth-date"><g:formatDate format="MM/dd/yyyy" date="${loanApplicationInstance?.customer?.birthDate}"/></span>
    </div>

    <g:set var="primaryAddress" value="${loanApplicationInstance?.customer?.addresses?.find{it.isPrimary==true}}"/>
    <g:if test="${primaryAddress}">
    	<g:set var="primaryAddress" value="${primaryAddress?.address1 + ', ' + primaryAddress?.address2 +', ' +primaryAddress?.address3}"/>
	</g:if>
	<g:else>
		<g:set var="primaryAddress" value=""/>
	</g:else>
    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Address</span>
		<span id="address">${primaryAddress}</span>
    </div>

     
    <div class="fieldcontain form-group">
        <span class="control-label col-sm-4">Photo</span>
        <span id="photo">
    	<g:if test="${(loanApplicationInstance?.customer?.attachments?.find{it.isPrimaryPhoto==true})?.id}"> 	
		<img width="140px" height="140px" src="${createLink(controller:'Attachment', action:'show', id: (loanApplicationInstance?.customer?.attachments?.find{it.isPrimaryPhoto==true})?.id )}"/>
		</g:if>
        </span>
    </div>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.product.label" default="Product" />
	</label>

	<span id="product-name2"><g:link controller="product" action="show" id="${loanApplicationInstance?.product?.id}">${loanApplicationInstance?.product?.name}</g:link></span>
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
        <g:if test="${(loanApplicationInstance)}">
	<span><g:formatNumber format="###,###,##0.00" number="${loanApplicationInstance.amount}"/></span>
        </g:if>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.term.label" default="Term" />
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

	<span><g:formatDate format="MM/dd/yyyy" date="${loanApplicationInstance?.applicationDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">
		<g:message code="loanApplication.status.label" default="Status" />
	</label>

	<span>${loanApplicationInstance?.approvalStatus?.description}</span>
</div>

<g:if test="${comakerss}">
<legend>Co-Makers</legend>
<g:each var="comaker" in="${comakerss}">
<div class="form-group">
<div class="col-sm-6">     
    <g:link controller="customer" action="customerInquiry" id="${comaker?.customer?.id}">${comaker.customer?.displayName}</g:link></span>
</div>
</div>
</g:each>
</g:if>
		
		
		
