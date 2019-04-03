
<%@ page import="icbs.admin.Holiday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
		<title>Holiday Information</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/holiday')}">Holiday Settings</a>
          <span class="fa fa-chevron-right"></span><span class="current">Holiday Information</span>
		</content>

    <content tag="main-content">   
		<div id="show-holiday" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<!-- <div class="message" role="status">${flash.message}</div> -->
                        <script>
                        $(function(){
                            var x = '${flash.message}';
                                notify.message(x);
                        });
                        </script>                            
			</g:if>

			<div class="nav-tab-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Holiday Details</a></li>
                <li><a href="#tab_2" data-toggle="tab">Branches</a></li>
              </ul>
            </div>

            <div class="tab-content">
            	<div class="tab-pane active fade in" id="tab_1">

					<ul class="property-list holiday">
					
						<g:if test="${holidayInstance?.code}">
						<li class="fieldcontain">
							<span id="code-label" class="property-label"><g:message code="holiday.code.label" default="Code" /></span>
							
								<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${holidayInstance}" field="code"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${holidayInstance?.description}">
						<li class="fieldcontain">
							<span id="description-label" class="property-label"><g:message code="holiday.description.label" default="Description" /></span>
							
								<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${holidayInstance}" field="description"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${holidayInstance?.month}">
						<li class="fieldcontain">
							<span id="date-label" class="property-label"><g:message code="holiday.date.label" default="Date" /></span>
							
								<span class="property-value" aria-labelledby="date-label">${holidayInstance.month.description} ${holidayInstance.day}</span>
							
						</li>
						</g:if>
						<g:if test="${holidayInstance?.holidayDate}">
						<li class="fieldcontain">
							<span id="date-label" class="property-label"><g:message code="holiday.date.label" default="Date" /></span>
							
								<span class="property-value" aria-labelledby="date-label"><g:formatDate  format="MM/dd/yyyy" date="${holidayInstance?.holidayDate}" /></span>
							
						</li>
						</g:if>	

						<g:if test="${holidayInstance?.type}">
						<li class="fieldcontain">
							<span id="type-label" class="property-label"><g:message code="holiday.type.label" default="Type" /></span>
							
								<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${holidayInstance}" field="type"/></span>
							
						</li>
						</g:if>
                                                
						<g:if test="${holidayInstance?.institutionWideHoliday}">
						<li class="fieldcontain">
							<span id="type-label" class="property-label"><g:message code="holiday.type.label" default="Bank wide Holiday" /></span>
							
								<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${holidayInstance}" field="institutionWideHoliday"/></span>
							
						</li>
						</g:if>

						<g:if test="${holidayInstance?.configItemStatus}">
						<li class="fieldcontain">
							<span id="configItemStatus-label" class="property-label"><g:message code="holiday.configItemStatus.label" default="Config Item Status" /></span>
							
								<span class="property-value" aria-labelledby="configItemStatus-label">${holidayInstance?.configItemStatus?.description}</span>
							
						</li>
						</g:if>
					
					</ul>
				</div>

				<div class="tab-pane fade in" id="tab_2">
            		<ul>
					<g:each in="${holidayInstance.branches}" var="branch" >
						<li>${branch.name}</li>
					</g:each>
					</ul>
            	</div>
            </div>
            		
			<g:form name="remove" id="remove" url="[resource:holidayInstance, action:'delete']" method="DELETE">
			</g:form>
		</div>
    </content>

    <content tag="main-actions">
        <ul>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            <li><g:link action="edit" resource="${holidayInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
            <!--<li><g:actionSubmit  id="deleteHoliday" form="show" action="delete" 
                value="${message(code: 'default.button.delete.label', default: 'Delete')}" /></li>
            -->
            <li><g:actionSubmit id="deleteHoliday"  resource="${holidayInstance}" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to delete?',
                                function(){
                                    checkIfAllowed('ADM00304', 'form#remove', 'Remove holiday.', null);
                                },
                                function(){
                                    return;
                                });                      
                "/></li>
		</ul>
                <!--
            <script type="text/javascript">
                    $(document).ready(function() {
                           $( "#deleteHoliday" ).click(function() {
                              checkIfAllowed('ADM00304', 'form#remove', 'Remove holiday.', null); // params: policyTemplate.code, form to be saved
                           });
                    });
                </script>
                -->

    </content>
	</body>
</html>
