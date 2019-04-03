<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <asset:javascript src="depositHelper.js"/>
        <title>Memo Transactions</title>
        <g:javascript>
            function changeMemoForm(caller){
                if(caller==="adjustment"){
                    checkIfAllowed("DEP01001", adjustmentAuthCallback);     
                }
                if(caller==="remittance"){
                    checkIfAllowed("DEP01002", remittanceAuthCallback);
                }
                if(caller==="billsPayment"){
                    checkIfAllowed("DEP01003", billsPaymentAuthCallback);
                }
            }
            function adjustmentAuthCallback() {
                icbs.Deposit.Memo('adjForm',"${createLink(controller : 'deposit', action:'changeMemoFormAjax')}",$('#adjustmentFormSend').serialize()+"&formType=0");
            }
            function remittanceAuthCallback() {
                icbs.Deposit.Memo('remForm',"${createLink(controller : 'deposit', action:'changeMemoFormAjax')}",$('#remittanceFormSend').serialize()+"&formType=1");
            }
            function billsPaymentAuthCallback() {
                icbs.Deposit.Memo('billsForm',"${createLink(controller : 'deposit', action:'changeMemoFormAjax')}",$('#billsPaymentFormSend').serialize()+"&formType=2");
            }
            var modal;
            function updateCustomerDetailsForm(params){
                params.boxName = "Sender";
                icbs.Deposit.Form.getForm('customerDetails',"${createLink(controller : 'deposit', action:'showCustomerDetailsAjax')}",params);
            }
            function initializeCustomerDetailsSearchModal(){
                modal = new icbs.UI.Modal({id:"customerDetailsModal",url:"${createLink(controller : 'search', action:'search')}",title:"Search Customer",onCloseCallback:updateCustomerDetailsForm});
            }
           
        </g:javascript>
    </head>
    <body>

        <content tag="main-content">
            <g:if test="${flash.message}">
                      <script>
                        $(function(){
                            var x = '${flash.message}';
                                notify.message(x);
                        });
                </script>  
            </g:if>
             <g:if test="${flash.errors}">
                 <script>
                    $(function(){
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
                </script>
            </g:if>
            <g:hasErrors bean="${billsPaymentInstance}">
                <script>
                    $(function(){
                        var x = '${it}';
                        notify.message(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
                </script>
            </g:hasErrors>
            <g:hasErrors bean="${remittanceInstance}">
                <script>
                    $(function(){
                        var x = '${flash.message}';
                                notify.message(x);
                    });
                </script>
            </g:hasErrors>
            <g:hasErrors bean="${adjustmentInstance}">
                <script>
                    $(function(){
                        var x = '${it}';
                        notify.message(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
                </script>
            </g:hasErrors>
            <div class="row">
                <div class="col-md-6">
                   <g:render template='/customer/details/customerDetails' model="[customerInstance:depositInstance?.customer]"/>
                </div>

                <div class="col-md-6">
                   <g:render template='/deposit/details/depositDetails' model="[depositInstance:depositInstance]"/> 
                </div>
            </div>
            <g:if test = "${depositInstance.type.id == 3}">
                <div class="row">
                    <div class="col-md-6">
                        <g:render template='/deposit/details/fdDetails' model="[depositInstance:depositInstance]"/>
                    </div>
                </div>
            </g:if>    
            <div class="row">
                <div id="showMemoFormDiv">
                    <g:render template="memo/form"/>
                </div>
            </div>
        </content>
        <content tag="main-actions">
            <ul>
                <li>
                    <a href=# onclick="alertify.confirm(AppTitle,'Are you sure you want to return to Deposit Inquiries page?',
                        function(){
                        var t_url = '/icbs/deposit/depositInquiry/${depositInstance?.id}';
                        location.href=t_url;},
                        function(){});">Return to Deposit Inquiry Page</a>
                </li>
 <!--               <g:if test="${flash.message == "Memo Adjustment successfully made.|success|alert"}">
                    <li>
                        <a href=# onclick="alertify.confirm(AppTitle,'Print Memo Debit/Credit Adjustment Validation Slip?',
                            function(){
                                var w = window.open('/icbs/deposit/MemoTransactionValidationSlip', '_blank');
                                    w.print()
                                },
                            function(){});
                            ">Print Adjustment Validation</a>
                    </li>
                </g:if>
                <g:if test="${flash.message == "Memo Remittance Successfully made.|success|alert"}">
                    <li>
                        <a href=# onclick="alertify.confirm(AppTitle,'Print Memo Remittance Validation Slip?',
                            function(){
                                var w = window.open('/icbs/deposit/MemoTransactionValidationSlip', '_blank');
                                    w.print()
                                },
                            function(){});
                            ">Print Remittance Validation</a>
                    </li>
                </g:if>
                <g:if test="${flash.message == "Bills Payment Successfully made.|success|alert"}">
                    <li>
                        <a href=# onclick="alertify.confirm(AppTitle,'Print Memo Bills Payment Validation Slip?',
                            function(){
                                var w = window.open('/icbs/deposit/MemoTransactionValidationSlip', '_blank');
                                    w.print()
                                },
                            function(){});
                            ">Print Bills Payment Validation</a>
                    </li>
                </g:if> -->
            </ul>                                        
        </content>
    </body>
</html>