<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'glAccount.label', default: 'GlAccount')}" />
		<title>Create GL Account</title>
    
        <g:javascript>
            
            var modal;

            function showSortCodeModalSearch() {
                 modal = new icbs.UI.Modal({id:"glSearchModal", url:"${createLink(controller: 'search', action:'search', params:[searchDomain: "gl-sortcode"])}", title:"Search Gl Sort Codes", onCloseCallback:updateSortCode});
            
                modal.show(); 
            }

            function updateSortCode () {

                $("#glSortCode").val(modal.onCloseCallbackParams['glSortCode3']);
                $("#glSortCodeHidden").val(modal.onCloseCallbackParams['glSortCode2']);
                
            }
        </g:javascript>

	</head>
	<body>
            <content tag="main-content">
		<div id="create-glAccount" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${glAccountInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${glAccountInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="create" url="[resource:glAccountInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				
			</g:form>
		</div>
            </content>
            <content tag="main-actions">
                <ul>
                    <li><g:submitButton name="create" form="create" value="${message(code: 'default.button.create.label', default: 'Create')}" onclick="
                            alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                                function(){
                                    checkIfAllowed('GEN00201', 'form#create', 'Override create new GL Account', null);
                                },
                                function(){
                                    return;
                                });                            
                        "/></li>
                    <li><g:link class="list" action="index">Back</g:link></li>
                </ul>
            </content>
	</body>
</html>