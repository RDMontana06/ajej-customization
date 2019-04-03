
<%@ page import="icbs.admin.CheckDepositClearingType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'checkDepositClearingType.label', default: 'CheckDepositClearingType')}" />
		<title>Check Deposit Clearing Type Information</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-checkDepositClearingType" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="nav-tab-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Check Deposit Clearing Type Details</a></li>
                %{-- <li><a href="#tab_2" data-toggle="tab">Branches</a></li> --}%
              </ul>
            </div>

            <div class="tab-content">
            	<div class="tab-pane active fade in" id="tab_1">

					<ul class="property-list checkDepositClearingType">
					
						<g:if test="${checkDepositClearingTypeInstance?.code}">
						<li class="fieldcontain">
							<span id="code-label" class="property-label"><g:message code="checkDepositClearingType.code.label" default="Code" /></span>
							
								<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${checkDepositClearingTypeInstance}" field="code"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.description}">
						<li class="fieldcontain">
							<span id="description-label" class="property-label"><g:message code="checkDepositClearingType.description.label" default="Description" /></span>
							
								<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${checkDepositClearingTypeInstance}" field="description"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.shortDescription}">
						<li class="fieldcontain">
							<span id="shortDescription-label" class="property-label"><g:message code="checkDepositClearingType.shortDescription.label" default="Short Description" /></span>
							
								<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${checkDepositClearingTypeInstance}" field="shortDescription"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.isOnUs}">
						<li class="fieldcontain">
							<span id="isOnUs-label" class="property-label"><g:message code="checkDepositClearingType.isOnUs.label" default="Is On Us" /></span>
							
								<span class="property-value" aria-labelledby="isOnUs-label"><g:formatBoolean boolean="${checkDepositClearingTypeInstance?.isOnUs}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.hasVariableClearingDays}">
						<li class="fieldcontain">
							<span id="hasVariableClearingDays-label" class="property-label"><g:message code="checkDepositClearingType.hasVariableClearingDays.label" default="Has Variable Clearing Days" /></span>
							
								<span class="property-value" aria-labelledby="hasVariableClearingDays-label"><g:formatBoolean boolean="${checkDepositClearingTypeInstance?.hasVariableClearingDays}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.clearingDays}">
						<li class="fieldcontain">
							<span id="clearingDays-label" class="property-label"><g:message code="checkDepositClearingType.clearingDays.label" default="Clearing Days" /></span>
							
								<span class="property-value" aria-labelledby="clearingDays-label"><g:fieldValue bean="${checkDepositClearingTypeInstance}" field="clearingDays"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.currency}">
						<li class="fieldcontain">
							<span id="currency-label" class="property-label"><g:message code="checkDepositClearingType.currency.label" default="Currency" /></span>
							
								<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${checkDepositClearingTypeInstance?.currency?.id}">${checkDepositClearingTypeInstance?.currency?.name}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${checkDepositClearingTypeInstance?.configItemStatus}">
						<li class="fieldcontain">
							<span id="configItemStatus-label" class="property-label"><g:message code="checkDepositClearingType.configItemStatus.label" default="Config Item Status" /></span>
							
								<span class="property-value" aria-labelledby="configItemStatus-label">${checkDepositClearingTypeInstance?.configItemStatus?.description}</span>
							
						</li>
						</g:if>
					
					</ul>
				</div>

				%{-- <div class="tab-pane fade in" id="tab_2">
            		<ul>
					<g:each in="${checkDepositClearingTypeInstance.branches}" var="branch" >
						<li>${branch.name}</li>
					</g:each>
					</ul>
            	</div> --}%
				
			</div>
                        <g:form id="delete" url="[resource:checkDepositClearingTypeInstance, action:'delete']" method="DELETE">
		</div>  </g:form>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="edit" action="edit" resource="${checkDepositClearingTypeInstance}"><g:message code="default.button.edit.label" /></g:link></li>
                    <li><g:actionSubmit class="delete" id="deleteDepositClearingType" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG00403', 'form#delete', 'Override delete Check Deposit Clearing Type.', null); 
                                },
                                function(){
                                    return;
                                });                                
                        " /></li>
		</ul>
                <!--
                <script type="text/javascript">
                    $(document).ready(function() {
                        $( "#deleteDepositClearingType" ).click(function() {
                                 checkIfAllowed('CFG00403', 'form#delete', 'Override edit Check Deposit Clearing Type.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script>
                -->
            </content>
	</body>
</html>
