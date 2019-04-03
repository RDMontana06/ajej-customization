<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Identification No.</label>

	<span>${collateralInstance?.chattel?.identificationNo}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Acquisition Cost</label>

	<span>${collateralInstance?.chattel?.acquisitionCost}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Acquisition Date</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${collateralInstance?.chattel?.acquisitionDate}"/></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Insurance Type</label>

	<span>${collateralInstance?.chattel?.insuranceType}</span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Official Receipt No</label>

	<span>${collateralInstance?.chattel?.orNo}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Official Receipt Date</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${collateralInstance?.chattel?.orDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Certificate of Registration No</label>

	<span>${collateralInstance?.chattel?.crNo}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4">Certificate of Registration Date</label>

	<span><g:formatDate format="MM/dd/yyyy" date="${collateralInstance?.chattel?.crDate}"/></span>
</div>