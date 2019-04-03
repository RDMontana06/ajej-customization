
<%@ page import="accounting.fixedasset.Bankasset" %>
<!DOCTYPE html>
<html>
    <head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'bankasset.label', default: 'Bankasset')}" />
	<title>Fixed Asset Details</title>
    </head>
    <body>
	<content tag="breadcrumbs">
            <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/fixedasset')}">Fixed Asset</a>
            <span class="fa fa-chevron-right"></span><span class="current">Details</span>
	</content>

        <content tag="main-content">
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Asset  Information</legend>
                        <div class="infowrap">
                                <div class="col-xs-12 col-sm-6">
                                    <dl  class="dl-horizontal">
                                       <dt>Purchase Date</dt>
                                        <dd><g:formatDate format="yyyy-MM-dd" date="${bankassetInstance?.purdate}" /></dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Asset Code</dt>
                                        <dd>${bankassetInstance?.assetcode}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Asset Description</dt>
                                        <dd>${bankassetInstance?.assetdesc}</dd>
                                    </dl>

                                     <dl class="dl-horizontal">
                                        <dt>Asset Purchase Order Number</dt>
                                        <dd>${bankassetInstance?.assetpo}</dd>
                                    </dl>
                                    <dl  class="dl-horizontal">
                                       <dt>Vendor Link</dt>
                                        <dd>${bankassetInstance?.vendorlink}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Asset Serial</dt>
                                        <dd>${bankassetInstance?.assetserial}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Main GL Account</dt>
                                        <dd>${bankassetInstance?.glacc}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Accumulated Depreciation</dt>
                                        <dd>${bankassetInstance?.creditglacc}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Depreciation Expense</dt>
                                        <dd>${bankassetInstance?.debitglacc}</dd>
                                    </dl>
                                    <dl  class="dl-horizontal">
                                       <dt>Purchase Cost</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.purcost}"/></dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Depreciation Value</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.deprevalue}"/></dd>
                                     </dl>
                                     <dl  class="dl-horizontal">
                                       <dt>Useful Life (Years)</dt>
                                        <dd>${bankassetInstance?.lifeinyears}</dd>
                                    </dl>
                                     <dl  class="dl-horizontal">
                                       <dt>Number of Amortizations</dt>
                                        <dd>${bankassetInstance?.noofinstallment}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Current Balance (Acquisition Cost)</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.faBalance}"/></dd>
                                     </dl>
                                    <dl  class="dl-horizontal">
                                       <dt>Monthly Depreciation Expense</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.monthlyexpense}"/></dd>
                                    </dl>
                                    <dl  class="dl-horizontal">
                                       <dt>Salvage value</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.salvagevalue}"/></dd>
                                    </dl>
                                     <dl  class="dl-horizontal">
                                       <dt>Accumulated Depreciation</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.accDepreciation}"/></dd>
                                    </dl>
                                     <dl  class="dl-horizontal">
                                       <dt>Net Book Value</dt>
                                        <dd><g:formatNumber format="###,###,##0.00" number="${bankassetInstance?.deprevalue - bankassetInstance?.accDepreciation}"/></dd>
                                    </dl>
                                    <dl  class="dl-horizontal">
                                       <dt>Fixed Asset Expiry Date</dt>
                                        <dd><g:formatDate format="yyyy-MM-dd" date="${bankassetInstance?.assetexpire}" /></dd>
                                    </dl>
                                </div>
                        </div>
                    </fieldset>
                  </div><!-- end section-container-->
                </div><!-- end of column -->
               </div> <!-- end of row-->
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="create" action="create"><g:message code="default.newupdate.label" args="[entityName]" default="New Asset" /></g:link></li>
                    <li><g:link action="edit" id="${bankassetInstance.id}">Edit Fixed Asset Details</g:link></li>
                    <li><g:link action="assetTransaction" id="${bankassetInstance.id}">Create Asset Transaction</g:link></li>
                    <li><g:link action="viewTransactions" id="${bankassetInstance.id}">View Transactions</g:link></li>

                    <script>


                    </script>
                </ul>
            </content>
	</body>
</html>
