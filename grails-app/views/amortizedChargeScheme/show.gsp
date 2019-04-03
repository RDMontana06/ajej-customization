
<%@ page import="icbs.loans.AmortizedChargeScheme" %>
<%@ page import="icbs.lov.LoanServiceChargeType" %>
<%@ page import="icbs.lov.LoanServiceChargeBasis" %>
<%@ page import="icbs.lov.LoanInstallmentFreq" %>
<%@ page import="icbs.lov.ConfigItemStatus" %>
<%@ page import="icbs.admin.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'amortizedChargeScheme.label', default: 'AmortizedChargeScheme')}" />
		<title>View Amortized Charge Scheme</title>
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
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.code.label" default="Code" /></label>					
						<span><g:fieldValue bean="${amortizedChargeSchemeInstance}" field="code"/></span>		
					</div>
				
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.name.label" default="Name" /></label>
						<span><g:fieldValue bean="${amortizedChargeSchemeInstance}" field="name"/></span>		
					</div>
				
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.basis.label" default="Basis" /></label>					
						<span>${amortizedChargeSchemeInstance?.basis?.description}</span>					
					</div>
				
					<%--<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.frequency.label" default="Frequency" /></label>					
						<span>${amortizedChargeSchemeInstance?.frequency?.description}</span>					
					</div>--%>

					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.type.label" default="Service Charge Type" /></label>					
						<span>${amortizedChargeSchemeInstance?.type?.description}</span>
					</div>

					<g:if test="${amortizedChargeSchemeInstance.type.id == 1}">
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.amount.label" default="Service Charge Amount" /></label>					
						<span><g:fieldValue bean="${amortizedChargeSchemeInstance}" field="amount"/></span>		
					</div>
					</g:if>

					<g:elseif test="${amortizedChargeSchemeInstance.type.id == 2}">
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.rate.label" default="Service Charge Rate" /></label>					
						<span><g:fieldValue bean="${amortizedChargeSchemeInstance}" field="rate"/>%</span>
					</div>
					</g:elseif>
									
					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.hasEirMode.label" default="EIR Mode" /></label>					
						<span><g:formatBoolean boolean="${amortizedChargeSchemeInstance?.hasEirMode}" /></span>	
					</div>

					<div class="fieldcontain form-group">
						<label class="control-label col-sm-4"><g:message code="amortizedChargeScheme.status.label" default="Status" /></label>					
						<span>${amortizedChargeSchemeInstance?.status?.description}</span>	
					</div>
				</div>
				<div class="tab-pane fade in" id="tab_2">	
					<ul>
						<g:each in="${amortizedChargeSchemeInstance?.products}" var="product">
						<li>${product?.name}</li>
						</g:each>
					</ul>	
				</div>
			</div>
			<%--<g:form url="[resource:amortizedChargeSchemeInstance, action:'delete']" method="DELETE">				
				<fieldset class="buttons">
					<g:link class="btn btn-primary edit" action="edit" resource="${amortizedChargeSchemeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-primary delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
		</div>
		</content>
		<content tag="main-actions">
      		<ul>
      		<li><g:link class="list" action="index">Search Amortized Charge Scheme</g:link></li>
                <g:if test="${amortizedChargeSchemeInstance.status.id.toInteger() in [1, 2]}">            
                    <li><g:link action="edit" controller="amortizedChargeScheme" id="${amortizedChargeSchemeInstance.id}">Update Amortized Charge Scheme</g:link></li>
                </g:if>
                <g:if test="${amortizedChargeSchemeInstance.status.id == 1}">
                    <li><g:form id="activate" url="[resource:amortizedChargeSchemeInstance, action:'activate']" method="POST">
                        </g:form>
                        <g:actionSubmit id="activateAmortChargeScheme" action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </li>
                </g:if>

                <g:if test="${amortizedChargeSchemeInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form id="delete" url="[resource:amortizedChargeSchemeInstance, action:'delete']" method="POST">			
                        </g:form>
                    <g:actionSubmit id="deleteAmortChargeScheme" action="delete" value="Delete" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG01204', 'form#delete', 'Override new Check Deposit Clearing Type.', null);
                                },
                                function(){
                                    return;
                                });                        
                        " />
                    </li>
                </g:if>
	       	</ul>
                <script type="text/javascript">
                    $(document).ready(function() {
                        // $( "#deleteAmortChargeScheme" ).click(function() {
                        //         checkIfAllowed('CFG01204', 'form#delete', 'Override new Check Deposit Clearing Type.', null); // params: policyTemplate.code, form to be saved
                        // });
                        $( "#activateAmortChargeScheme" ).click(function() {
                                 checkIfAllowed('CFG01203', 'form#activate', 'Override new Check Deposit Clearing Type.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script>  
	    </content>
	</body>
</html>
