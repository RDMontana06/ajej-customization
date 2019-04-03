
<%@ page import="icbs.deposit.FixedDepositTermScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fixedDepositTermScheme.label', default: 'FixedDepositTermScheme')}" />
		<title>Show Fixed Deposit Term Scheme</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-fixedDepositTermScheme" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                            <div class="box-body">
                                <div class="alert alert-info alert-dismissable">
                                    <i class="fa fa-info"></i>
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <b>Message</b> <div class="message" role="status">${flash.message}</div>
                                </div>
                            </div>
			</g:if>
			<ol class="property-list fixedDepositTermScheme">
			
				<g:if test="${fixedDepositTermSchemeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="fixedDepositTermScheme.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${fixedDepositTermSchemeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositTermSchemeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="fixedDepositTermScheme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${fixedDepositTermSchemeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositTermSchemeInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="fixedDepositTermScheme.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${fixedDepositTermSchemeInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositTermSchemeInstance?.termMin}">
				<li class="fieldcontain">
					<span id="termMin-label" class="property-label"><g:message code="fixedDepositTermScheme.termMin.label" default="Term Min" /></span>
					
						<span class="property-value" aria-labelledby="termMin-label"><g:fieldValue bean="${fixedDepositTermSchemeInstance}" field="termMin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositTermSchemeInstance?.termMax}">
				<li class="fieldcontain">
					<span id="termMax-label" class="property-label"><g:message code="fixedDepositTermScheme.termMax.label" default="Term Max" /></span>
					
						<span class="property-value" aria-labelledby="termMax-label"><g:fieldValue bean="${fixedDepositTermSchemeInstance}" field="termMax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fixedDepositTermSchemeInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="fixedDepositTermScheme.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${fixedDepositTermSchemeInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
                                            <span id="products-label" class="property-label">Products</span>
                                            <ul id="products">
                                            <g:each in="${fixedDepositTermSchemeInstance?.products}" var="product">
                                                    <li>${product.name}</li>
                                            </g:each>
                                            </ul>					
                                </li>
			
			</ol>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
      			<li><g:link class="list" action="index">Fixed Deposit Term Scheme List</g:link></li>
      			<li><g:link class="create" action="create">New Fixed Deposit Term Scheme</g:link></li>
                <li><button disabled="disabled">View Fixed Deposit Term Scheme</button></li>
                <li><g:link action="edit" controller="FixedDepositTermScheme" id="${fixedDepositTermSchemeInstance.id}">Update Fixed Deposit Term Scheme</g:link></li>

                <g:if test="${fixedDepositTermSchemeInstance.status.id == 1}">
                    <li><g:form id="activatefixedDepositTermSchemeForm" url="[id:fixedDepositTermSchemeInstance.id, action:'activate']" method="POST">
                        </g:form>
                        <g:actionSubmit id="activatefixedDepositTermScheme" action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />    
                    </li>
                </g:if>

                <g:if test="${fixedDepositTermSchemeInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form id="deletefixedDepositTermSchemeForm" url="[id:fixedDepositTermSchemeInstance.id, action:'delete']" method="POST">
                        </g:form>
                        <g:actionSubmit id="deletefixedDepositTermScheme" action="delete" value="Delete" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG01504', 'form#deletefixedDepositTermSchemeForm', 'Override new fixed deposit term scheme form.', null); 
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
                        //$( "#deletefixedDepositTermScheme" ).click(function() {
                        //         checkIfAllowed('CFG01504', 'form#deletefixedDepositTermSchemeForm', 'Override new fixed deposit term scheme form.', null); // params: policyTemplate.code, form to be saved
                        //});
                        $( "#activatefixedDepositTermScheme" ).click(function() {
                                 checkIfAllowed('CFG01503', 'form#activatefixedDepositTermSchemeForm', 'Override new fixed deposit term scheme form.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script>
            </content>
	</body>
</html>
