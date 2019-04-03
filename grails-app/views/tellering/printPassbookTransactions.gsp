 <!--
   To change this license header, choose License Headers in Project Properties.
   To change this template file, choose Tools | Templates
   and open the template in the editor.
 -->
 
 <%@ page import="icbs.tellering.TxnFile" %>
 <%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html>
 <html>
     <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="layout" content="main">
         <title>Print Passbook Transactions</title>
     </head>    
     <body>
         <content tag="main-content">
              <g:if test="${flash.message}">
                 <script>
                         $(function(){
                             var x = '${flash.message}';
                                 notify.message(x);
                                 $('#SlipTransaction').hide();
                                 if(x.indexOf('|success') > -1){
                                 $('#SlipTransaction').show();                                
                             }
                            // console.log(x)
                            // setTimeout(function(){ notify.success(x); }, 3000);
                         });
                 </script>
             </g:if>            
             <div class="section-container">
                 <fieldset>
                     <legend class="section-header">Account Information</legend>
                         <div class="infowrap">
                             <div class="col-xs-8 col-sm-6 col-md-6">
                                 <dl class="dl-horizontal">
                                     <dt>Account Number</dt>
                                     <dd>${pbLedger?.acctNo}</dd>
                                 </dl>
                             </div>
                             <div class="col-xs-8 col-sm-6 col-md-6">
                                 <dl class="dl-horizontal">
                                     <dt>Account Name</dt>
                                     <dd>${pbLedger?.acct?.acctName}</dd>
                                 </dl>
                             </div>                            
                         </div>
                 </fieldset>
             </div>
         
 
                 <g:form name="pbLineForm" action="savePbLine" controller="tellering">
                     <div class="fieldcontain form-group ${hasErrors(bean: pbLedger, field: 'passbookLine', 'has-error')} ">
                         <label class="control-label col-sm-4" for="passbookLine">
                             <g:message code="pbLedger.passbookLine.label" default="Passbook Line Number" />
                         </label>
 
                         <div class="col-sm-6">
                             <g:field id="pbl" name="passbookLine" required="true" value="${fieldValue(bean: pbLedger, field: 'passbookLine')}" class="txn-amt form-control"/>
                         </div>             
                     </div>
                 </g:form>        
         </content>
         
         <content tag="main-actions">
             <ul>
                 <li><a id="save" class="save" onclick="
                         jQuery('#pbLineForm').submit();
                     ">${message(code: 'default.button.create.label', default: 'Submit')}</a></li>
                 <li><g:link action="index">Tellering Index</g:link></li>
             </ul>                                        
         </content>            
     </body>
 </html>