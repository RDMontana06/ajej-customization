<div class="form-group">
  <label for="category" class="control-label">Transactions</label>
  <div class="col-sm-6">
  
    <g:select id="txnTemplates" name="txnTemplates" from="${icbs.admin.TxnTemplate.list()}" optionKey="id" optionValue="description" value="${productInstance?.txnTemplates?.id}" class="many-to-one form-control" multiple="" />
  
  </div>
</div>
                