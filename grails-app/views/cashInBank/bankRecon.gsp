<%@ page import="icbs.gl.CashInBank" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<title>Bank Reconciliation</title>
    </head>
    <body>
        <content tag="breadcrumbs">
            <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/cashInBank')}"></a>
            <span class="fa fa-chevron-right"></span><span class="current"></span>
        </content>
        <content tag="main-content">
            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">Account Number <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                    <g:field class="form-control" type="Text"  id="acctno"  name="acctno" value="${bankReconInstance}" readonly="readonly"/>
                </div>
            </div>

            <div class="form-group fieldcontain ">
                <label class="control-label col-sm-4" for="birthDate">
                    <g:message code="customer.startDate.label" default="Start Date" />
                    <span class="required-indicator">*</span>
                </label>
                <div class="col-sm-8">
                    <g:customDatePicker id="startDate" name="startDate" value=""class="form-control"  />
                    <g:hasErrors bean="" field="startDate">
                        <div class="controls">
                            <span class="help-block">
                                <g:eachError bean="" field="startDate">
                                    <g:message error="${it}" /><br/>
                                </g:eachError>
                            </span>
                        </div>
                    </g:hasErrors>
                </div>
            </div>

            <div class="form-group fieldcontain  ">
                <label class="control-label col-sm-4" for="birthDate">
                    <g:message code="customer.startDate.label" default="End Date" />
                    <span class="required-indicator">*</span>
                </label>
                <div class="col-sm-8">
                    <g:customDatePicker id="endDate" name="endDate" value=""class="form-control"  />
                    <g:hasErrors bean="" field="endDate">
                        <div class="controls">
                            <span class="help-block">
                                <g:eachError bean="" field="endDate">
                                    <g:message error="${it}" /><br/>
                                </g:eachError>
                            </span>
                        </div>
                    </g:hasErrors>
                </div>
            </div>
            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">Beginning Balance <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                    <input id="begBal" type="text" class="form-control"/>
                    <!--<g:field class="form-control" type="Text"  id="begBal"  name="begBal" value="" />-->
                </div>
            </div>

            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">End Balance <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                    <input id="endBal" type="text" class="form-control"/>
                    <!--<g:field class="form-control" type="Text"  id="endBal"  name="endBal" value="" />-->
                </div>
            </div>

            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">Balance Information <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                    <g:field class="form-control" type="Text"  id="balinfo"  name="balinfo" value="" readonly="readonly"/>
                </div>
            </div>
            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">Total Balance Unclear <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                    <g:field class="form-control" type="Text"  id="balunc"  name="balunc" value="" readonly="readonly"/>
                </div>
            </div>
            <div class="fieldcontain form-group">
                <label class="control-label col-sm-4" for="intRate">Adjusting Balance <span class="required-indicator">*</span></label>
                <div class="col-sm-8">
                   
                    <g:field class="form-control" type="Text"  id="adjBal"  name="adjBal"/>
                </div>
            </div>
            <g:hiddenField name="cibid" id="cibid" value=""/>
            <br>
            <br>
            <h3>Summarize Data</h3>
            <div>
                <table id="bankrecon" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Transaction Date</th>
                            <th>Debit Amount</th>
                            <th>Credit Amount</th>
                            <th>Ledger Balance</th>
                            <th>Reference</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </content>

        <content tag="main-actions">
            <ul>
                <li><button id="checkClearBtn" onclick="showCashInBankTransact();">Show Cash in Bank Transaction</button></li>
                <li><button id="savAdEntBtn" onclick="saveAdEntry();"> Save Adjusting Entry</button></li>
                <li><button id="saveTransactBtn" onclick="saveBankRecon();">Save Bank Reconciliation</button></li>

                <script>
                            function saveAdEntry(){
                                

                                var adjBal = $("#adjBal").val()
                                var endBal = $("#endBal").val()
                                var begBal = $("#begBal").val()
                                var total = sessionStorage.total

                                console.log(adjBal)
                                console.log(endBal)
                                console.log(begBal)
                                console.log(total)
                                console.log(parseFloat(adjBal)+parseFloat(begBal)+parseFloat(total))
                                
                                if(parseFloat(endBal).toFixed(2) == (parseFloat(adjBal)+parseFloat(begBal)+parseFloat(total)).toFixed(2)){
                                document.getElementById('saveTransactBtn').disabled = false
                                }else{
                                document.getElementById('saveTransactBtn').disabled = true
                                }


                            }
                    
                    function showCashInBankTransact(){


                        if($('#startDate').val() == ""){
                        alertify.alert(AppTitle,"Please fill all required data!", function(){});
                        return false;
                        }else if($('#endDate').val() == ""){
                        alertify.alert(AppTitle,"Please fill all required data!", function(){})
                        return false;
                        }else if($('#begBal').val() == ""){
                        alertify.alert(AppTitle,"Please fill all required data!", function(){})
                        return false;
                        }else if($('#endBal').val() == ""){
                        alertify.alert(AppTitle,"Please fill all required data!", function(){})
                        return false;
                        }


                                var obj = {
                                accountNumber: $('#acctno').val(),
                                startDate : $('#startDate').val(),
                                endDate : $('#endDate').val(),
                                begBal : $('#begBal').val(),
                                endBal : $('#endBal').val()
                                }


                                $.ajax({
                                     type: 'post',
                                           contentType:'applcation/json',
                                           data: JSON.stringify(obj),
                                           url:'/icbs/cashInBank/showCashInBank',
                                           success: function(data){
                                           console.log(data)
 //###################################################### START #############################################

                                            $('#bankrecon').dataTable().fnClearTable();
                                           $('#bankrecon').dataTable().fnDestroy();
                                          
                                           $('#bankrecon > tbody').html;
                                            var unchkDebit = 0
                                            var unchkCredit = 0
                                           $.each(data, function (_key, _value) {;
                                                var tr = "<tr id=" + _value.id + ">";
                                                console.log(_value.id)
                                                tr += "<td class='tdid' data-value='+_value.id+'><input name='reconchk' type='checkbox' class='checkbox' value="+_value.id+"></td>";
                                                tr += "<td>" + _value.txn_date.slice(0,10) + "</td>";
                                                tr += "<td align='right'>" + _value.debit_amt.toLocaleString('en-US', { style: 'currency', currency: 'USD' }) + "</td>";
                                                tr += "<td align='right'>" + _value.credit_amt.toLocaleString('en-US', { style: 'currency', currency: 'USD' }) +"</td>";
                                                tr += "<td align='right'>" + _value.balance_amt.toLocaleString('en-US', { style: 'currency', currency: 'USD' }) +"</td>";
                                                tr += "<td>" + _value.reference + "</td>";

                                                tr += "</tr>";
                                             
                                                $('#bankrecon').append(tr);
                                            })
                                            //get total value of all item
                                             $('#bankrecon').dataTable( {
                                                "paging":   false,
                                                "ordering": false,
                                                "info":     false
                                            } );
                                            //start
                                            $.each(data, function (_key, _value) {;
                                             unchkDebit = unchkDebit + _value.debit_amt
                                             unchkCredit = unchkCredit + _value.credit_amt
                                             
                                             sessionStorage.unchkDebit = unchkDebit
                                             sessionStorage.unchkCredit = unchkCredit
                                             sessionStorage.totalUnchkAmount = (unchkDebit - unchkCredit).toFixed(2)
                                            })
                                            console.log("total debit uncheck " + sessionStorage.unchkDebit)
                                            console.log("total credit uncheck " + sessionStorage.unchkCredit)
                                            console.log("initial unbalnce" + (sessionStorage.unchkCredit - sessionStorage.unchkDebit))
                                            $('#balunc').val(sessionStorage.unchkDebit - sessionStorage.unchkCredit);
                                            
                                            //end
                                          document.getElementById('saveTransactBtn').disabled = true;
                                          var total = 0
                                          var utotal = 0
                                          var ctr = 0
                                          var idStorage
                                          var idStorage1 = ""
                                          var idStorage2 = ""
                                          var chkTable =  $('#bankrecon').DataTable();
                                            $('#bankrecon tbody').on( 'click', '.checkbox', function () {
                                            //##JM
                                            var holderValue="";
                                            var eventPag
                                            $('input[name="reconchk"]:checked').each(function() {
                                            
                                            holderValue = holderValue + this.value + '@@';
                                   
                                            $('#cibid').val(holderValue)
                                            
                                         
                                            console.log($('#cibid').val())
                                            console.log(holderValue);
                                            });
                                            console.log()
                                            console.log("THIS IS HOLDER " +  holderValue);
                                            //##END
                                            

                                            var chkData = chkTable.row( this.closest('tr')).data()
                                         
                                           console.log()
                                            var balanceAmount = accounting.unformat(chkData[4])
                                            var debit = accounting.unformat(chkData[2])
                                            var credit = accounting.unformat(chkData[3])
                                            
                                            
                                            if(this.checked==true)
                                            {
                                      
                                            //##START COMPUTATION
                                          
                                            
                                            total =  (parseFloat(debit) - parseFloat(credit)) + parseFloat(total)
                                            console.log(total)
                                            $('#balinfo').val(total)
                                            $('#balunc').val(parseFloat(sessionStorage.totalUnchkAmount) - total)
                                            $('#balinfo').val(total)
                                            sessionStorage.total = total
                                                if(parseFloat($('#endBal').val()) == (parseFloat($('#begBal').val())+total)){
                                                $('#balinfo').val(total)
                                                document.getElementById('saveTransactBtn').disabled = false
                                                $('#cbid').val(holderValue)
                                                }else{
                                                document.getElementById('saveTransactBtn').disabled = true

                                                }
                                            //END COMPUTATION
                                            //    if(isNaN(total) || (total < 0)){
                                            //    total = 0
                                                
                                            //    }
                                            }else if(this.checked == false){
                                 
                                             balanceAmount = accounting.unformat(chkData[4])
                                             debit = accounting.unformat(chkData[2])
                                             credit = accounting.unformat(chkData[3])
                                             console.log("unchecked")
                                             console.log(credit)
                                             console.log(debit)
                                             
                                            total += (parseFloat(credit) - parseFloat(debit))
                                            
                                            
                                            
                                            console.log(total.toString().indexOf('e'))
                                            if(total.toString().indexOf('e') > -1){
                                            total = 0
                                            sessionStorage.total = total
                                            }
                                            sessionStorage.total = total
                                            $('#balinfo').val(total)
                                             $('#balunc').val(parseFloat(sessionStorage.totalUnchkAmount) - total)
                                                    if(parseFloat($('#endBal').val()) == (parseFloat($('#begBal').val())+total)){
                                                    $('#balinfo').val(total)
                                                    document.getElementById('saveTransactBtn').disabled = false
                                                     $('#cbid').val(holderValue)
                                                    }else{
                                                    document.getElementById('saveTransactBtn').disabled = true
                                                    $('#balinfo').val(total)
                                                     }
                                                    
                                            }


                                            } );



 //####################################################### END ###############################################
                                             },
                                            error: function(data){

                                            }

                              });

                            }
//##################################################START##############################
                            function saveBankRecon(){
                            sessionStorage.clear()
                            var obj = {
                                accountNumber: $('#acctno').val(),
                                startDate : $('#startDate').val(),
                                endDate : $('#endDate').val(),
                                begBal : $('#begBal').val(),
                                endBal : $('#endBal').val(),
                                cibid : $('#cibid').val(),
                                adjBal : $('#adjBal').val()
                                }


                                $.ajax({
                                     type: 'post',
                                           contentType:'applcation/json',
                                           data: JSON.stringify(obj),
                                           url:'/icbs/cashInBank/saveBankRecon',
                                           success: function(data){
                                           console.log(data)
                                           console.log(data[0])
 //###################################################### START #############################################
                                            console.log(data)
                                            if(data == "True"){
                                            alertify.alert(AppTitle,"Data Successfully Save!", function(){
                                                    window.location.href = "/icbs/cashInBank/index/"
                                            })
                                                
                                            }
 //####################################################### END ###############################################
                                             },
                                            error: function(data){
                                            alertify.alert(AppTitle,"ERROR Contact Admin!", function(){})
                                            }

                              });

                }
//######################################################END############################



                </script>
            </ul>
        </content>
    </body>
</html>
