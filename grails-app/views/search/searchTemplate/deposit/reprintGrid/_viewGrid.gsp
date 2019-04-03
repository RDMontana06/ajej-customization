<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page contentType="text/html;charset=UTF-8" %>
<div  name="inlineSearchDiv" id="inlineSearchDiv">
    <g:javascript>
        var searchVar = new icbs.Utilities.Search("${createLink(controller : 'search', action:'search')}");
    </g:javascript>
        <div class="section-container">
            <fieldset><legend class="section-header">Transactions</legend>
                <g:form id="searchForm" name="searchForm">
                <!--Custom Action  -->
                <g:hiddenField id="id" name="id" value="${params?.id ?:depositInstance?.id}"/>
                <g:hiddenField id="type" name="type" value="${params?.type ?:depositInstance?.type?.id}"/>
                <g:hiddenField id="searchDomain" name="searchDomain" value="depositreprint"/>
                <g:hiddenField id="actionTemplate" name="actionTemplate" value="${params.actionTemplate}"/>

                
                    <div class="row">
                        <div class="col-md-12">
                            <div class=" col-md-5">
                                    <label>&nbsp;Start Date:</label>
                                <input type="date" name="startdate" id="datepicker" class="form-control"/>
                            </div>
                            <div class=" col-md-5">
                                    <label>&nbsp;End Date:</label>
                                <input type="date" name="enddate" id="datepicker" class="form-control"/>
                            </div>
                                <input style="display:none" id="searchQuery" name="searchQuery" type="text" class="form-control" value="${params?.searchQuery}" onchange="searchVar.searchMe();"> 
                                    <label>&nbsp;</label>     
                            <span class="input-group-btn" >
                                <a href="#" class="btn btn-primary" onclick="searchVar.searchMe();">Search</a>
                            </span>         
                        </div>
                    </div>
            </g:form>
        </div>
        <script>
            $(document).ready(function() {
                   $('#tblreprintGrid').DataTable();
               } );
               
               $(function() {
                var type = document.getElementById('type').value;              
                        if(type == 3){
                            $( "#gridFD" ).show();
                        }
                        
                        else{
                            $( "#grid" ).show();
                        }
                  });
               
               $(function() {
                  $( "#startdate" ).datepicker();
                  });

             $(function() {
               $( "#enddate" ).datepicker();
             });
        </script>
        <g:if test="${params.type == '3'}">
            <div id="gridFD">
                <table class="table table-hover table-condensed table-bordered table-striped" id="tblreprintGrid">
                <thead>        
                    <tr> 
                        <th>Txn Date</th>
                        <th>Account No</th>
                        <th>Date Open</th>
                        <th>Maturity Date</th>
                        <th>Term</th>
                        <th>Int Rate</th>
                        <th>Debit Amt</th>
                        <th>Credit Amt</th>
                        <th>Balance</th>
                        <th>PB Line</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${domainInstanceList}" var="Fd">   
                        <tr>
                            <td>${Fd.txn_date.format("MM/dd/yyyy")}</td>
                            <td>${Fd.acct_no}</td>
                            <td>${Fd.date_opened.format("MM/dd/yyyy")}</td>
                            <td>${Fd.end_date.format("MM/dd/yyyy")}</td>     
                            <td>${Fd.term.days} days</td>
                            <td><g:formatNumber format="###,###,##0.00" number="${Fd.interest_rate}"/></td>
                            <td><g:formatNumber format="###,###,##0.00" number="${Fd.debit_amt}"/></td>
                            <td><g:formatNumber format="###,###,##0.00" number="${Fd.credit_amt}"/></td>
                            <td><g:formatNumber format="###,###,##0.00" number="${Fd.bal}"/></td>
                            <td>${Fd.passbook_line}</td>
                        </tr>
                    </g:each>  
                </tbody>
            </table>
        </div>  
        </g:if>
        <g:else>
        <div id="grid">
            <table class="table table-hover table-condensed table-bordered table-striped" id="tblreprintGrid">
                <thead>        
                    <tr> 
                        <th>ID</th>
                        <th>Txn Date</th>
                        <th>Txn Type</th>
                        <g:if test="${params.type == '2'}">
                        <th>Chq No.</th> 
                        </g:if>
                        <th>DR Amt</th>
                        <th>CR Amt</th>
                        <th>Bal</th>
                        <th>Currency</th>
                        <th>Txn Seq Start</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${domainInstanceList}" status="i" var="domainInstance">   
                        <tr>
                            <td>${domainInstance?.id}</td>
                            <td>${domainInstance?.txnDate?.format("MM/dd/yyyy")}</td>
                            <td>${domainInstance?.txnType}</td>
                            <g:if test="${params.type == '2'}"> 
                                <g:if test="${domainInstance?.txnFile?.txnTemplate?.id == 12 || domainInstance?.txnFile?.txnTemplate?.id == 13 || domainInstance?.txnFile?.txnTemplate?.id == 17 || domainInstance?.txnFile?.txnTemplate?.id == 19}">
                                    <td>${domainInstance?.txnRef}</td>
                                </g:if>
                               <g:else>
                                    <td> </td>
                                </g:else>     
                            </g:if>
                            <td><g:formatNumber format="###,###,##0.00" number="${domainInstance?.debitAmt}"/></td>
                            <td><g:formatNumber format="###,###,##0.00" number="${domainInstance?.creditAmt}"/></td>
                            <td><g:formatNumber format="###,###,##0.00" number="${domainInstance?.bal}"/></td>  
                            <td>${domainInstance?.currency?.code}</td>
                            <td><g:link action="reprintPassbookShow" controller="tellering" id="${domainInstance.id}">${fieldValue(bean: domainInstance, field: "passbookLine").padLeft(3, '0')}</g:link></td>
                        </tr>
                    </g:each>  
                </tbody>
            </table>
        </div>
        </g:else>
</div>
