<%@ page import="icbs.gl.GlBatch" %>
<%@ page import="icbs.admin.Branch" %>

%{-- Batch ID --}%
<div class="fieldcontain form-group required">
	<label class="control-label col-sm-4" for="batchID">Batch ID</label>
    <div class="controls col-sm-8">
      <input type="text" id="batchID" class="form-control" v-model="newBatchId" disabled="disabled">
    </div>           
</div>

%{-- value date --}%
<div class="fieldcontain form-group required">
    <label class="control-label col-sm-4" for="ValueDate">Batch Value Date</label>
    <div class="controls col-sm-8"  >
      	
    <g:customDatePicker value="${Branch?.get(1).runDate}" id="valueDate" name="newValueDate" precision="day" class="form-control"  default="none" noSelection="['': '']" />
     </div>           
</div>

%{-- Template --}%
<div class="fieldcontain form-group required">
    <label class="control-label col-sm-4" for="template">Template</label>
    <div class="controls col-sm-8">
    <g:select id="template" name="template.id" from="${icbs.gl.GlBatchTemplate.list()}" optionKey="id" optionValue="description" class="many-to-one form-control" noSelection="['null': '']" v-model="newTemplate"/>
    </div>       
</div>

%{-- Batch Name --}%
<div class="fieldcontain form-group required">
    <label class="control-label col-sm-4" for="batchName">Batch Name</label>
    <div class="controls col-sm-8">
      <input type="text" id="batchName" class="form-control" v-model="newBatchName">
    </div>   
</div>

%{-- Branch Name --}%
<div class="fieldcontain form-group required">
    <label class="control-label col-sm-4" for="valueDate">Branch</label>
    <div class="controls col-sm-8">
       <g:select id="branch" name="branch.id" from="${icbs.admin.Branch.findAll{status.id == 2}}" optionKey="id" optionValue="name" class="many-to-one form-control" noSelection="['null': '']" v-model="branch" />
    </div>
</div>

%{-- Loan Accounts --}%
<div v-if=" newTemplate != '1' " class="fieldcontain form-group required">
  <div class="control-label col-sm-4">
    <label for="account">Account</label>
  </div>
    
    <div class="controls col-sm-8">
      <g:hiddenField name="glBatchLoan" id="glBatchLoanHidden" v-model="newLoans"/>
      <input class="form-control" id="glBatchLoan" type="text" readonly="true">
    </div>

    <div class="controls col-sm-1">
      <input type="button" href="#" 
        class="btn btn-secondary" 
        onclick="showLoanSearchModal()"
      value="Search"/>
  </div>     
</div>

%{-- Currency --}%
<div class="fieldcontain form-group required">
    <label class="control-label col-sm-4" for="batchCurrency">Batch Currency</label>
    <div class="controls col-sm-8">
      <g:select id="currency" name="currency.id" from="${icbs.admin.Currency.findAll{configItemStatus.id == 2}}" optionKey="id" optionValue="name" value="${glAccountInstance?.currency?.id}" class="many-to-one form-control" noSelection="['null': '']"
      v-model="newCurrency"/>
    </div>
</div>







