<%@ page import="icbs.loans.CreditInvestigation" %>

<legend>DepEd Evaluation</legend>

   <div class="row">
       <div class="form-horizontal">
        <div class="col-md-6">
             <div class="infowrap">
                  <table>
                          <tr>
                              <td><b>Net Take Home Pay</b></td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="homePay"   value="${loanApplicationInstance?.homePay}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="homePay">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="homePay">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                          </tr>
                          <tr>
                              <td><br></td>
                              <td>    </td>
                          </tr>
                           <tr>
                               <td><b>Redemption</b></td>
                               <td>   </td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field placeholder="Description  " name="redemption1" value="${loanApplicationInstance?.redemption1}"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="redemption01" value="${loanApplicationInstance?.redemption01}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption01">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption01">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr> 
                            <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                          </tr>
                             <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="redemption2" value="${loanApplicationInstance?.redemption2}"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption2">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption2">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="redemption02" value="${loanApplicationInstance?.redemption02}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption02">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption02">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                                </td>
                                </tr>
                                <tr>
                                <td>&nbsp</td>
                                <td>    </td>
                                </tr>
                                <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="redemption3" value="${loanApplicationInstance?.redemption3}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption3">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption3">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="redemption03" value="${loanApplicationInstance?.redemption03}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="redemption03">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="redemption03">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                               </tr>
                                <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                                </tr>  
                          <tr>
                               <td><b>Termination</b></td>
                               <td>   </td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field placeholder="Description " name="termination1" value="${loanApplicationInstance?.termination1}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="termination01" value="${loanApplicationInstance?.termination01}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination01">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination01">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr> 
                            <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                          </tr>
                             <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="termination2" value="${loanApplicationInstance?.termination2}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination2">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination2">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="termination02" value="${loanApplicationInstance?.termination02}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination02">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination02">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                               </tr>
                                <tr>
                                <td>&nbsp</td>
                                <td>    </td>
                                </tr>
                                <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="termination3" value="${loanApplicationInstance?.termination3}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination3">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination3">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="termination03" value="${loanApplicationInstance?.termination03}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="termination03">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="termination03">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                               </tr>
                               <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                          </tr>  
                          <tr>
                               <td><b>Undeducted</b></td>
                               <td>   </td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field placeholder="Description " name="undeducted1" value="${loanApplicationInstance?.undeducted1}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="undeducted01" value="${loanApplicationInstance?.undeducted01}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted01">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted01">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr> 
                            <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                            </tr>
                            <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="undeducted2" value="${loanApplicationInstance?.undeducted2}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted2">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted2">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="undeducted02" value="${loanApplicationInstance?.undeducted02}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted02">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted02">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                                </td>
                                </tr>
                                <tr>
                                <td>&nbsp</td>
                                <td>    </td>
                                </tr>
                                <tr>
                                <td><div class="col-sm-8"><g:field placeholder="Description " name="undeducted3" value="${loanApplicationInstance?.undeducted3}" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted3">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted3">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="undeducted03" value="${loanApplicationInstance?.undeducted03}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="undeducted03">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="undeducted03">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                               </tr>
                                <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                          </tr>  
                          <tr>
                               <td><b>Required Net Pay</b></td>
                               <td><b>Net Available</b></td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="requiredNetPay" value="${loanApplicationInstance?.requiredNetPay}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="requiredNetPay">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="requiredNetPay">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="netAvail" value="${loanApplicationInstance?.netAvail}" class="form-control truncated" onkeyup="updateVar()" readonly="true"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="netAvail">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="netAvail">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr>
                            <tr>
                              <td>&nbsp</td>
                              <td>    </td>
                          </tr>  
                          <tr>
                               <td><b>A1. Available Deduction</b></td>
                               <td><b>B.1 Desired Term</b></td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="a1" value="${loanApplicationInstance?.a1}" class="form-control truncated" onkeyup="updateVar()"  readonly="true" /> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="a1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="a1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Number of TERM " name="b1" value="${loanApplicationInstance?.b1}" class="form-control truncated" onkeyup="updateVar()"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="b1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="b1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr>
                            <tr>
                               <td><b>C.1 Factor Rate</b></td>
                               <td><b>Maximum Loan Amount</b></td>
                          </tr>
                          <tr>
                               <td><div class="col-sm-8"><g:field type="number" placeholder="RATE " name="c1" value="${loanApplicationInstance?.c1}"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="c1">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="c1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div> 
                               </td>
                               <td><div class="col-sm-8"><g:field placeholder="Php. " name="maxAmt" value="${loanApplicationInstance?.maxAmt}" class="form-control truncated" onkeyup="updateVar()" readonly="true"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="maxAmt">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="b1">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
                                    </div>        
                               </td>
                            </tr>
                        
                 
                 </table>
             </div>   
        </div>
        
        
        <div class="col-md-5">
            <div class="infowrap">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD1', 'has-error')} ">
                        <g:checkBox id="formD1" name="formD1" value="${loanApplicationInstance?.formD1}"/><b> 1. New</b>
                        </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD2', 'has-error')} ">
                        <g:checkBox id="formD2" name="formD2" value="${loanApplicationInstance?.formD2}"/><b> 2. Separate</b>
                        </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD3', 'has-error')} ">
                        <g:checkBox id="formD3" name="formD3" value="${loanApplicationInstance?.formD3}"/><b> 3. Renewal</b>
                        </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD4', 'has-error')} ">
                        <g:checkBox id="formD4" name="formD4" value="${loanApplicationInstance?.formD4}"/><b> 4. Pay Slip For The Month  Of</b>
                        <div class="col-sm-6"><g:field placeholder="ex. August 20** " name="fTM" value="${loanApplicationInstance?.fTM}" class="form-control"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="fTM">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="fTM">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
           
                        </div>
                          </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD5', 'has-error')} ">
                        <g:checkBox id="formD5" name="formD5" value="${loanApplicationInstance?.formD5}"/><b> 5. Photocopy of Valid ID of the Principal Borrower & its Co-maker/s</b>
                        </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD6', 'has-error')} ">
                        <g:checkBox id="formD6" name="formD6" value="${loanApplicationInstance?.formD6}"/><b> 6. Authority to Deduct, Disclosure Statement & Promissory Note</b>
                        </div>
                        </td>             
                    </tr>
                    <tr>
                        <td><div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'formD7', 'has-error')} ">
                        <g:checkBox id="formD7" name="formD7" value="${loanApplicationInstance?.formD7}"/><b> 7. Others (Pls. Specify)</b>
                         <div class="col-sm-8"><g:field name="othersSpecify" value="${loanApplicationInstance?.othersSpecify}" class="form-control"/> 
                                   <g:hasErrors bean="${loanApplicationInstance}" field="othersSpecify">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${loanApplicationInstance}" field="othersSpecify">
                                    <g:message error="${it}" /><br/>
                                    </g:eachError>
                                    </span>
                                    </div>
                                    </g:hasErrors>
           
                        </div>                                                     
                            </div>
                        </td>             
                    </tr>
                    <tr>
                        <td> 
                        <div class="form-group fieldcontain ${hasErrors(bean: loanApplicationInstance, field: 'loanDepedBillingType', 'has-error')} ">
                        <label class="control-label col-sm-4" for="loanDepedBillingType">
                            </div>
                        <g:message code="customer.loanDepedBillingType.label" default="" /> <b>Loan DepEd Billing Type</b>
                        </label>
                        <div class="col-sm-8"><g:select id="loanDepedBillingType" name="loanDepedBillingType.id" from="${icbs.lov.LoanDepedBillingType.findAllByStatus(true)}" optionKey="id" optionValue ="description" value="${loanApplicationInstance?.loanDepedBillingType?.id}" class="form-control"/>
                        <g:hasErrors bean="${loanApplicationInstance}" field="loanDepedBillingType">
                        <div class="controls">
                        <span class="help-block">
                        <g:eachError bean="${loanApplicationInstance}" field="loanDepedBillingType">
                        <g:message error="${it}" /><br/>
                        </g:eachError>
                        </span>
                    </div>
                 </g:hasErrors>      
            </div>
       </div>
                                        
                        </td>
                    </tr>    
                    

                </table>
            </div>
        </div>
        
        
       </div>
    </div>