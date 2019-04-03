

<%@ page import="icbs.lov.LoanFreq" %>
<%@ page import="icbs.lov.ConfigItemStatus" %>
<%@ page import="icbs.admin.Product" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'loanPerformanceClassification.label', default: 'LoanPerformanceClassification')}" />
		<title>View Loan Performance Classification</title>
	</head>
	<body>
		<content tag="main-content">
		<div class="content scaffold-show" role="main">
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
            		<li class="active"><a href="#tab_1" data-toggle="tab">Details</a></li>
            		<li><a href="#tab_2" data-toggle="tab">Products</a></li>
          		</ul>
          	</div>
			<div class="tab-content">
    			<div class="tab-pane active fade in" id="tab_1">		
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.code.label" default="Code" /></label>
						<span><g:fieldValue bean="${loanPerformanceClassificationInstance}" field="code"/></span>
					</div>
				
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.name.label" default="Name" /></label>
						<span><g:fieldValue bean="${loanPerformanceClassificationInstance}" field="name"/></span>
					</div>
				
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.prevClassification.label" default="Previous Classification" /></label>
						<span>${loanPerformanceClassificationInstance?.prevClassification?.description}</span>
					</div>
				
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.newClassification.label" default="New Classification" /></label>
						<span>${loanPerformanceClassificationInstance?.newClassification?.description}</span>
					</div>

					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.type.label" default="Type" /></label>
						<span>${loanPerformanceClassificationInstance?.type?.description}</span>
					</div>

					<g:if test="${loanPerformanceClassificationInstance.type.id == 1}">
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.thresholdAmount.label" default="Threshold Amount" /></label>
						<span><g:fieldValue bean="${loanPerformanceClassificationInstance}" field="thresholdAmount"/></span>
					</div>
					</g:if>

					<g:elseif test="${loanPerformanceClassificationInstance.type.id == 2}">
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.thresholdFreq.label" default="Threshold Frequency" /></label>
						<span><g:fieldValue bean="${loanPerformanceClassificationInstance}" field="thresholdFreq"/></span>					
					</div>
					</g:elseif>

					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="loanPerformanceClassification.status.label" default="Status" /></label>
						<span>${loanPerformanceClassificationInstance?.status?.description}</span>
					</div>
				</div>	
				<div class="tab-pane fade in" id="tab_2">	
					<ul>
						<g:each in="${loanPerformanceClassificationInstance?.products}" var="product">
						<li>${product?.name}</li>
						</g:each>
					</ul>	
				</div>		
			</div>
			<%--<g:form url="[resource:loanPerformanceClassificationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary edit" action="edit" resource="${loanPerformanceClassificationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-primary delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
		</div>
		</content>
		<content tag="main-actions">
      		<ul>
      			<li><g:link class="list" action="index">Search Loan Performance Classification</g:link></li>
                <li><g:link action="edit" controller="loanPerformanceClassification" id="${loanPerformanceClassificationInstance.id}">Update Loan Performance Classification</g:link></li>

                <g:if test="${loanPerformanceClassificationInstance.status.id == 1}">
                <li><g:form url="[controller:loanPerformanceClassification, id:loanPerformanceClassificationInstance.id, action:'activate']" method="POST">
					<g:actionSubmit action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form></li>
                </g:if>

                <g:if test="${loanPerformanceClassificationInstance.status.id.toInteger() in [1, 2]}">
                <li><g:form url="[controller:loanPerformanceClassification, id:loanPerformanceClassificationInstance.id, action:'delete']" method="POST">
					<g:actionSubmit action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form></li>
				</g:if>
	       	</ul>
	    </content>
	</body>
</html>