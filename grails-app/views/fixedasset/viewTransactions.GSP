<%@ page import="accounting.fixedasset.Bankasset" %>
<%@ page import="accounting.fixedasset.FixedAssetLedger" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Fixed Asset Ledger Transactions</title>
    </head>
    <body>

        <content tag="main-content">
            <div class="row">
            <div class="col-xs-12 col-sm-12">
                <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Asset  Information</legend>
                        <div class="infowrap">
                            <div class="col-xs-12 col-sm-6">
                                <dl  class="dl-horizontal">
                                    <dt>Purchase Date</dt>
                                    <dd><g:formatDate format="yyyy-MM-dd" date="${bankassetInstance?.purdate}" /></dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>Asset Code</dt>
                                    <dd>${bankassetInstance?.assetcode}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>Asset Description</dt>
                                    <dd>${bankassetInstance?.assetdesc}</dd>
                                </dl>
                                <dl  class="dl-horizontal">
                                    <dt>Net Book Value</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.deprevalue - bankassetInstance?.accDepreciation}"/></dd>
                                </dl>
                            </div>
                        </div>
                    </fieldset>
                </div><!-- end section-container-->
            </div><!-- end of column -->
            </div>
            <div class="panel panel-default">
                <div class = "panel-heading">
                    <h4>Transaction Details</h4>
                </div>
                <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-rounded table-striped table-hover">
                        <thead>
                            <tr>
				<g:sortableColumn property="txnDate" title="${message(code: 'fixedAssetLedger.txnDate.label', default: 'Txn Date')}" />
				<g:sortableColumn property="valueDate" title="${message(code: 'fixedAssetLedger.valueDate.label', default: 'Value Date')}" />
                                <g:sortableColumn property="reference" title="${message(code: 'fixedAssetLedger.reference.date', default: 'References')}" />
				<g:sortableColumn property="particulars" title="${message(code: 'fixedAssetLedger.particulars.label', default: 'Particulars')}" />
				<g:sortableColumn property="debitAmt" title="${message(code: 'fixedAssetLedger.debitAmt.label', default: 'Debit Amount')}" />
				<g:sortableColumn property="creditAmt" title="${message(code: 'fixedAssetLedger.creditAmt.label', default: 'Credit Amount')}" />
				<g:sortableColumn property="balanceAmt" title="${message(code: 'fixedAssetLedger.balanceAmt.label', default: 'Balance Amount')}" />
                            </tr>
			</thead>
			<tbody>
                            <g:each in="${FixedAssetLedger.findAllByBankAsset(bankassetInstance)}" status="i" var="cashInBankLedgerInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><g:formatDate format="MM/dd/yyyy" date="${cashInBankLedgerInstance?.txnDate}"/></td>
                                    <td><g:formatDate format="MM/dd/yyyy" date="${cashInBankLedgerInstance?.valueDate}"/></td>
                                    <td>${cashInBankLedgerInstance?.reference}</td>
                                    <td>${cashInBankLedgerInstance?.particulars}</td>
                                    <g:if test="${cashInBankLedgerInstance?.debitAmt == 0}">
                                        <td></td>
                                    </g:if>
                                    <g:else>
                                    <td align = "right"><g:formatNumber format="###,###,##0.00" number="${cashInBankLedgerInstance?.debitAmt}"/></td>
                                    </g:else>
                                    <g:if test="${cashInBankLedgerInstance?.creditAmt == 0}">
                                        <td></td>
                                    </g:if>
                                    <g:else>
                                    <td align = "right"><g:formatNumber format="###,###,##0.00" number="${cashInBankLedgerInstance?.creditAmt}"/></td>
                                    </g:else>
                                    <td align = "right"><g:formatNumber format="###,###,##0.00" number="${cashInBankLedgerInstance?.balanceAmt}"/></td>
				</tr>
                            </g:each>
			</tbody>
                    </table>
                </div>
                </div>
            </div>
		<div class="pagination">
                    <g:paginate total="${CashInBankInstanceCount ?: 0}" params="${params}" />
		</div>
        </content>

        <content tag="main-actions">
            <ul>
                <li><g:link action="show" controller="fixedasset" id="${bankassetInstance.id}" >View Fixed Asset Details</g:link></li>
                <li><g:link action="index" controller="fixedasset" id="${bankassetInstance.id}">Fixed Asset List</g:link></li>
            </ul>
        </content>
    </body>
</html>
