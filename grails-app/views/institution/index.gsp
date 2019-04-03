
<%@ page import="icbs.admin.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title>Institution Settings</title>
	</head>
	<body>
		<content tag="main-content">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<table class="table table-bordered table-rounded table-striped table-hover">
				<thead>
					<tr>
						<th><g:message code="institution.paramCode.label" default="Param Code" /></th>

						<th><g:message code="institution.caption.label" default="Caption" /></th>

						<th><g:message code="institution.paramValue.label" default="Param Value" /></th>
					
					</tr>
				</thead>
				<tbody>
					<g:each in="${institutionInstanceList}" status="i" var="institutionInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td>${fieldValue(bean: institutionInstance, field: "paramCode")}</td>
						
							<td>${fieldValue(bean: institutionInstance, field: "caption")}</td>
							
							<td>${fieldValue(bean: institutionInstance, field: "paramValue")}</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</content>	
		<content tag="main-actions">
			<ul>
				<li><g:link onclick="window.print();">Print</g:link></li>
			</ul>
		</content>
	</body>
</html>
