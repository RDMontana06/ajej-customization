
<%@ page import="icbs.admin.Policy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'policy.label', default: 'Policy')}" />
		<title>Policy Information</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/policy')}">Policy Management</a>
          <span class="fa fa-chevron-right"></span><span class="current">Policy Information</span>
		</content>

	<content tag="main-content">   
		<div id="show-policy" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="nav-tab-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Policy Details</a></li>
                <g:if test="${policyInstance.policyTemplate.type.toString() == 'TXN'}">
                	<li id="txntab"><a href="#tab_2" data-toggle="tab">Transactions</a></li>
                </g:if>
                <li><a href="#tab_3" data-toggle="tab">Roles</a></li>
                <li><a href="#tab_4" data-toggle="tab">Approvers</a></li>
              </ul>
            </div>

            <div class="tab-content">
            	<div class="tab-pane active fade in" id="tab_1">

					<ul class="property-list policy">
					
						<g:if test="${policyInstance?.policyTemplate}">
						<li class="fieldcontain">
							<span id="policyTemplate-label" class="property-label"><g:message code="policy.policyTemplate.label" default="Policy Template" /></span>
							
								<span class="property-value" aria-labelledby="policyTemplate-label">${policyInstance?.policyTemplate?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${policyInstance?.description}">
						<li class="fieldcontain">
							<span id="description-label" class="property-label"><g:message code="policy.description.label" default="Description" /></span>
							
								<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${policyInstance}" field="description"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${policyInstance?.txnAmtCondition}">
						<li class="fieldcontain">
							<span id="txnAmtCondition-label" class="property-label"><g:message code="policy.txnAmtCondition.label" default="Txn Amt Condition" /></span>
							
								<span class="property-value" aria-labelledby="txnAmtCondition-label"><g:fieldValue bean="${policyInstance}" field="txnAmtCondition"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${policyInstance?.policyAction}">
						<li class="fieldcontain">
							<span id="policyAction-label" class="property-label"><g:message code="policy.policyAction.label" default="Policy Action" /></span>
							
								<span class="property-value" aria-labelledby="policyAction-label">${policyInstance?.policyAction?.description}</span>
							
						</li>
						</g:if>
					
						<g:if test="${policyInstance?.reference}">
						<li class="fieldcontain">
							<span id="reference-label" class="property-label"><g:message code="policy.reference.label" default="Reference" /></span>
							
								<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${policyInstance}" field="reference"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${policyInstance?.configItemStatus}">
						<li class="fieldcontain">
							<span id="configItemStatus-label" class="property-label"><g:message code="policy.configItemStatus.label" default="Config Item Status" /></span>
							
								<span class="property-value" aria-labelledby="configItemStatus-label">${policyInstance?.configItemStatus?.description}</span>
							
						</li>
						</g:if>
					
					</ul>
				</div>

				<div class="tab-pane fade in" id="tab_2">
            		<ul>
					<g:each in="${policyInstance.txnTemplates}" var="txnTemplate" >
						<li>${txnTemplate.description}</li>
					</g:each>
					</ul>
            	</div>

            	<div class="tab-pane fade in" id="tab_3">
            		<ul>
					<g:each in="${policyInstance.roles}" var="role" >
						<li>${role.name}</li>
					</g:each>
					</ul>
            	</div>

            	<div class="tab-pane fade in" id="tab_4">
            		<ul>
					<g:each in="${policyInstance.approvers}" var="approver" >
						<li>${approver.name}</li>
					</g:each>
					</ul>
            	</div>

            	

			</div>

			<g:form id="remove" url="[resource:policyInstance, action:'delete']" method="DELETE">
			</g:form>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                	<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                	<!-- <li><g:link class="edit" action="edit" resource="${policyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
                	<li><g:actionSubmit id="deletePolicy"  resource="${policyInstance}" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" /></li> -->
                        <g:if test="${policyInstance?.configItemStatus?.id == 1 || policyInstance?.configItemStatus?.id == 2}">
                            <li><g:actionSubmit id="deletePolicy" form="show" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('ADM00404', 'form#remove', 'Remove policy.', null);
                                },
                                function(){
                                    return;
                                });                                       
                                " /></li>
                        </g:if>    
                </ul>
                <!--
                <script type="text/javascript">
                    $(document).ready(function() {
                           $( "#deletePolicy" ).click(function() {
                              checkIfAllowed('ADM00404', 'form#remove', 'Remove holiday.', null); // params: policyTemplate.code, form to be saved
                           });
                    });
                </script>
                -->
            </content>
	</body>
</html>
