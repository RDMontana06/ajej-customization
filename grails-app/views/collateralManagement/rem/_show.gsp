<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">TCT No.</label>

	<span>${collateralInstance?.rem?.tctNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Lot No.</label>

	<span>${collateralInstance?.rem?.lotNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Location</label>

	<span>${collateralInstance?.rem?.location}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Other Owners</label>

	<span>${collateralInstance?.rem?.otherOwners}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Registry of Deeds</label>

	<span>${collateralInstance?.rem?.registryOfDeeds}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Date of Issuance</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${collateralInstance?.rem?.dateOfIssuance}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Encumberances</label>

	<span>${collateralInstance?.rem?.encumberances}</span>
</div>