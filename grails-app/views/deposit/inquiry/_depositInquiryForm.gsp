<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<div class="row">
      <div class="col-md-12">
        <h3>Account Number: ${depositInstance?.acctNo}</h3>
      </div>
</div>

<div class="row">
    <div class="col-md-8">
        <g:render template='/customer/details/customerDetails' model="[customerInstance:depositInstance?.customer]"/>
    </div>
    <div class="col-md-4">
      
         <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Balance Information</legend>
                        <div class="infowrap">
                            <div class="col-md-6">
                                <dl class="dl-horizontal">
                                    <dt>Current Balance</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.ledgerBalAmt}"/></dd>
                                    <dd></dd>
                                </dl>
                                 <dl class="dl-horizontal">
                                    <dt>Available Balance</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.availableBalAmt}"/></dd>
                                </dl>
                                 <dl class="dl-horizontal">
                                    <g:if test="${ depositInstance?.type?.id == 1}">
                                    <dt>Passbook Balance</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.passbookBalAmt}"/></dd>
                                    </g:if>
                                </dl>
                                 <dl class="dl-horizontal">
                                    <dt>Hold Balance</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.holdBalAmt}"/></dd>
                                </dl>    
                                <dl class="dl-horizontal">
                                    <dt>Accrued Interest</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.acrintAmt}"/></dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>Last EOM ADB</dt>
                                    <dd><g:formatNumber format="###,###,##0.00" number="${depositInstance?.lmAveBalAmt}"/></dd>
                                </dl>
                            </div>  
                        </div>
                    </fieldset>
                </div>
       </div>
</div>


<div class="row">
    <div class="section-container">
        <fieldset>
        <legend class="section-header"> Account Information </legend>
            <div class="col-md-12">
                <div class="infowrap">
                    
                    <dl class="dl-horizontal">
                        <dt>Account Status</dt>
                        <dd>${depositInstance?.status?.description}</dd>
                    </dl>
           
                    <dl class="dl-horizontal">
                        <dt>Branch</dt>
                        <dd>${depositInstance?.branch.name}</dd>
                    </dl>
                    
                 <dl class="dl-horizontal">
                        <dt>Account Name</dt>
                        <dd>${depositInstance?.acctName}</dd>
                    </dl>
                    
                    <dl class="dl-horizontal">
                        <dt>Deposit Product</dt>
                        <dd>${depositInstance?.product.name}</dd>
                    </dl>
                    
                    <dl class="dl-horizontal">
                                    <dt>Interest Rate</dt>
                                    <dd> <g:formatNumber format="#,##0.00000" number="${depositInstance?.interestRate}"/>%</dd>
                    </dl>
                    

          
                    <dl class="dl-horizontal">
                        <dt>General Ledger Code</dt>
                        <dd>${depositInstance?.glLink?.description}</dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Currency</dt>
                        <dd>${depositInstance?.product?.currency?.name}</dd>
                    </dl>
                </div>
            </div>
        </fieldset>
    </div>
</div>


<div class="row">
      <div class="section-container">
            <fieldset>
                <legend class="section-header">Other Owners/Signatories</legend>
                <div class="infowrap">
                    <dl class="dl-horizontal">
                        <dt>Ownership Type</dt>
                        <dd>${depositInstance?.ownershipType?.description}</dd>
                    </dl>
                    <div class="table-responsive col-md-12">
                        <g:if test="${depositInstance?.signatories?.size()>0}">
                            <table id="signatoryTable" class="table table-hover table-condensed table-striped">
                                <tr>
                                    <td><label>CID</label></td>
                                    <td><label>Name</label></td>
                                    <td><label>Signatory</label></td>
                                </tr>
                                <tbody height="100px">
                                    <div id="signatoryList">
                                        <g:each var="signatory" in="${depositInstance?.signatories}" status="i">
                                            <g:if test="${signatory.status.id!=3}">
                                                <g:render template='form/signatory/onetomany/signatory' model="[signatory:signatory,i:i,displayOnly:'true']"/>
                                            </g:if>
                                        </g:each>
                                </tbody>
                            </table>
                        </g:if>
                    </div>
                    <dl class="dl-horizontal">
                        <dt>Signatory Rules</dt>
                        <dd>${depositInstance?.depositSignatoryRules}</dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Signatory Remarks</dt>
                        <dd>${depositInstance?.sigRemarks}</dd>
                    </dl>
                </div>
            </fieldset>
        </div>
    </div>


