<%@ page import="icbs.loans.PenaltyIncomeScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'penaltyIncomeScheme.label', default: 'PenaltyIncomeScheme')}" />
		<title>Update Penalty Income Scheme</title>
		<g:javascript>    	
    		// update form fields based on penalty type
    		updateForm = function() {
		    	var type = $('#type').val();	

		    	if (type == 1) {  // fixed amount
		    		document.getElementById('amount-form-group').style.display = 'block';
	    			document.getElementById('rate-form-group').style.display = 'none';
		    	} else if (type == 2) {  // rate based
		    		document.getElementById('amount-form-group').style.display = 'none';
	    			document.getElementById('rate-form-group').style.display = 'block';
		    	}		    	
		    }

		    icbs.Dependencies.Ajax.addLoadEvent(function(){
            	updateForm();
            });
		</g:javascript>    	
	</head>
	<body>
		<content tag="main-content">
		<div class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
                <div class="box-body">
                    <div class="alert alert-info alert-dismissable">
                        <i class="fa fa-info"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Message</b> <div class="message" role="status">${flash.message}</div>
                    </div>
                </div>
            </g:if>
			<g:hasErrors bean="${penaltySchemeInstance}">
				<div class="box-body">
	                <div class="alert alert-danger alert-dismissable">
	                    <i class="fa fa-ban"></i>
	                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                    <b>Alert!</b> 
	                    <ul class="errors" role="alert">
	                        There are errors
	                    </ul>            
	                </div>
	            </div>
            </g:hasErrors>
			<g:form id="edit" url="[resource:penaltyIncomeSchemeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${penaltyIncomeSchemeInstance?.version}" />
				<div class="nav-tab-container">
              		<ul class="nav nav-tabs">
                		<li class="active"><a href="#tab_1" data-toggle="tab">Details</a></li>
                		<li><a href="#tab_2" data-toggle="tab">Products</a></li>
              		</ul>
              	</div>
          		<div class="tab-content">
        			<div class="tab-pane active fade in" id="tab_1">
						<div class="container-fluid">
							<g:render template="details"/>
						</div>
        			</div>
					<div class="tab-pane fade in" id="tab_2">							
						<div>
							<g:render template="products" />
						</div>
					</div>
            	</div>					
			</g:form>
		</div>
		</content>
		<content tag="main-actions">
      		<ul>
                    <!--<li><g:submitButton name="save" value="Save" onclick="jQuery('#form').submit()" /></li>-->
                    <li><g:submitButton name="create" id="editPenaltyIncomeScheme" class="btn btn-primary" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="
                        alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                                function(){
                                    checkIfAllowed('CFG01103', 'form#edit', 'Override Edit Penalty Income Scheme.', null);                             
                                    },
                                function(){
                                    return;
                                });                             
                        "/></li>
                    <li><g:link action="show" id="${penaltyIncomeSchemeInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Cancel</g:link></li>                
	       	</ul>
                <!--
                <script type="text/javascript">
                    $(document).ready(function() {
                        $( "#editPenaltyIncomeScheme" ).click(function() {
                                 checkIfAllowed('CFG01103', 'form#edit', 'Override Edit Penalty Income Scheme.', null); // params: policyTemplate.code, form to be saved
                        });
                    }); 
                </script> 
                -->
	    </content>
	</body>
</html>
