<%@ page import="icbs.gl.CashInBank" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Cash in Bank Subsidiary Ledger Cash and Check Transactions</title>
    </head>
    <body>

        <content tag="main-content">
            <div class="panel panel-default">
            <g:render template="cashInBankDetails"/>
            </div>
            <div class="panel panel-default">
                <div class = "panel-heading">
                    <h4>Transaction Details</h4>
                </div>
                    <div class="panel-body">
                        <g:form id="deposit" url="[resource:cashInBankInstance, action:'saveDeposit']" method="PUT" >
                            <fieldset class="form">
                                <div class="fieldcontain form-group ${hasErrors(bean: txnTemplateInstance, field: 'txnType', 'has-error')} required">
                                    <label class="control-label col-sm-4" for="txnType">Txn Type<span class="required-indicator">*</span></label>

                                    <div class="col-sm-8"><g:select id="txnType" name="txnType" from="${icbs.admin.TxnTemplate.findAllByTxnTypeAndMemoTxnType(icbs.lov.TxnType.read(45),icbs.lov.MemoTxnType.read(1))}"   optionKey="id" optionValue="description" required="" value="" onchange="getcode();" class="many-to-one form-control"/>
                                    </div>
                                </div>
                                <div class="fieldcontain form-group">
                                    <label class="control-label col-sm-4" for="intRate">Cash Deposit<span class="required-indicator">*</span></label>
                                    <div class="col-sm-8">
                                        <g:field class="form-control truncated" id="cashDeposit" name="cashDeposit" value="" />
                                    </div>
                                </div>
                                <g:hiddenField name="cashInBankId" id="cashInBankId" value="${params.id}" />
                                <div class="fieldcontain form-group">
                                    <label class="control-label col-sm-4" for="intRate">Check Deposit <span class="required-indicator">*</span></label>
                                    <div class="col-sm-8">
                                        <g:field class="form-control truncated" id="checkDeposit" name="checkDeposit" value="" />
                                    </div>
                                </div>
                                <div class="fieldcontain form-group">
                                    <label class="control-label col-sm-4" for="intRate">Reference <span class="required-indicator">*</span></label>
                                    <div class="col-sm-8">
                                        <g:field class="form-control" type="Text"  id="reference"  name="reference" value="" />
                                    </div>
                                </div>
                                <div class="fieldcontain form-group">
                                    <label class="control-label col-sm-4" for="intRate">Particulars <span class="required-indicator">*</span></label>
                                    <div class="col-sm-8">
                                        <g:field class="form-control" type="Text" id="particulars"   name="particulars" value="" />
                                    </div>
                                </div>
                            </fieldset>
                        </g:form>
                    </div>
            </div>
        </content>

        <content tag="main-actions">
            <ul>
                <li><g:actionSubmit class="save" id="saveDeposit" name="saveDeposit" action="saveDeposit" value="${message(code: 'default.button.Save.label', default: 'Save')}" onclick="
                        alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                                function(){
                                     checkIfAllowed('CFG00303', 'form#deposit', 'Override edit cash in bank.', null);
                                },
                                function(){
                                    return;
                                });
                    "/></li>
                <li><g:link action="show" id="${cashInBankInstance.id}">Cancel</g:link></li>
            </ul>
        </content>
    </body>
</html>
