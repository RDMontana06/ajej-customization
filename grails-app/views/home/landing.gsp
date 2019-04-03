<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Dashboard</title>
	</head>
	<body>
		<content tag="main-content">
                <g:if test="${flash.error}">
                    <!-- <div class="box-body">
                        <div class="alert alert-danger alert-dismissable">
                            <i class="fa fa-exclamation"></i>
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <b>Message</b> <div class="message" role="status">${flash.error}</div>
                        </div>
                    </div> -->
                    <script>
                    $(function(){
                        var x = '${flash.error}';
                        notify.error(x);
                    });
                </script>
	      	</g:if>
	      	<g:if test="${flash.success}">
                    <!-- <div class="box-body">
                            <div class="alert alert-info alert-dismissable">
                                    <i class="fa fa-info"></i>
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <b>Message</b> <div class="message" role="status">${flash.success}</div>
                            </div>
                    </div> --> 
                    <script>
                        $(function(){
                            var x = '${flash.success}';
                            notify.message(x);
                        });
                    </script>
                </g:if>
		      
			<h3>System Messages</h3>
			<table class="table table-bordered table-rounded table-striped table-hover">
                <thead>
					<tr>
					
						<th width="20%">Sender</th>
					
						<th width="20%">Subject</th>
					
						<th width="45%">Message</th>
					
						<th width="15%">Date</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userMessageInstanceList}" status="i" var="userMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: userMessageInstance, field: "sender.name")}</td>
					
						<g:if test="${userMessageInstance.isRead == true}" >
							<td><g:link controller="UserMessage" action="show" id="${userMessageInstance.id}">${fieldValue(bean: userMessageInstance, field: "subject")}</g:link></td>
						</g:if>
						<g:else>
							<td><strong><g:link controller="UserMessage" action="show" id="${userMessageInstance.id}" class="bold">${fieldValue(bean: userMessageInstance, field: "subject")}</g:link></strong></td>
						</g:else>
					
						<td>${fieldValue(bean: userMessageInstance, field: "body")}</td>
					
						<td>${fieldValue(bean: userMessageInstance, field: "sentAt")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
		</content>
		<content tag="main-actions">
			<ul>
                            <!--
				<li><g:link uri="/userMaster/create">New User</g:link></li>
				<li><g:link uri="/branch">Branches</g:link></li>
				<li><g:link uri="">Print Reports</g:link></li>
				<li><g:link uri="">Calendars</g:link></li>
                                <li><g:link controller="customer">CIF Index</g:link></li>
                                <li><g:link controller="deposit" action="depositSearch">Deposits Index</g:link></li>
                                <li><g:link controller="tellering">Tellering Index</g:link></li>
                                <li><g:link url="../ATMInterface">ATM Transaction Screen</g:link></li>
                            -->
                            <li><g:link uri="/userMessage/create">New Message</g:link></li>
                            
                            <g:if test="${userInstance.designation.id==1}">
                                <li><g:link uri="/userMaster">User Management</g:link><li>
                                <li><g:link uri="/periodicOps">Periodic Operations</g:link><li>
                            </g:if>   
                            
                            <g:if test="${userInstance.designation.id==2}">
                                <li><g:link controller="customer" action="create">New Customer</g:link></li>
                                <li><g:link uri="/tellering">Tellering Index</g:link><li>
                            </g:if>  
                            
			</ul>
		</content>
	</body>
</html>
