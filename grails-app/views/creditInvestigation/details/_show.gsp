<legend>Loan Credit Summary Details</legend>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.loanApplication.label" default="Loan Application" /></label>					
	<span><g:link controller="loanApplication" action="show" id="${creditInvestigationInstance?.loanApplication?.id}">${creditInvestigationInstance?.loanApplication?.id}</g:link></span>
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.recommendation.label" default="Recommendation" /></label>
	<span><g:fieldValue bean="${creditInvestigationInstance}" field="recommendation"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.ciScheduleDate.label" default="CI Schedule Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.ciScheduleDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.ciName.label" default="CI Name" /></label>
	<span>${creditInvestigationInstance?.ciName}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.ciExecutionDate.label" default="CI Execution Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.ciExecutionDate}"/></span>
</div>
<!--
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.appraisalDate.label" default="Appraisal Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.appraisalDate}"/></span>	
</div>

<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.appraisedBy.label" default="Appraised By" /></label>
	<span>${creditInvestigationInstance?.appraisedBy}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.loanAnalysisScheduleDate.label" default="Loan Analysis Schedule Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.loanAnalysisScheduleDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.analysName.label" default="Loan Analysist Name" /></label>
	<span>${creditInvestigationInstance?.analysName}</span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.loanAnalysisExecutionDate.label" default="Loan Analysis Execution Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.loanAnalysisExecutionDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.creditComBDate.label" default="Credit Com B Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.creditComBDate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.creditComADate.label" default="Credit Com A Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.creditComADate}"/></span>
</div>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.approvalDate.label" default="Lending Authority Approval Date" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.approvalDate}"/></span>
</div>

<td></td>
<td></td>
<td></td>
<div class="fieldcontain form-group">
	<label class="control-label col-sm-4"><g:message code="creditInvestigation.dateCreated.label" default="Date Created" /></label>
	<span><g:formatDate format="MM/dd/yyyy" date="${creditInvestigationInstance?.dateCreated}"/></span>
</div>
-->














