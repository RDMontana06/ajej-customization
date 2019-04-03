<%@ page import="icbs.loans.CreditInvestigation" %>

<legend>CRAM Report</legend>

<div class="row">
    <div class="form-horizontal">
        <div class="col-md-12">
            <div class="infowrap">
                 <table>
                     <tr>
                         <td><b>Proposal</b></td>   
                     </tr>
                     <tr>
                       <td><div class="col-sm-12"><g:textArea disabled="{disabled}" name="proposal" cols="100" rows="25" value="${creditInvestigationInstance?.termsAndCondition}"class="form-control"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="proposal">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${creditInvestigationInstance}" field="proposal">
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
                         <td><b>Terms and Condition</b></td>   
                     </tr>
                     <tr>
                       <td><div class="col-sm-12"><g:textArea disabled="{disabled}" name="termsAndCondition" cols="100" rows="25" value="${creditInvestigationInstance?.termsAndCondition}"class="form-control"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="termsAndCondition">
                                   <div class="controls">
                                    <span class="help-block">
                                    <g:eachError bean="${creditInvestigationInstance}" field="termsAndCondition">
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
    </div> 
</div>




           
               
                  
                         
                
                 
            