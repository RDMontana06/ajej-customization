<legend>Collateral Details</legend>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Owner</label>

	<span>${collateralInstance?.owner?.displayName}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Type</label>

	<span>${collateralInstance?.collateralType}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Appraised Value</label>
        <span><g:formatNumber format="###,###,##0.00" number="${collateralInstance?.appraisedValue}"/></span>  
</div>

<g:if test="${collateralInstance?.collateralType?.id == 1}">
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Appraised Value Type</label>

	<span>${collateralInstance?.rem?.appraisedValueType?.description}</span>
</div>
</g:if>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Description</label>

	<span>${collateralInstance?.description}</span>
</div>

<g:if test="${collateralInstance?.collateralType?.id == 1}">
	<g:render template="rem/show"/>
</g:if>
<g:elseif test="${collateralInstance?.collateralType?.id == 2}">
	<g:render template="chattel/show"/>
</g:elseif>
<g:elseif test="${collateralInstance?.collateralType?.id == 3}">
	<g:render template="holdout/show"/>
</g:elseif>
<%--<g:elseif test="${collateralInstance?.collateralType?.id == 4}">
	<g:render template="pdc/show"/>
</g:elseif>--%>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Status</label>

	<span>${collateralInstance?.status}</span>
</div>