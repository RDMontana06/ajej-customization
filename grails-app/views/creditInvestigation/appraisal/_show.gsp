<legend>Loan Credit Summary Appraisal</legend>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.collateral.label" default="Collateral Description" /></label>
	<span><g:message code="${creditInvestigationInstance?.collateral}"/></span>	
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.appraisalDate.label" default="Appraisal Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.appraisalDate}"/></span>	
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.appraisedBy.label" default="Appraised By" /></label>
	<span>${creditInvestigationInstance?.appraisedBy}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.appraExeDate.label" default="Appraisal Report Submission" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.appraExeDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.analysName.label" default="Reviewed By" /></label>
	<span>${creditInvestigationInstance?.analysName}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.approvedBy.label" default="Approved By" /></label>
	<span><g:message code="${creditInvestigationInstance?.creditSummaryApprover?.itemValue}"/></span>	
</div>
<!--
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.creditComBDate.label" default="Credit Com B Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.creditComBDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.creditComADate.label" default="Credit Com A Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.creditComADate}"/></span>
</div> -->
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.approvalDate.label" default="Approval Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.approvalDate}"/></span>
</div>

<td></td>
<td></td>
<td></td>
<!--
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.dateCreated.label" default="Date Created" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.dateCreated}"/></span>
</div>
-->