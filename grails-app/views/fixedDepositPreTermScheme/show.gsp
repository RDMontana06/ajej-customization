
<%@ page import="icbs.deposit.FixedDepositPreTermScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fixedDepositPreTermScheme.label', default: 'FixedDepositPreTermScheme')}" />
		<title>Show Fixed Deposit Pre-Term Scheme</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-fixedDepositPreTermScheme" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                            <div class="box-body">
                                <div class="alert alert-info alert-dismissable">
                                    <i class="fa fa-info"></i>
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <b>Message</b> <div class="message" role="status">${flash.message}</div>
                                </div>
                            </div>
			</g:if>
			<ol class="property-list fixedDepositPreTermScheme">
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="fixedDepositPreTermScheme.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="fixedDepositPreTermScheme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="fixedDepositPreTermScheme.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">${fixedDepositPreTermSchemeInstance?.type?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.rate}">
				<li class="fieldcontain">
					<span id="rate-label" class="property-label"><g:message code="fixedDepositPreTermScheme.rate.label" default="Rate" /></span>
					
						<span class="property-value" aria-labelledby="rate-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="rate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.term1stHalf}">
				<li class="fieldcontain">
					<span id="term1stHalf-label" class="property-label"><g:message code="fixedDepositPreTermScheme.term1stHalf.label" default="Term1st Half" /></span>
					
						<span class="property-value" aria-labelledby="term1stHalf-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="term1stHalf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.term2ndHalf}">
				<li class="fieldcontain">
					<span id="term2ndHalf-label" class="property-label"><g:message code="fixedDepositPreTermScheme.term2ndHalf.label" default="Term2nd Half" /></span>
					
						<span class="property-value" aria-labelledby="term2ndHalf-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="term2ndHalf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.divisor}">
				<li class="fieldcontain">
					<span id="divisor-label" class="property-label"><g:message code="fixedDepositPreTermScheme.divisor.label" default="Divisor" /></span>
					
						<span class="property-value" aria-labelledby="divisor-label"><g:fieldValue bean="${fixedDepositPreTermSchemeInstance}" field="divisor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="fixedDepositPreTermScheme.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${fixedDepositPreTermSchemeInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositPreTermSchemeInstance?.isGradeRate}">
				<li class="fieldcontain">
					<span id="isGradeRate-label" class="property-label"><g:message code="fixedDepositPreTermScheme.isGradeRate.label" default="Is Grade Rate" /></span>
					
						<span class="property-value" aria-labelledby="isGradeRate-label"><g:formatBoolean boolean="${fixedDepositPreTermSchemeInstance?.isGradeRate}" /></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
                                            <span id="products-label" class="property-label">Products</span>
                                            <ul id="products">
                                            <g:each in="${fixedDepositPreTermSchemeInstance.products}" var="product">
                                                    <li>${product.name}</li>
                                            </g:each>
                                            </ul>					
                                </li>
			
			</ol>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
      			<li><g:link class="list" action="index">Fixed Deposit Pre-Term Scheme List</g:link></li>
      			<li><g:link class="create" action="create">New Fixed Deposit Pre-Term Scheme</g:link></li>
                <li><button disabled="disabled">View Fixed Deposit Pre-Term Scheme</button></li>
                <li><g:link action="edit" controller="FixedDepositPreTermScheme" id="${fixedDepositPreTermSchemeInstance.id}">Update Fixed Deposit Pre-Term Scheme</g:link></li>

                <g:if test="${fixedDepositPreTermSchemeInstance.status.id == 1}">
                <li><g:form url="[id:fixedDepositPreTermSchemeInstance.id, action:'activate']" method="POST">
					<g:actionSubmit action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form></li>
                </g:if>

                <g:if test="${fixedDepositPreTermSchemeInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form id="deleteFixedDepositPreTermSchemeForm" url="[id:fixedDepositPreTermSchemeInstance.id, action:'delete']" method="POST">                                           
                        </g:form>
                        <g:actionSubmit id="deleteFixedDepositPreTermScheme" action="delete" value="Delete" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG00903', 'form#deleteFixedDepositPreTermSchemeForm', 'Override delete Fixed Deposit PreTerm Scheme.', null); 
                                },
                                function(){
                                    return;
                                });                             
                            " />
                    </li>
                </g:if>
	       	</ul>
                <!--
                <script type="text/javascript">
                    $(document).ready(function() {
                        $( "#deleteFixedDepositPreTermScheme" ).click(function() {
                                 checkIfAllowed('CFG00903', 'form#deleteFixedDepositPreTermSchemeForm', 'Override new Fixed Deposit PreTerm Scheme.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script>
                -->
            </content>
	</body>
</html>
