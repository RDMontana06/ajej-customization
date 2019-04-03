<%@ page import="icbs.loans.CreditInvestigation" %>


<legend>Loan Appraisal Credit Summary Details</legend>

<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'collateral', 'has-error')} required">
	<label class="control-label col-sm-4" for="collateral">
		<g:message code="creditInvestigation.collateral.label" default="Collateral Description" />
        </label>
	<div class="col-sm-8"><g:field name="collateral" value="${creditInvestigationInstance?.collateral}" class="form-control"/>

            <g:hasErrors bean="${creditInvestigationInstance}" field="collateral">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="collateral">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>



<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'appraisalDate', 'has-error')} required">
	<label class="control-label col-sm-4" for="appraisalDate">
		<g:message code="creditInvestigation.appraisalDate.label" default="Appraisal Date" />
	</label>
	<div class="col-sm-8"><g:customDatePicker name="appraisalDate" precision="day" class="form-control"  value="${creditInvestigationInstance?.appraisalDate}"  />

            <g:hasErrors bean="${creditInvestigationInstance}" field="appraisalDate">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="appraisalDate">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'appraisedBy', 'has-error')} required">
	<label class="control-label col-sm-4" for="appraisedBy">
		<g:message code="creditInvestigation.appraisedBy.label" default="Appraised By" />
	</label>
	<div class="col-sm-8"><g:field name="appraisedBy" value="${creditInvestigationInstance?.appraisedBy}" class="form-control"/>
            <g:hasErrors bean="${creditInvestigationInstance}" field="appraisedBy">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="appraisedBy">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'appraExeDate', 'has-error')} required">
	<label class="control-label col-sm-4" for="appraExeDate">
		<g:message code="creditInvestigation.appraExeDate.label" default="Appraisal Report Submission" />
	
	</label>
	<div class="col-sm-8"><g:customDatePicker name="appraExeDate" precision="day" class="form-control"  value="${creditInvestigationInstance?.appraExeDate}"  />

            <g:hasErrors bean="${creditInvestigationInstance}" field="appraExeDate">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="appraExeDate">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>



<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'analysName', 'has-error')} required">
	<label class="control-label col-sm-4" for="analysName">
		<g:message code="creditInvestigation.analysName.label" default="Reviewed By" />
		
	</label>
	<div class="col-sm-8"><g:field name="analysName" value="${creditInvestigationInstance?.analysName}" class="form-control"/>

            <g:hasErrors bean="${creditInvestigationInstance}" field="analysName">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="analysName">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'creditSummaryApprover', 'has-error')} required">
	<label class="control-label col-sm-4" for="creditSummaryApprover">
		<g:message code="creditInvestigation.creditSummaryApprover.label" default="Approved By" />
		
	</label>
	<div class="col-sm-8"><g:select id="creditSummaryApprover" name="creditSummaryApprover.id" from="${icbs.lov.Lov.findAllByGroupCodeAndStatus("CSAB",true)}" optionKey="id" optionValue ="itemValue" value="${creditInvestigationInstance?.creditSummaryApprover?.id}"class="form-control"/>
            <g:hasErrors bean="${creditInvestigationInstance}" field="creditSummaryApprover">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="creditSummaryApprover">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>




<div class="fieldcontain form-group ${hasErrors(bean: creditInvestigationInstance, field: 'approvalDate', 'has-error')} ">
	<label class="control-label col-sm-4" for="approvalDate">
		<g:message code="creditInvestigation.approvalDate.label" default="Approval Date" />
		
	</label>
	<div class="col-sm-8"><g:customDatePicker name="approvalDate" precision="day" class="form-control"  value="${creditInvestigationInstance?.approvalDate}"  />

            <g:hasErrors bean="${creditInvestigationInstance}" field="approvalDate">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${creditInvestigationInstance}" field="approvalDate">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>







