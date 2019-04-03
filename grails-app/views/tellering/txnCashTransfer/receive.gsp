<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>

<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <title>Teller Cash Transfer Transaction (Receiving)</title>

        <!-- Page specific CSS and JS -->
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'cashtransfer.css')}" type="text/css">
        <script type="text/javascript">
            var c;
        </script>
        
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
                    <div id="SlipTransaction" class="alert alert-success alert-dismissable" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <div> 
                                <a onclick="
                                         var w = window.open('printValidationSlip', '_blank')
                                             w.print();
                                         ">
                                     <g:img dir="images" file="validate.png" width="35" height="35"/>
                                     Validation Slip
                                </a>
                            </div>   
                    </div>
                </g:if>
            <g:form name="txnCashTransferForm" controller="tellering">
                <g:render template='txnCashTransfer/receiveform' model="[txnCashTransferInstance:txnCashTransferInstance,sourcetxn:sourcetxn]"/>
                <g:actionSubmit id="tlrcashsave" value="Sum" action="receiveTellerCashTransferSave" style="display:none"/>
		<g:actionSubmit id="tlrcashcancel" value="Difference" action="receiveTellerCashCancel" style="display:none"/>
            </g:form>
 
        </content>
         <!--Grails tag for jasper plugin-->
         <g:jasperReport action="printSLIP"  controller="tellering" format="PDF" name="TRANSACTION"  jasper="SLIP">
         </g:jasperReport>
        <content tag="main-actions">
            <ul>
                <li><a class="save" onclick="
                        if($('#txnTemplate').val() === '-- Select a transaction reference --')
                        {
                            notify.message('No transaction to receive|error|alert'); 
                            return;
                        }
                        
                    
                        if(!$('#txnTemplate').val())
                        { 
                            notify.message('No transaction to receive|error|alert'); 
                            return;
                        } 
                        
                        alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                        function(){
                            $('#tlrcashsave').click();
                        },
                        function(){
                            return;
                        });
                        ">${message(code: 'Receive', default: 'Receive')}</a></li>
                <li><a class="save" link action="" onclick="
                        if($('#txnTemplate').val() == '-- Select a transaction reference --')
                        { 
                            notify.message('No transaction to cancel.|error|alert'); 
                            return;
                        }
                                                            
                        alertify.confirm(AppTitle,'Are you sure you want to continue this transaction?',
                        function(){
                            $('#tlrcashcancel').click();
                        },
                        function(){
                            return;
                        });
                        ">Cancel Transaction</a></li>
                <li><g:link action="index">Tellering Index</g:link></li>
            </ul>                                        
        </content>
    </body>
</html>
