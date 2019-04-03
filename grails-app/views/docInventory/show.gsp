
<%@ page import="icbs.deposit.DocInventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docInventory.label', default: 'DocInventory')}" />
		<title>Show Deposit Inventory</title>
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
			
				<g:if test="${docInventoryInstance?.canceledAt}">
				<li class="fieldcontain">
					<span id="canceledAt-label" class="property-label"><g:message code="docInventory.canceledAt.label" default="Canceled At" /></span>
					
						<span class="property-value" aria-labelledby="canceledAt-label"><g:formatDate format="yyyy-MM-dd" date="${docInventoryInstance?.canceledAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInventoryInstance?.canceledBy}">
				<li class="fieldcontain">
					<span id="canceledBy-label" class="property-label"><g:message code="docInventory.canceledBy.label" default="Canceled By" /></span>
					
						<span class="property-value" aria-labelledby="canceledBy-label"><g:link controller="userMaster" action="show" id="${docInventoryInstance?.canceledBy?.username}">${docInventoryInstance?.canceledBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docInventoryInstance?.status}">
				<li class="fieldcontain">
					<span id="docInventoryStatus-label" class="property-label"><g:message code="docInventory.status.label" default="Doc Inventory Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${docInventoryInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${docInventoryInstance?.type}">
				<li class="fieldcontain">
					<span id="docInventoryType-label" class="property-label"><g:message code="docInventory.docInventoryType.label" default="Doc Inventory Type" /></span>
					
						<span class="property-value" aria-labelledby="docInventoryType-label">${docInventoryInstance?.type?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${docInventoryInstance?.isCanceled}">
				<li class="fieldcontain">
					<span id="isCanceled-label" class="property-label"><g:message code="docInventory.isCanceled.label" default="Is Canceled" /></span>
					
						<span class="property-value" aria-labelledby="isCanceled-label"><g:formatBoolean boolean="${docInventoryInstance?.isCanceled}" /></span>
					
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
				<g:if test="${docInventoryInstance?.docParticulars}">
				<li class="fieldcontain">
					<span id="usageCount-label" class="property-label"><g:message code="docInventory.docParticulars.label" default="Particulars" /></span>
					
						<span class="property-value" aria-labelledby="docParticulars-label"><g:fieldValue bean="${docInventoryInstance}" field="docParticulars"/></span>
					
				</li>
				</g:if>			
			</ol>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="list" action="index">Document Inventory List</g:link></li>
      			<li><g:link class="create" action="create">Create Document Inventory</g:link></li>
                <li><button disabled="disabled">View Document Inventory</button></li>
                <!--        
                <li><g:link action="edit"id="${docInventoryInstance.id}">Update Document Inventory</g:link></li>
                -->
                <g:if test="${docInventoryInstance.status.id == 1}">
                    <li><g:form url="[id:docInventoryInstance.id, action:'activate']" method="POST">
			<g:actionSubmit action="activate" value="Activate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form></li>
                </g:if>
<!--Action cancel added -->
                <g:if test="${docInventoryInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form url="[id:docInventoryInstance.id, action:'cancel']" method="POST">
                            <g:actionSubmit action="cancel" value="Cancel" onclick="return confirm('${message(code: 'default.button.cancel.confirm.message', default: 'Are you sure?')}');" />
                        </g:form>
                    </li>
                </g:if>
                        
                <g:if test="${docInventoryInstance.status.id.toInteger() in [1, 2]}">
                    <li><g:form url="[id:docInventoryInstance.id, action:'delete']" method="POST">
                            <g:actionSubmit action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </g:form>
                    </li>
                </g:if>
                <li><g:link action="viewDetails"id="${docInventoryInstance.id}">View Inventory Details</g:link></li>
		</ul>
            </content>
	</body>
</html>
