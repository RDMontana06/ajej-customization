<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <title>View Teller Cash and Check Blotter Transactions</title>
    </head>
    <body>
        <content tag="main-content">
            <div id="grid">
                <div class="table-responsive">
                    <table class="table table-hover table-condensed table-bordered table-striped">
                        <tbody>
                            <tr>    
                                <td><label>Transaction ID</label></td>                    
                                <td><label>Particulars</label></td>          
                                <td><label>Cash In Amount</label></td>
                                <td><label>Cash Out Amount</label></td>
                                <td><label>Check In Amount</label></td>
                                <td><label>Check Out Amount</label></td>
                            </tr>
                        </tbody>   
                        <tbody>
                            <g:set var="w" value="${0}" />
                            <g:set var="x" value="${0}" />
                            <g:set var="y" value="${0}" />
                            <g:set var="z" value="${0}" />
                            <g:each in="${tbCash}" status="i" var="tbc">
                                <tr>
                                    <g:if test="${tbc?.txnFile.txnDate == tbc?.branch?.runDate}">
                                        <td>${tbc?.txnFile.id}</td>
                                        <td>${tbc?.txnParticulars}</td>
                                        <g:if test="${tbc.cashInAmt != 0}">
                                        <td align="right"><g:formatNumber number="${tbc.cashInAmt}" format="###,###,##0.00" /></td>
                                        </g:if>
                                        <g:else>
                                        <td></td>    
                                        </g:else>  
                                        <g:if test="${tbc.cashOutAmt != 0}">
                                        <td align="right"><g:formatNumber number="${tbc.cashOutAmt}" format="###,###,##0.00" /></td>
                                        </g:if>
                                        <g:else>
                                        <td></td>    
                                        </g:else>    
                                        <g:if test="${tbc.checkInAmt != 0}">
                                        <td align="right"><g:formatNumber number="${tbc.checkInAmt}" format="###,###,##0.00" /></td>
                                        </g:if>
                                        <g:else>
                                        <td></td>    
                                        </g:else>                                          
                                        <g:if test="${tbc.checkOutAmt != 0}">
                                        <td align="right"><g:formatNumber number="${tbc.checkOutAmt}" format="###,###,##0.00" /></td>
                                        </g:if>
                                        <g:else>
                                        <td></td>    
                                        </g:else> 
                                        <g:set var="w" value="${w + tbc?.cashInAmt}" /> 
                                        <g:set var="x" value="${x + tbc?.cashOutAmt}" />
                                        <g:set var="y" value="${y + tbc?.checkInAmt}" />
                                        <g:set var="z" value="${z + tbc?.checkOutAmt}" />    
                                    </g:if>        
                                </tr>
                            </g:each>
                                
                        </tbody>
                    </table>
                    <p><h1>Summary</h1></p>
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Total Cash In</label>
                        <span><g:formatNumber number="${w}" format="###,###,##0.00" /></span>
                    </div>    
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Total Cash Out</label>
                        <span><g:formatNumber number="${x}" format="###,###,##0.00" /></span>
                    </div> 
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Total Check In</label>
                        <span><g:formatNumber number="${y}" format="###,###,##0.00" /></span>
                    </div> 
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Total Check Out</label>
                        <span><g:formatNumber number="${z}" format="###,###,##0.00" /></span>
                    </div> 
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Ending Cash</label>
                        <span><g:formatNumber number="${w-x}" format="###,###,##0.00" /></span>
                    </div> 
                    <div class="fieldcontain form-group">
                        <label class="control-label col-sm-4">Ending Checks</label>
                        <span><g:formatNumber number="${y-z}" format="###,###,##0.00" /></span>
                    </div>                     
              </div>
            </div>    
        </content>    
        <content tag="main-actions">
            <ul>
                <li><g:link action="Index">Tellering Index</g:link></li>
                <li><g:link action="viewTellerBalancing">Teller Balancing</g:link></li>
            </ul>
        </content>        
    </body>    
</html>
