
<%@ page import="icbs.admin.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title>Branch Information</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/branch')}">Branch Maintenance</a>
          <span class="fa fa-chevron-right"></span><span class="current">Branch Information</span>
		</content>

            <content tag="main-content">   
		<div id="show-branch" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                <div class="box-body">
                    <div class="alert alert-info alert-dismissable">
                        <i class="fa fa-info"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Message</b> <div class="message" role="status">${flash.message}</div>
                    </div>
                </div>
            </g:if>
			
			<ul class="property-list branch">
			
				<g:if test="${branchInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="branch.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label">${fieldValue(bean: branchInstance, field: "code").padLeft(3, '0')}</span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="branch.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${branchInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.swiftCode}">
				<li class="fieldcontain">
					<span id="swiftCode-label" class="property-label"><g:message code="branch.swiftCode.label" default="Swift Code" /></span>
					
						<span class="property-value" aria-labelledby="swiftCode-label"><g:fieldValue bean="${branchInstance}" field="swiftCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="branch.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${branchInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="branch.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label">${branchInstance?.country?.itemValue}</span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="branch.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label">${branchInstance?.region?.itemValue}</span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="branch.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${branchInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.managerId}">
				<li class="fieldcontain">
					<span id="managerId-label" class="property-label"><g:message code="branch.managerId.label" default="Manager Id" /></span>
					
						<span class="property-value" aria-labelledby="managerId-label"><g:link controller="userMaster" action="show" id="${branchInstance?.managerId?.id}">${branchInstance?.managerId?.name1}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.openDate}">
				<li class="fieldcontain">
					<span id="openDate-label" class="property-label"><g:message code="branch.openDate.label" default="Open Date" /></span>
					
						<span class="property-value" aria-labelledby="openDate-label"><g:formatDate  format="MM/dd/yyyy" date="${branchInstance?.openDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.dataCenter}">
				<li class="fieldcontain">
					<span id="dataCenter-label" class="property-label"><g:message code="branch.dataCenter.label" default="Data Center" /></span>
					
						<span class="property-value" aria-labelledby="dataCenter-label"><g:formatBoolean boolean="${branchInstance?.dataCenter}" true="Yes" false="No" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.taxNo}">
				<li class="fieldcontain">
					<span id="taxNo-label" class="property-label"><g:message code="branch.taxNo.label" default="Tax No" /></span>
					
						<span class="property-value" aria-labelledby="taxNo-label"><g:fieldValue bean="${branchInstance}" field="taxNo"/></span>
					
				</li>
				</g:if>
			
				
				<li class="fieldcontain">
					<span id="workingDays-label" class="property-label"><g:message code="branch.workingDays.label" default="Working Days" /></span>
					<span class="property-value" aria-labelledby="workingDays-label">
						<ul>
							<g:if test="${branchInstance?.openOnMon == true}"><li>Monday</li></g:if>
							<g:if test="${branchInstance?.openOnTue == true}"><li>Tuesday</li></g:if>
							<g:if test="${branchInstance?.openOnWed == true}"><li>Wednesday</li></g:if>
							<g:if test="${branchInstance?.openOnThu == true}"><li>Thursday</li></g:if>
							<g:if test="${branchInstance?.openOnFri == true}"><li>Friday</li></g:if>
							<g:if test="${branchInstance?.openOnSat == true}"><li>Saturday</li></g:if>
							<g:if test="${branchInstance?.openOnSun == true}"><li>Sunday</li></g:if>
						</ul>	
					</span>
				</li>
			
				<g:if test="${branchInstance?.runDate}">
				<li class="fieldcontain">
					<span id="runDate-label" class="property-label"><g:message code="branch.runDate.label" default="Run Date" /></span>
					
						<span class="property-value" aria-labelledby="runDate-label"><g:formatDate  format="MM/dd/yyyy" date="${branchInstance?.runDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.branchRunStatus}">
				<li class="fieldcontain">
					<span id="branchRunStatus-label" class="property-label"><g:message code="branch.branchRunStatus.label" default="Branch Run Status" /></span>
					
						<span class="property-value" aria-labelledby="branchRunStatus-label">${branchInstance?.branchRunStatus?.description}</span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="branch.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${branchInstance?.status?.description}</span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form name="remove" id="remove" url="[resource:branchInstance, action:'delete']" method="DELETE">
			</g:form>
                        <g:form name="closed" id="closed" url="[resource:branchInstance, action:'close']" method="DELETE">
			</g:form>                                
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                	<g:if test="${isPending && isAllowed}">
                		<li><g:link action="takeAction" params="[isApproved:true]" resource="${branchInstance}">Approve</g:link></li>
                		<li><g:link action="takeAction" params="[isApproved:false]" resource="${branchInstance}">Disapprove</g:link></li>
                	</g:if>
                	<g:if test="${!isPending}">
	                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	                    <li><g:link action="edit" resource="${branchInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
	                    <li><g:actionSubmit id="deleteBranch"  resource="${branchInstance}" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'branch.button.close.confirm.message', default: 'Are you sure you want this branch to be deleted?')}');"  /></li>
                            <li><g:actionSubmit id="closeBranch"  resource="${branchInstance}" action="close" value="${message(code: 'default.button.close.label', default: 'Close')}" onclick="return confirm('${message(code: 'branch.button.close.confirm.message', default: 'Are you sure you want to close this branch?')}');" /></li>
                            
                            <!--<li><g:actionSubmit form="show" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></li>
	                    <li><g:actionSubmit form="show" action="close" value="${message(code: 'branch.button.close.label', default: 'Close')}" onclick="return confirm('${message(code: 'branch.button.close.confirm.message', default: 'Are you sure you want to close this branch?')}');" /></li>
                            -->
                   	</g:if>
				</ul>
                <script type="text/javascript">
                    $(document).ready(function() {
                           $( "#deleteBranch" ).click(function() {
                              checkIfAllowed('ADM00204', 'form#remove', 'Delete Branch.', null); // params: policyTemplate.code, form to be saved
                           });
                    });
                    
                    $(document).ready(function() {
                           $( "#closeBranch" ).click(function() {
                              checkIfAllowed('ADM00205', 'form#closed', 'Close Branch.', null); // params: policyTemplate.code, form to be saved
                           });
                    });
                </script>
            </content>
	</body>
</html>
