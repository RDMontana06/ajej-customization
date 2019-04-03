<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

    <div class="section-container">
        <fieldset>
        <legend class="section-header">Account Information</legend>
        <div class="infowrap">
             <dl class="dl-horizontal">
                <dt>Account Number</dt>
                <dd>${depositInstance?.acctNo}</dd>
            </dl>
            <dl class="dl-horizontal">
                <dt>Account Name</dt>
                <dd>${depositInstance?.acctName}</dd>
            </dl>
            <dl class="dl-horizontal">
                <dt> Date Opened</dt>
                <dd>${depositInstance?.currentRollover?.startDate.format('MM/dd/yyyy')}</dd>
            </dl>
            <dl class="dl-horizontal">
                <dt>Maturity Date</dt>
                <dd>${depositInstance?.currentRollover?.endDate.format('MM/dd/yyyy')}</dd>
            </dl>
            <dl class="dl-horizontal">
                <dt> Interest Rate</dt>
                    <dd><g:formatNumber format="#,##0.00000" number="${depositInstance?.interestRate}"/>%</dd>
            </dl>
            <dl class="dl-horizontal">
                <dt>Status</dt>
                <dd>${depositInstance?.status?.description}</dd>
            </dl>
        </div>
        </fieldset>
    </div>