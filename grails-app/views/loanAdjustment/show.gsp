
<%@ page import="icbs.loans.LoanLedger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'loanLedger.label', default: 'LoanLedger')}" />
		<title>View Loan Non-Cash Transaction Details</title>
              
	</head>
	<body>
        <content tag="main-content">   
		<div id="show-loanLedger" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                <div class="box-body">
                    <div class="alert alert-info alert-dismissable">
                        <i class="fa fa-info"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Message</b> <div class="message" role="status">${flash.message}</div>
                    </div>
                </div>
            </g:if>
                          <g:textField name="loanid" id="loanid" value="${loanLedgerInstance?.loan?.id}"style="display:none"  />
			<div>						
				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Loan Account</label>
					<span>${loanLedgerInstance?.loan?.accountNo}</span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Deposit Account</label>
					<span>${loanLedgerInstance?.deposit?.acctNo}</span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Transaction Type</label>
					<span>${loanLedgerInstance?.txnType?.description}</span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Transaction Code</label>
					<span>${loanLedgerInstance?.txnTemplate?.description}</span>
				</div>								

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Transaction Reference</label>
					<span>${loanLedgerInstance?.txnRef}</span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Transaction Particulars</label>
					<span>${loanLedgerInstance?.txnParticulars}</span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Transaction Date</label>
					<span><g:formatDate format="MM/dd/yyyy" date="${loanLedgerInstance?.txnDate}"/></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Principal Debit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.principalDebit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Principal Credit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.principalCredit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Principal Balance</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.principalBalance}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Interest Debit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.interestDebit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Interest Credit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.interestCredit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Interest Balance</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.interestBalance}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Penalty Debit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.penaltyDebit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Penalty Credit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.penaltyCredit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Penalty Balance</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.penaltyBalance}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Charges Debit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.chargesDebit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">Charges Credit</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.chargesCredit}" /></span>
				</div>

				<div class="fieldcontain form-group">
					<label class="control-label col-sm-4">ChargesBalance</label>
					<span><g:formatNumber format="###,###,##0.00" number="${loanLedgerInstance?.chargesBalance}" /></span>
				</div>
			</div>
			<%--<g:form url="[controller:loanAdjustment, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" controller="loanAdjustment" id="${loanLedgerInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
		</div>
        </content>
         <content tag="main-actions">
            <ul>
                <li><g:link action="create">New Loan Non-Cash Transaction</g:link></li>
                <!-- <li><g:link action="index">Search Loan Adjustment</g:link></li> -->
                <li><g:link target="_blank" controller="loanAdjustment" action="printValidation" > Validation Slip </g:link></li>
                <li><g:link target="_blank" controller="loanAdjustment" action="printCheckDisb" > Check Print </g:link></li>
            </ul>
        </content>
	</body>
</html>
