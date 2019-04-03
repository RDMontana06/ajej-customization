<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Account No.</label>

	<span>${collateralInstance?.holdout?.accountNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Account Type</label>

	<span>${collateralInstance?.holdout?.accountType}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Amount</label>

	<span><g:formatNumber format="###,###,##0.00" number="${collateralInstance?.holdout?.amount}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Bank</label>

	<span>${collateralInstance?.holdout?.bank}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">On Us</label>

	<span><g:formatBoolean boolean="${collateralInstance?.holdout?.onUs}" /></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Holdout Date</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${collateralInstance?.holdout?.holdoutDate}"/></span>
</div>