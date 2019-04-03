
<%@ page import="icbs.deposit.DepositInterestScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'depositInterestScheme.label', default: 'DepositInterestScheme')}" />
                <title>Show Deposit Interest Scheme</title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-depositInterestScheme" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                            <script>
                            $(function(){
                                var x = '${flash.message}';
                                    notify.message(x);
                            });
                            </script>  
                            <!--
                            <div class="box-body">
                                <div class="alert alert-info alert-dismissable">
                                    <i class="fa fa-info"></i>
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <b>Message</b> <div class="message" role="status">${flash.message}</div>
                                </div>
                            </div>
                            -->
			</g:if>
			<ol class="property-list depositInterestScheme">
			
				<g:if test="${depositInterestSchemeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="depositInterestScheme.code.label" default="Code" /></span>
					<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${depositInterestSchemeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="depositInterestScheme.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${depositInterestSchemeInstance}" field="name"/></span>
					
				</li>
				</g:if>
                                <g:if test="${depositInterestSchemeInstance?.depositInterestStart}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="depositInterestScheme.depositInterestStart.label" default="Deposit Interest Start" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${depositInterestSchemeInstance}" field="depositInterestStart.description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.interestRate}">
				<li class="fieldcontain">
					<span id="interestRate-label" class="property-label"><g:message code="depositInterestScheme.interestRate.label" default="Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="interestRate-label"><g:formatNumber format="#,##0.00" number="${depositInterestSchemeInstance?.interestRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.divisor}">
				<li class="fieldcontain">
					<span id="divisor-label" class="property-label"><g:message code="depositInterestScheme.divisor.label" default="Divisor" /></span>
					
						<span class="property-value" aria-labelledby="divisor-label"><g:fieldValue bean="${depositInterestSchemeInstance}" field="divisor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.minInterestRate}">
				<li class="fieldcontain">
					<span id="minInterestRate-label" class="property-label"><g:message code="depositInterestScheme.minInterestRate.label" default="Min Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="minInterestRate-label"><g:formatNumber format="#,##0.00" number="${depositInterestSchemeInstance?.minInterestRate}"/>%</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.maxInterestRate}">
				<li class="fieldcontain">
					<span id="maxInterestRate-label" class="property-label"><g:message code="depositInterestScheme.maxInterestRate.label" default="Max Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="maxInterestRate-label"><g:formatNumber format="#,##0.00" number="${depositInterestSchemeInstance?.maxInterestRate}"/>%</span>
					
				</li>
				</g:if>
                                
				<g:if test="${depositInterestSchemeInstance?.fdPostMaturityRate}">
				<li class="fieldcontain">
					<span id="interestRate-label" class="property-label"><g:message code="depositInterestScheme.fdPostMaturityRate.label" default="FD Post Maturity Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="interestRate-label"><g:formatNumber format="#,##0.00" number="${depositInterestSchemeInstance?.fdPostMaturityRate}"/>%</span>
					
				</li>
				</g:if>	

				<g:if test="${depositInterestSchemeInstance?.fdMonthlyTransfer}">
				<li class="fieldcontain">
					<span id="fdMonthlyTransfer-label" class="property-label"><g:message code="depositInterestScheme.fdMonthlyTransfer.label" default="FD Monthly Transfer" /></span>
					
						<span class="property-value" aria-labelledby="fdMonthlyTransfer-label"><g:formatBoolean boolean="${depositInterestSchemeInstance?.fdMonthlyTransfer}" /></span>
					
				</li>
				</g:if>   
                                
				<g:if test="${depositInterestSchemeInstance?.minBalanceToEarnInterest}">
				<li class="fieldcontain">
					<span id="minBalanceToEarnInterest-label" class="property-label"><g:message code="depositInterestScheme.minBalanceToEarnInterest.label" default="Min Balance To Earn Interest" /></span>
					
						<span class="property-value" aria-labelledby="minBalanceToEarnInterest-label"><g:formatNumber format="###,###,##0.00" number="${depositInterestSchemeInstance?.minBalanceToEarnInterest}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.canChangeInterestRate}">
				<li class="fieldcontain">
					<span id="canChangeInterestRate-label" class="property-label"><g:message code="depositInterestScheme.canChangeInterestRate.label" default="Can Change Interest Rate" /></span>
					
						<span class="property-value" aria-labelledby="canChangeInterestRate-label"><g:formatBoolean boolean="${depositInterestSchemeInstance?.canChangeInterestRate}" /></span>
					
				</li>
				</g:if>
                                        
				<g:if test="${depositInterestSchemeInstance?.isAccrual}">
				<li class="fieldcontain">
					<span id="isAccrual-label" class="property-label"><g:message code="depositInterestScheme.isAccrual.label" default="Is Accrual" /></span>
					
						<span class="property-value" aria-labelledby="isAccrual-label"><g:formatBoolean boolean="${depositInterestSchemeInstance?.isAccrual}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.depositCapitalizationFreq}">
				<li class="fieldcontain">
					<span id="depositCapitalizationFreq-label" class="property-label"><g:message code="depositInterestScheme.depositCapitalizationFreq.label" default="Deposit Capitalization Freq" /></span>
					
						<span class="property-value" aria-labelledby="depositCapitalizationFreq-label">${depositInterestSchemeInstance?.depositCapitalizationFreq?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.depositInterestCalculation}">
				<li class="fieldcontain">
					<span id="depositInterestCalculation-label" class="property-label"><g:message code="depositInterestScheme.depositInterestCalculation.label" default="Deposit Interest Calculation:" /></span>
                                        <span class="property-value" aria-labelledby="depositInterestCalculation-label">${depositInterestSchemeInstance?.depositInterestCalculation.description}</span>
					
						
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="depositInterestScheme.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${depositInterestSchemeInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${depositInterestSchemeInstance?.isGraduated}">
				<li class="fieldcontain">
					<span id="isGraduated-label" class="property-label"><g:message code="depositInterestScheme.isGraduated.label" default="Is Graduated" /></span>
					
						<span class="property-value" aria-labelledby="isGraduated-label"><g:formatBoolean boolean="${depositInterestSchemeInstance?.isGraduated}" /></span>
					
				</li>
				</g:if>
			
                                <li class="fieldcontain">
                                            <span id="products-label" class="property-label">Products</span>
                                            <ul id="products">
                                            <g:each in="${depositInterestSchemeInstance.products}" var="product">
                                                    <li>${product.name}</li>
                                            </g:each>
                                            </ul>					
                                </li>
			
			</ol>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
      			<li><g:link class="list" action="index">Deposit Interest Scheme List</g:link></li>
      			<li><g:link class="create" action="create">New Deposit Interest Scheme</g:link></li>
                <li><button disabled="disabled">View Deposit Interest Scheme</button></li>
                <g:if test="${depositInterestSchemeInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:link action="edit" controller="DepositInterestScheme" id="${depositInterestSchemeInstance.id}">Update Deposit Interest Scheme</g:link></li>
                </g:if>
                <g:if test="${depositInterestSchemeInstance.status.id == 1}">
                <li><g:form url="[id:depositInterestSchemeInstance.id, action:'activate']" method="POST">
                        <g:actionSubmit action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form></li>
                </g:if>

                <g:if test="${depositInterestSchemeInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form id="deleteDepositInterestSchemeForm" url="[id:depositInterestSchemeInstance.id, action:'delete']" method="POST">
                        </g:form>
                        <g:actionSubmit id="deleteDepositIntScheme" action="delete" value="Delete" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('CFG01004', 'form#deleteDepositInterestSchemeForm', 'Override edit Deposit Interest Scheme.', null); 
                                },
                                function(){
                                    return;
                                });                                
                            " />
                    </li>
                </g:if>
                    <li><g:link action="changeInt" controller="DepositInterestScheme" id="${depositInterestSchemeInstance.id}">Change Interest Rate</g:link></li>
	       	</ul>
                <!--
                <script type="text/javascript">
                    $(document).ready(function() {
                        $( "#deleteDepositIntScheme" ).click(function() {
                                 checkIfAllowed('CFG01004', 'form#deleteDepositInterestSchemeForm', 'Override edit Deposit Interest Scheme.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script>
                -->
            </content>
	</body>
</html>
