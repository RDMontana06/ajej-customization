<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<div  name="inlineSearchDiv"id="inlineSearchDiv">

<div class="section-container">
    <fieldset><legend class="section-header">Transactions</legend>
    <g:form id="searchForm" name="searchForm">
        <!--Custom Action  -->
        <g:hiddenField id="id" name="id" value="${params?.id ?:depositInstance?.id}"/>
        <g:hiddenField id="searchDomain" name="searchDomain" value="deposit-txn"/>
        <g:hiddenField id="actionTemplate" name="actionTemplate" value="${params.actionTemplate}"/>
    </g:form>
    <div id="grid">
        <div class="box-body table-responsive no-padding">
                    <table class="table table-hover table-condensed table-bordered table-striped">
                        <tr> 
                            <td><label>Txn ID</label></td>
                            <td><label>Txn No.</label></td>
                            <td><label>Txn Date</label></td>
                            <td><label>Txn Type</label></td>
                            <td><label>Debit Amount</label></td>
                            <td><label>Credit Account</label></td>
                            <td><label>Balance</label></td>
                        </tr>
                        <g:each in="${domainInstanceList}" status="i" var="domainInstance">   
                                <tr>
                                    <td>${domainInstance?.id}</td>
                                    <td>${domainInstance?.txnFile?.id}</td>
                                    <td>${domainInstance?.txnDate?.format("MM-dd-yyyy")}</td>
                                     <td>${domainInstance?.txnType}</td>
                                     <td>${domainInstance?.user?.name1}</td>
                                     <td>${domainInstance?.debitAmt}</td>
                                     <td>${domainInstance?.creditAmt}</td>
                                     <td>${domainInstance?.bal}</td>
                                   <td>${domainInstance?.currency?.name}</td> 
                                </tr>
                       </g:each>     
                    </table>
                    <div class="pagination">
                        <g:paginate total="${domainInstanceCount ?: 0}"/>   
                    </div>
            </div>
    </div>
</div>
</div>