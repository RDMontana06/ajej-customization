
<%@ page import="icbs.gl.CfgAcctGlTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cfgAcctGlTemplate.label', default: 'CfgAcctGlTemplate')}" />
		<title>Account GL Link Template Information</title>
	</head>
	<body>
            <content tag="main-content">
				
				<div id="show-cfgAcctGlTemplate" class="content scaffold-show" role="main">
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>

							<div class="nav-tab-container">
				              <ul class="nav nav-tabs">
				                <li class="active"><a href="#tab_1" data-toggle="tab">Account GL Link</a></li>
				                <li><a href="#tab_2" data-toggle="tab">GL Link Entries</a></li>
				              </ul>
				            </div>

				            <div class="tab-content">
				            	<div class="tab-pane active fade in" id="tab_1">

									<ul class="property-list role">
										<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
										</g:if>
										<ol class="property-list cfgAcctGlTemplate">
										
											<g:if test="${cfgAcctGlTemplateInstance?.description}">
											<li class="fieldcontain">
												<span id="description-label" class="property-label"><g:message code="cfgAcctGlTemplate.description.label" default="Description" /></span>
												
													<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${cfgAcctGlTemplateInstance}" field="description"/></span>
												
											</li>
											</g:if>
										
											<g:if test="${cfgAcctGlTemplateInstance?.type}">
											<li class="fieldcontain">
												<span id="type-label" class="property-label"><g:message code="cfgAcctGlTemplate.type.label" default="Type" /></span>
												
													<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${cfgAcctGlTemplateInstance}" field="type"/></span>
												
											</li>
											</g:if>			
									</ul>

								</div>

								<div class="tab-pane fade in" id="tab_2">
				            		<ul>
									<g:each in="${cfgAcctGlTemplateInstance.links}" var="link" >
										<li><g:link controller="cfgAcctGlTemplateDet" action="show" id="${link.id}">${link.ordinalPos} -  ${link.status} - ${link.glDescription} (${link.glCode}) </g:link>  </li>
									</g:each>
									</ul>
				            	</div>
				            </div>
						</div>
            </content>
             
             <content tag="main-actions">
                <ul>

                    <li>
                    	<g:link class="list" action="index"> Back </g:link>
                    </li>
				</ul>
            </content>
	</body>
</html>
