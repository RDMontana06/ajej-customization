<%@ page import="icbs.gl.CashInBank" %>
<%@ page import="icbs.gl.CashInBankCheckbook" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Cash in Bank Subsidiary Ledger Checkbook List</title>
    </head>
    <body>
        <content tag="breadcrumbs">
                <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/cashInBank')}">Cash in Bank/Due From Bank Subsidiary Ledger</a>
                <span class="fa fa-chevron-right"></span><span class="current">Cash in Bank Subsidiary Ledger Checkbook List</span>
        </content>

        <content tag="main-content">
            <g:render template="cashInBankDetails"/>

            <br></br>
            <h3>Checkbooks</h3>
		<div class="table-responsive">
                    <table class="table table-bordered table-rounded table-striped table-hover" id="tblmodule">
                        <thead>
                            <tr>
				<g:sortableColumn property="checkNo" title="${message(code: 'CashInBankCheckbook.checkNo.label', default: 'Chk#')}" />
				<g:sortableColumn property="checkDate" title="${message(code: 'CashInBankCheckbook.checkDate.label', default: 'Date')}" />
				<g:sortableColumn property="payee" title="${message(code: 'CashInBankCheckbook.payee.label', default: 'Payee')}" />
                                <g:sortableColumn property="checkAmt" title="${message(code: 'CashInBankCheckbook.checkAmt.date', default: 'Amount')}" />
				<g:sortableColumn property="checkStatus" title="${message(code: 'CashInBankCheckbook.checkStatus.label', default: 'Status')}" />
				<td><label>Action</label></td>
                            </tr>
			</thead>
			<tbody>
                            <g:each in="${CashInBankCheckbook.findAllByCashInBank(cashInBankInstance)}" status="i" var="cbInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${cbInstance?.checkNo}</td>
                                    <td><g:formatDate format="MM/dd/yyyy" date="${cbInstance?.checkDate}"/></td>
                                    <td>${cbInstance?.payee}</td>
                                    <td align="right"><g:formatNumber format="###,###,###,##0.00" number="${cbInstance?.checkAmt}"/></td>
                                    <td>${cbInstance?.checkStatus}</td>
                                    <td>
                                        <g:link class="btn btn-secondary" action="chkDetails" id="${cbInstance.id}">View Details</g:link>
                                        <g:if test="${cbInstance.releaseDate == null && cbInstance?.checkDate != null}">
                                            <g:link class="btn btn-secondary" action="chkDisburse" id="${cbInstance.id}">Release Check</g:link>
                                        </g:if>
                                    </td>
				</tr>
                            </g:each>
			</tbody>
                    </table>
                </div>
                  <script>
         $(document).ready(function() {
                                    $('#tblmodule').DataTable( {
                                        initComplete: function () {
                                            this.api().columns().every( function () {
                                                var column = this;
                                                var select = $('<select><option value=""></option></select>')
                                                    .appendTo( $(column.footer()).empty() )
                                                    .on( 'change', function () {
                                                        var val = $.fn.dataTable.util.escapeRegex(
                                                            $(this).val()
                                                        );
                                                //to select and search from grid
                                                        column
                                                            .search( val ? '^'+val+'$' : '', true, false )
                                                            .draw();
                                                    } );

                                                column.data().unique().sort().each( function ( d, j ) {
                                                    select.append( '<option value="'+d+'">'+d+'</option>' )
                                                } );
                                            } );
                                        }
                                    } );
                                } );

                </script>

        </content>

        <content tag="main-actions">
            <ul>
                <li><g:link action="show" controller="cashInBank" id="${cashInBankInstance.id}" >Cash in Bank Details</g:link></li>
                <li><g:link action="createCb" controller="cashInBank" id="${cashInBankInstance.id}">Create New Checkbook</g:link></li>
                <li><g:link action="createCheckTransaction" controller="cashInBank" id="${cashInBankInstance.id}">Check Voucher Transaction</g:link></li>
                <li><g:link action="index" controller="cashInBank" id="${cashInBankInstance.id}">Cash in Bank List</g:link></li>
            </ul>
        </content>

    </body>
</html>
