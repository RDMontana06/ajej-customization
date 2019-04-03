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
        <title>Deposit View More Information</title>
    </head>
    <body>
        <content tag="main-content">
            
           <h3>Account Number: ${depositInstance?.acctNo}</h3> 
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                        <g:render template='/customer/details/customerDetails' model="[customerInstance:depositInstance?.customer]"/>
                </div>

            </div>
            <div class="row">
                <div class="section-container">
                    <fieldset>
                    <legend class="section-header">Account Information</legend>
                        <div class="infowrap">
                            <div class="col-md-4">
                                <dl class="dl-horizontal">
                                    <dt>Date Open</dt>
                                    <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.dateOpened}"/></dd>
                                </dl>
                               <g:if test="${depositInstance?.type?.id==3}">                                               
                                    <dl class="dl-horizontal">
                                        <dt>Interest Start Date</dt>
                                        <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.currentRollover?.startDate}"/></dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Maturity Date</dt>
                                        <g:if test="${depositInstance?.depositInterestScheme?.fdMonthlyTransfer==true}">
                                            <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.maturityDate}"/></dd> 
                                        </g:if>
                                        <g:else>
                                            <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.currentRollover?.endDate}"/></dd>
                                        </g:else>
                                    </dl>
                                    <dl class="dl-horizontal">
                                    <dt>Term</dt>
                                       <dd> <g:formatNumber format="##,###" number="${depositInstance?.maturityDate - depositInstance?.currentRollover?.startDate}"/></dd>
                                    <!--<dd> <g:formatNumber format="#####" number="${depositInstance?.fixedDepositTermScheme?.value}"/></dd>-->
                                </dl>
                                </g:if>
                                <dl class="dl-horizontal">
                                    <dt>Interest Rate</dt>
                                    <dd>
                                        <g:formatNumber format="#,##0.00000" number="${depositInstance?.interestRate}"/>%
                                    </dd>
                                </dl>
                                
                                <dl class="dl-horizontal">
                                    <dt>Passbook No</dt>
                                    <dd>
                                         <g:formatNumber format="#####" id="NoPass" number="${depositInstance.passBookNo}"/>
                                    </dd>
                                </dl>

                               
                                <g:if test="${depositInstance?.type?.id==3}">
                                    <dl class="dl-horizontal">
                                        <dt>Rollover Type</dt>
                                        <dd>${depositInstance?.currentRollover?.type}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Mode of Interest Payment</dt>
                                        <dd>${depositInstance?.currentRollover?.interestPaymentMode?.description}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Credit Account</dt>
                                        <dd>${depositInstance?.currentRollover?.fundedDeposit?.acctNo}</dd>
                                    </dl>
                                </g:if>
                                      
                                
                            </div>
                            <div class="col-md-4">
             
                                
                               
                                <dl class="dl-horizontal">
                                    <dt>Last Transaction Date</dt>
                                    <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.lastTxnDate}"/></dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>Status Change Date</dt>
                                    <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.statusChangeDate}"/></dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>Last Capitalization Date</dt>
                                    <dd><g:formatDate format="MM/dd/yyyy" date="${depositInstance?.lastCapitalizationDate}"/></dd>
                                </dl>
                                
                            </div>
                            <div class="col-md-4">
                                <dl class="dl-horizontal">
                                    <dt>Deposit Classification</dt>
                                    <dd>${depositInstance?.depositClassification}</dd>
                                </dl>
                                 <dl class="dl-horizontal">
                                    <dt></dt>
                                    <dd></dd> 
                                </dl>
                            </div>
                        </div>
                    </fieldset>
                </div>  
            </div>

            <div class="row">
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
            
            <div class="row">
                <g:render template="/search/searchTemplate/deposit/txn/viewGrid"/>
            </div>
        </content>
        <content tag="main-actions">
            <ul>
                <!-- <li><g:link action="depositInquiry" id="${depositInstance?.id}" onclick="return confirm('Are you sure you want to return to Deposit Inquiries page?');  ">Return to Deposit Inquiry Page</g:link></li>-->
                <li><g:link action="depositInquiry" id="${depositInstance?.id}" >Return to Deposit Inquiry Page</g:link></li>
            </ul>       
        </content>
    </body>
</html>
