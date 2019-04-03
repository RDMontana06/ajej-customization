
<%@ page import="icbs.admin.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
            <content tag="main-content">   
		<div id="list-module" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
                        
			<div class="table-responsive">
            <table class="table table-bordered table-rounded table-striped table-hover">
                <thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'module.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="parentModuleCode" title="${message(code: 'module.parentModule.label', default: 'Parent Module')}" />
					
						<g:sortableColumn property="isOnMenu" title="${message(code: 'module.isOnMenu.label', default: 'Is On Menu')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${moduleInstanceList}" status="i" var="moduleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: moduleInstance, field: "name")}</td>
					
						<td>
							<g:if test="${moduleInstance.parentModuleCode}">
								${Module.findByCode(moduleInstance.parentModuleCode).name}
							</g:if>
						</td>
					
						<td><g:formatBoolean boolean="${moduleInstance.isOnMenu}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                     </div>
			<div class="pagination">
				<g:paginate total="${ModuleInstanceCount ?: 0}" params="${params}" />
			</div>
		</div>
            </content>
            <content tag="main-actions">
                <ul>
                	<li><g:link onclick="window.print();">Print</g:link></li>
				</ul>
            </content>
	</body>
</html>
