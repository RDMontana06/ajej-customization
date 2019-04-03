
<%@ page import="icbs.deposit.DocInventory" %>
<%@ page import="icbs.deposit.Passbook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docInventory.label', default: 'DocInventory')}" />
                <g:if test="${docInventoryInstance?.type?.id == 2}">
		<title>Show Savings Account Passbook Inventory Details</title>
                </g:if>
                <g:if test="${docInventoryInstance?.type?.id == 4}">
		<title>Show Current Account Passbook Inventory Details</title>
                </g:if>
                <g:if test="${docInventoryInstance?.type?.id == 5}">
		<title>Show Fixed Account Passbook Inventory Details</title>
                </g:if>
	</head>
	<body>
            <content tag="main-content">   
		<div id="show-docInventory" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<!-- div class="message" role="status">${flash.message}</div -->
                            <script>
                            $(function(){
                                var x = '${flash.message}';
                                    notify.message(x);
                                    //$('#SlipTransaction').hide();
                                    if(x.indexOf('|success') > -1){
                                    //$('#SlipTransaction').show();
                                }
                            });
                            </script>
			</g:if>
			<ol class="property-list docInventory">
			
				<g:if test="${docInventoryInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="docInventory.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${docInventoryInstance?.branch?.id}">${docInventoryInstance?.branch?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
						
				<g:if test="${docInventoryInstance?.status}">
				<li class="fieldcontain">
					<span id="docInventoryStatus-label" class="property-label"><g:message code="docInventory.status.label" default="Doc Inventory Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${docInventoryInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
						                                
				<g:if test="${docInventoryInstance?.seriesStart}">
				<li class="fieldcontain">
					<span id="seriesStart-label" class="property-label"><g:message code="docInventory.seriesStart.label" default="Series Start" /></span>
					
						<span class="property-value" aria-labelledby="seriesStart-label">${docInventoryInstance?.seriesStart}</span>
					
				</li>
				</g:if>	

				<g:if test="${docInventoryInstance?.seriesEnd}">
				<li class="fieldcontain">
					<span id="seriesEnd-label" class="property-label"><g:message code="docInventory.seriesEnd.label" default="Series End" /></span>
					
						<span class="property-value" aria-labelledby="seriesEnd-label">${docInventoryInstance?.seriesEnd}</span>
					
				</li>
				</g:if>			
			
				<g:if test="${docInventoryInstance?.usageCount}">
				<li class="fieldcontain">
					<span id="usageCount-label" class="property-label"><g:message code="docInventory.usageCount.label" default="Usage Count" /></span>
					
						<span class="property-value" aria-labelledby="usageCount-label"><g:fieldValue bean="${docInventoryInstance}" field="usageCount"/></span>
					
				</li>
				</g:if>
			
			</ol>
                        
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover table-condensed table-bordered table-striped">
                            <tr> 
                                <td width="15%"><label>Account No</label></td>
                                <td width="15%"><label>Passbook No.</label></td>
                                <td width="10%"><label>Status</label></td>
                            </tr>
                            <g:each var="pb" in="${pbInstance}">
                                <tr>
                                    <td>${pb?.issuePassbook?.deposit?.acctNo}</td>
                                    <td>${pb?.passbookNo}</td>
                                    <td>${pb?.status?.description}</td>
                                </tr>
                            </g:each>     
                        </table>
                <div class="pagination">
                        <g:paginate total="${pbInstance ?: 0}"/>
                </div>
            </div>

		</div>
            </content>
             <content tag="main-actions">
                <ul>
                <li><g:link class="list" action="index">Document Inventory List</g:link></li>
      		<li><g:link class="create" action="create">Create Document Inventory</g:link></li>
                <li><g:link action="show"id="${docInventoryInstance.id}">View Document Inventory</g:link></li>
		</ul>
            </content>
	</body>
</html>
