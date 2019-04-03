<%@ page import="icbs.gl.CashInBank" %>
<%@ page import="icbs.gl.CashInBankCheckbook" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Cash in Bank Subsidiary Ledger Check Details</title>
    </head>
    <body>

        <content tag="main-content">

             <div id="show-cashInBank" class="content scaffold-show" role="main">

		<table class="table table-bordered table-rounded table-striped table-hover">
                    <tbody>
                        <tr>
                            <td style="width:30%"><label>Check Number</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.checkNo}</td>
                        </tr>

                        <tr>
                            <td style="width:30%"><label>Check Voucher Number</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.checkVoucherNo}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Reference</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.reference}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Check Date</label></td>
                            <td style="width:70%"><g:formatDate  format="MM/dd/yyyy" date="${cashInBankCheckbookInstance?.checkDate}" /></td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Payee</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.payee}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Particulars</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.particulars}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Release Date</label></td>
                            <td style="width:70%"><g:formatDate  format="MM/dd/yyyy" date="${cashInBankCheckbookInstance?.releaseDate}" /></td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Check Amount</label></td>
                            <td style="width:70%"><g:formatNumber format="###,###,##0.00" number="${cashInBankCheckbookInstance?.checkAmt}"/></td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Issued By</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.issuedBy?.name}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Created By</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.createdBy?.name}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Status</label></td>
                            <td style="width:70%">${cashInBankCheckbookInstance?.checkStatus?.description}</td>
                        </tr>
                        <tr>
                            <td style="width:30%"><label>Transaction Reference</label></td>
                            <g:if test="${cashInBankCheckbookInstance?.txnFile}">
                                <td style="width:70%">
                                    <g:link action="showGlEntries" controller="tellering" id="${cashInBankCheckbookInstance?.txnFile.id}" >${cashInBankCheckbookInstance?.txnFile.id}</g:link>
                                </td>
                            </g:if>
                            <g:else>
                                <td style="width:70%">N/A</td>
                            </g:else>
                        </tr>
                    </tbody>
                </table>
            </div>

        </content>

        <content tag="main-actions">
            <ul>
                <li><g:link action="show" controller="cashInBank" id="${cashInBankCheckbookInstance.cashInBank.id}" >Cash in Bank Details</g:link></li>
                <li><g:link action="index" controller="cashInBank">Cash in Bank List</g:link></li>
                <li><a href="#" onclick="genReportCHK001();">Print Check Voucher</a></li>
                
                <g:javascript>
                    function genReportCHK001(){
                        reportlink = "${icbs.admin.Institution.get(94).paramValue}${icbs.admin.Report.get(66).baseParams}&output=${icbs.admin.Report.get(66).outputParam}";
                        reportlink = reportlink + "&reportUnit=${icbs.admin.Report.get(66).reportUnit}";             
                        reportlink = reportlink + "&check_no=${cashInBankCheckbookInstance?.checkNo}";
                        sendtojasperver(reportlink);
                    }
                </g:javascript>  
            </ul>
        </content>
    </body>
</html>
