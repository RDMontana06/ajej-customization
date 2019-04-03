
<%@ page import="icbs.loans.CreditInvestigation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'creditInvestigation.label', default: 'CreditInvestigation')}" />
		<title>View Loan Credit Summary</title>
	</head>
	<body>
        <content tag="main-content">   
		<div id="show-creditInvestigation" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                <div class="box-body">
                    <div class="alert alert-info alert-dismissable">
                        <i class="fa fa-info"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Message</b> <div class="message" role="status">${flash.message}</div>
                    </div>
                </div>
            </g:if>
			<div class="nav-tab-container">
                <ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1" data-toggle="tab">CI Details</a></li>
                    <li><a href="#tab_4" data-toggle="tab">Appraisal Details</a></li>
               		<li><a href="#tab_2" data-toggle="tab">Attachments</a></li>
                	<li><a href="#tab_3" data-toggle="tab">Checklist</a></li>
                    <li><a href="#tab_5" data-toggle="tab">CRAM Report</a></li>
                </ul>
            </div>
            <div class="tab-content">
				<div class="tab-pane active fade in table-responsive" id="tab_1">
                    <g:render template="details/show"/>
                </div>
                <div class="tab-pane" id="tab_4">
                    <g:render template="appraisal/show"/>
                </div>
                <div class="tab-pane" id="tab_2">
                    <g:render template="attachments/show"/>
                </div>
                <div class="tab-pane" id="tab_3">
                    <g:render template="checklist/show" model="[creditInvestigationInstance:creditInvestigationInstance]"/>
                </div>
                <div class="tab-pane" id="tab_5">
                        <g:render template="cram/show"/> 
                </div>
			</div>			
		</div>
        </content>
         <content tag="main-actions">
            <ul>
                <li><g:link class="list" action="index">Search Loan Credit Summary</g:link></li>
                <li><g:link action="edit" controller="creditInvestigation" id="${creditInvestigationInstance.id}">Update Loan Credit Summary</g:link></li>
                <li><g:link target="_blank" action="printAMLACheckList" controller="creditInvestigation" id="${creditInvestigationInstance.id}">Print Loan Credit Summary</g:link></li>
	    </ul>
    	</content>
	</body>
</html>
