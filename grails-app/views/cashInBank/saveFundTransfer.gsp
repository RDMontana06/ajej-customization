
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Fund Transfer Transaction Details</title>
    </head>
    <body>
        <content tag="main-content">   
            <div id="list-branch" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
		</g:if>


		<div class="table-responsive">
                    <table class="table table-bordered table-rounded table-striped table-hover">
			<tbody>
                            <tr>
                                <td><label>Source Transaction ID</label></td>
                                <td>${txSource.id}</td>
                            </tr>
                            <tr>
                                <td><label>Destination Transaction ID</label></td>
                                <td>${txDest.id}</td>
                            </tr> 
                            <tr>
                                <td><label>Transfer Amount</label></td>
                                <td><g:formatNumber format="##0.00000" number="${txSource?.txnAmt}"/></td>
                            </tr>  
                            <tr>
                                <td><label>Reference</label></td>
                                <td>${txSource?.txnRef}</td>
                            </tr>   
                            <tr>
                                <td><label>Particulars</label></td>
                                <td>${txSource?.txnParticulars}</td>
                            </tr> 
                        </tbody>    
                    </table>
                </div>

            </div>
        </content>
		
        <content tag="main-actions">
            <ul>
                <li><g:link controller="home" action="landing">Home</g:link></li>
                <li><g:link controller="cashInBank" action="index">Cash in Bank List</g:link></li>
                <li><g:link controller="cashInBank" action="create">New Cash in Bank Subsidiary Ledger</g:link></li>
                <li><g:link controller="cashInBank" action="fundTransfer">Process Fund Transfer</g:link></li>
            </ul>
        </content>
    </body>
</html>
