<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankasset.label', default: 'Bankasset')}" />
		<title>Asset Transaction</title>
	</head>
	<body>
            
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/fixedasset')}">Fixed Asset</a>
          <span class="fa fa-chevron-right"></span><span class="current">Create/Purchase</span>
		</content>

            <content tag="main-content">
                        <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Fixed Asset Information</legend>
                        <div class="infowrap">
                             <dl class="dl-horizontal">
                               <dt>Asset Code</dt>
                               <dd>${txnInstanceList?.assetcode[0]}</dd>
                           </dl>
                           
                           <dl class="dl-horizontal">
                               <dt>GL Account</dt>
                               <dd>${txnInstanceList?.glacc[0]}</dd>
                           </dl>
                           
                           <dl class="dl-horizontal">
                               <dt>Description</dt>
                               <dd>${txnInstanceList?.assetdesc[0]}</dd>
                           </dl>
                           
                           
                           <dl class="dl-horizontal">
                               <dt>Asset Serial</dt>
                               <dd>${txnInstanceList?.assetserial[0]}</dd>
                           </dl>
                    
                        </div>
                    </fieldset>
                  </div>
                <br>
                
		<div id="create-bankasset" class="content scaffold-create" role="main">
			<div class="fieldcontain form-group ${hasErrors(bean: bankassetInstance, field: 'txnTemplate', 'has-error')} required">
                            <label class="control-label col-sm-4" for="debitglacc">
                                <g:message code="bankasset.debitglacc.label" default="Transaction Type" />
                                <span class="required-indicator">*</span>
                            </label>
                            <div class="col-sm-8"><g:select id="txnType" name="txnType.id" from="${icbs.lov.TxnType.findAllByIdInList([51,52,53,54])}" optionKey="id" optionValue ="description" value="" onchange ="getData(this.value);"class="form-control" noSelection="['':'']"/>

                                    <g:hasErrors bean="${bankassetInstance}" field="debitglacc">
                                        <div class="controls">
                                                <span class="help-block">
                                                    <g:eachError bean="${bankassetInstance}" field="debitglacc">
                                                        <g:message error="${it}" /><br/>
                                                    </g:eachError>
                                                </span>
                                        </div>
                                    </g:hasErrors>
                                </div>             
                        </div>
  
		</div>
                <br>
   
                <div class="fieldcontain form-group ${hasErrors(bean: loanLedgerInstance, field: 'txnTemplate', 'has-error')} ">
                    <label class="control-label col-sm-4" for="txnTemplate">
                        <g:message code="loanLedger.txnTemplate.label" default="Transaction Code" />        
                    </label>
                     <div class="col-md-8">
                                   <div class="form-group">       
                                    <select id="txntemplate" name="txntemplate" type="text" class="form-control req"></select>
                                    <span id="spantxnType" class="help-block"></span>
                                  </div>                    
                    </div>            
                </div>
           
                <div class="fieldcontain form-group ${hasErrors(bean: bankassetInstance, field: 'assetpo', 'has-error')} ">
                        <label class="control-label col-sm-4" for="purchasecost">
                            <g:message code="bankasset.assetpo.label" default="Purchase Cost" />
                            <span class="required-indicator">*</span>
                        </label>
                        <div class="col-sm-8"><g:field id="amount" name="amount" value="${fieldValue(bean: bankassetInstance, field: 'purchasecost')}" class="form-control"/>

                                <g:hasErrors bean="${bankassetInstance}" field="assetpo">
                                    <div class="controls">
                                            <span class="help-block">
                                                <g:eachError bean="${bankassetInstance}" field="assetpo">
                                                    <g:message error="${it}" /><br/>
                                                </g:eachError>
                                            </span>
                                    </div>
                                </g:hasErrors>
                            </div>             
                   </div>
                   <br>
                   <div class="fieldcontain form-group  ">
                        <label class="control-label col-sm-4" for="reference">
                            <g:message code="bankasset.assetpo.label" default="Reference" />
                            <span class="required-indicator">*</span>
                        </label>
                        <div class="col-sm-8"><g:field id="reference" name="reference" value="${fieldValue(bean: bankassetInstance, field: 'purchasecost')}" class="form-control"/>

                                <g:hasErrors bean="${bankassetInstance}" field="reference">
                                    <div class="controls">
                                            <span class="help-block">
                                                <g:eachError bean="${bankassetInstance}" field="reference">
                                                    <g:message error="${it}" /><br/>
                                                </g:eachError>
                                            </span>
                                    </div>
                                </g:hasErrors>
                            </div>             
                   </div>
                   <br>
                   <div class="fieldcontain form-group ${hasErrors(bean: bankassetInstance, field: 'assetpo', 'has-error')} ">
                        <label class="control-label col-sm-4" for="reference">
                            <g:message code="bankasset.assetpo.label" default="Particulars" />
                            <span class="required-indicator">*</span>
                        </label>
                        <div class="col-sm-8"><g:field id="particulars" name="particulars" value="${fieldValue(bean: bankassetInstance, field: 'purchasecost')}" class="form-control"/>

                                <g:hasErrors bean="${bankassetInstance}" field="particulars">
                                    <div class="controls">
                                            <span class="help-block">
                                                <g:eachError bean="${bankassetInstance}" field="assetpo">
                                                    <g:message error="${it}" /><br/>
                                                </g:eachError>
                                            </span>
                                    </div>
                                </g:hasErrors>
                            </div>             
                   </div>
                   
               <g:hiddenField name="assetid" value="${txnInstance}" />     
             <script>
                 function getData(x){
                 console.log($('#assetid').val())
                 console.log("this is txnType" + x)
                 
                   if(x==51){
                   
                   var obj = {
                        txnType:x,
                        assetid:$('#assetid').val()
                        }
                    //purcost
                    $.ajax({


                           type: 'POST',
                           contentType: "application/json",
                           data:JSON.stringify(obj),
                           url: "/icbs/Fixedasset/getPurcost",
                           success: function(data) {
                                   console.log(JSON.stringify(data));
                                   $.each(data, function (key, value) {
                                     $('#amount').val(value.purcost)
                                   });
                           },
                           error: function(data) {
                           }
                           });
                    //dropdown
                    $.ajax({
                    
                      
                            type: 'POST',
                            contentType: "application/json",
                            data:JSON.stringify(obj),
                            url: "/icbs/Fixedasset/dropDown",
                            success: function(data) {
                                    console.log(JSON.stringify(data));
                                    $('#txntemplate').find('option').remove()
                                   $('#txntemplate').html('');
                                    
                                    $.each(data, function (key, value) {
                                        $('#txntemplate').append("<option value=" + value.id + ">" + value.description + "</option>");
                                    });
                            },
                            error: function(data) {
                            }
                            });
                            
                            
                            
                    }else{
                       var obj = {
                        txnType:x,
                        assetid:$('#assetid').val()
                        }
                    $.ajax({
                
                      
                            type: 'POST',
                            contentType: "application/json",
                            data:JSON.stringify(obj),
                            url: "/icbs/Fixedasset/dropDown",
                            success: function(data) {
                                    console.log(JSON.stringify(data));
                                    $('#txntemplate').find('option').remove()
                                    $('#txntemplate').html('');
                                    $.each(data, function (key, value) {
                                        $('#txntemplate').append("<option value=" + value.id + ">" + value.description + "</option>");
                                    });
                            },
                            error: function(data) {
                            }
                            });
                    $('#amount').val(0)
                    
                    }
                    //drop down
                    
                    
                 }
             </script>
            </content>
            <content tag="main-actions">
                <ul>
                    <li><button id="create" onclick="saveAssetTransaction();">Create</button></li>
                    <li><g:link action="index"><g:message code="default.cancel.label" args="[entityName]" default="Cancel" /></g:link></li>
                    <script>
                    function saveAssetTransaction(){
                    
                   
                    
                     var obj = {
                        asetid:$('#assetid').val(),
                        txnType:$('#txnType').val(),
                        txnTemp:$('#txntemplate').val(),
                        amount:$('#amount').val(),
                        reference:$('#reference').val(),
                        particulars:$('#particulars').val(),
                    }
                    //#############START#####
                     $.ajax({

                            type: 'POST',
                            contentType: "application/json",
                            data:JSON.stringify(obj),
                            url: "/icbs/Fixedasset/saveAssetTransaction",
                            success: function(data) {
                                  console.log(data)
                                  if(data.toString() == 'True'){
                                   alertify.alert(AppTitle,"Successfully Created!",
                                                           function(){
                                                               window.location.href="/icbs/fixedasset/show/" + $('#assetid').val();
                                                           }
                                                       ); 
                                  }else{
                                   alertify.alert(AppTitle,"Successfully Created!",
                                                           function(){
                                                               return
                                                           }
                                                       ); 
                                  }
                                   
                            },
                            error: function(data) {
                            }
                            });
                  
                    //############END########
                    }
                    </script>
                </ul>
            </content>
	</body>
</html>
