%@ page import="icbs.loans.CreditInvestigation" %>


<legend>Checklist</legend>
<div >
    <table border=0 class="table table-hover table-condensed table-bordered table-striped">
    <tr>
        <td colspan=2>
                    <label><h4>AML/CFT COMPLIANCE SHEET</h4></label>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>1. Initial Due Diligence</td>
    </tr>
    <tr>
        <td>
            <div>
                <g:checkBox id="formA1" name="formA1" value="${creditInvestigationInstance?.formA1}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA1">
                <div>
                    <span>
                        <g:eachError bean="${creditInvestigationInstance}" field="formA1">
                            <g:message error="${it}" /><br/>
                        </g:eachError>       
                    </span>
                </div>	
                </g:hasErrors>
            </div>
        </td>
        <td>
                Does the applicant fall under any of the following? <br>
                Fictitious persons, persons whose identity and beneficial owner cannot be assured or for 
                whom sufficient information cannot be gathered, persons that are likely to pose a higher risk of 
                money laundering or terrorist financing such as but not limited to PEPs of foreign origin, citizens 
                of high risk and non-cooperative countries and territories, individuals belonging to or 
                associated with the Taliban and other Clients of Special Category as listed in Ajejdrikdrik AML/CFT 
                Policies and Procedure Manual.
        </td>
    </tr>		
    
    <tr>
        <td></td>
        <td>
            2. Customer Identification (If customer is not a natural person, proceed to if below)
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA2" name="formA2" value="${creditInvestigationInstance?.formA2}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA2">
                <div>
                    <span>
                        <g:eachError bean="${creditInvestigationInstance}" field="formA2">
                            <g:message error="${it}" /><br/>
                        </g:eachError>       
                    </span>
                </div>	
                </g:hasErrors>
            </div>
        </td> 
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a. Is the applicant a resident?  
        </td>
    </tr>
    
    <tr>
        <td></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a.1 If Yes, did the applicant submit the following which are valid and verifiable?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA3" name="formA3" value="${creditInvestigationInstance?.formA3}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA3">
                    <div>
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA3">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
            </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i. RMI Identification Card 
        </td>
     </tr>
     
     <tr>
        <td>
            <div>
                <g:checkBox id="formA4" name="formA4" value="${creditInvestigationInstance?.formA4}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA4">
                    <div>
                        <span>
                            <g:eachError bean="${creditInvestigationInstance}" field="formA4">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ii. Driver's License 
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA5" name="formA5" value="${creditInvestigationInstance?.formA5}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA5">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA5">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
                </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iii. SS ID  
        </td>
    </tr>
    
    <tr>
        <td></td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a.2 If no, did the applicant submit the following which are valid and verifiable? 
        </td>
    </tr>    
   
    <tr>
        <td>
            <div>
                <g:checkBox id="formA6" name="formA6" value="${creditInvestigationInstance?.formA6}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA6">
                    <div>
                        <span>
                            <g:eachError bean="${creditInvestigationInstance}" field="formA6">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i. Copy of the first two pages of the applicant's passport 
        </td>
     </tr>
     
    <tr>
        <td>
            <div>
                <g:checkBox id="formA7" name="formA7" value="${creditInvestigationInstance?.formA7}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA7">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA7">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ii. Driver's License / SS ID
        </td>
     </tr>
     
    <tr>
        <td>
            <div>
                <g:checkBox id="formA8" name="formA8" value="${creditInvestigationInstance?.formA8}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA8">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA8">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iii. Working Permit & Alien Registration Certificate
        </td>
     </tr>
     
    <tr>
        <td>
            <div>
                <g:checkBox id="formA9" name="formA9" value="${creditInvestigationInstance?.formA9}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA9">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA9">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iv. Copy of the applicant's contract assuring employment for at least 2 years
        </td>
     </tr>
     
    <tr>
        <td>
            <div>
                <g:checkBox id="formA10" name="formA10" value="${creditInvestigationInstance?.formA10}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA10">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA10">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a.3 If a previous customer, are there doubts as to the veracity or adequacy of previously 
            obtained identification data on the person?
        </td>
     </tr>
     
    <tr>
        <td>
            <div>
                <g:checkBox id="formA11" name="formA11" value="${creditInvestigationInstance?.formA11}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA11">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA11">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a.4 f a previous customer, are the customer identification requirement as 
            enumerated in a.1 or a.2 above used to update customer information?
        </td>
     </tr>
     
    <!--edit here -->
    <tr>
        <td></td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            b. Has the application form properly filled out to show the following personal information?
        </td>
    </tr> 
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA12" name="formA12" value="${creditInvestigationInstance?.formA12}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA12">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA12">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a. Full name
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA13" name="formA13" value="${creditInvestigationInstance?.formA13}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA13">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA13">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            b. Date of birth
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA14" name="formA14" value="${creditInvestigationInstance?.formA14}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA14">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA14">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            c. National ID/Passport number
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA15" name="formA15" value="${creditInvestigationInstance?.formA15}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA15">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA15">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            d. Country
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA16" name="formA16" value="${creditInvestigationInstance?.formA16}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA16">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA16">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            e. Permanent address
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA17" name="formA17" value="${creditInvestigationInstance?.formA17}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA17">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA17">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            f. Contact number
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA18" name="formA18" value="${creditInvestigationInstance?.formA18}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA18">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA18">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            c. Are the information given in a.1 and a.2 above the same as the information in the application form?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA19" name="formA19" value="${creditInvestigationInstance?.formA19}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA19">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA19">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            d. Does the customer have name/s other than what is shown in the Passport/IDs presented?
        </td>
    </tr>
    
    <tr>
        <td>
            
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            If yes, what other name/s is the applicant known for? State below.
        </td>
    </tr>
    <tr> 
        <td></td>
        <td>
            <div>
                <g:textField id="formA20" name="formA20" value="${creditInvestigationInstance?.formA20}" maxlength="250" class="form-control"/>
                <!--<g:checkBox id="formA20" name="formA20" value="${creditInvestigationInstance?.formA7}"/> -->
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA20">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA20">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div>
                <g:checkBox id="formA21" name="formA21" value="${creditInvestigationInstance?.formA21}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA21">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA21">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            e. Is the customer represented by another person?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA22" name="formA22" value="${creditInvestigationInstance?.formA22}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA22">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA22">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            If yes, has a valid power of attorney been submitted?
        </td>
    </tr>
    
    <tr>
        <td>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            f. Please check the type of organization the applicant belongs to:
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA23" name="formA23" value="${creditInvestigationInstance?.formA23}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA23">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA23">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             Corporation
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA24" name="formA24" value="${creditInvestigationInstance?.formA24}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA24">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA24">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Partnership
        </td>
    </tr>
    
    <tr>
        <td>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            If a corporation, have the following been submitted?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA25" name="formA25" value="${creditInvestigationInstance?.formA25}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA25">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA25">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i. Articles of Incorporation
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA26" name="formA26" value="${creditInvestigationInstance?.formA26}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA26">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA26">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ii. Members of the Board of Directors and their addresses
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA27" name="formA27" value="${creditInvestigationInstance?.formA27}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA27">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA27">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iii. Board Resolution/Secretary's Certificate authorizing the loan and identifying the person 
            authorizing to represent the corporation
        </td>
    </tr>
    
    <tr>
        <td>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            If a partnership, have the following been submitted?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA28" name="formA28" value="${creditInvestigationInstance?.formA28}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA28">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA28">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i. Certificate of Partnership
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA29" name="formA29" value="${creditInvestigationInstance?.formA29}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA29">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA29">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ii. Names of partners with their corresponding ownership interest in percent
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA30" name="formA30" value="${creditInvestigationInstance?.formA30}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA30">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA30">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iii. Name/s of managing partner/s
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA31" name="formA31" value="${creditInvestigationInstance?.formA31}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA31">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA31">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            iv. Partners' agreement showing authorization of the loan and the person 
            authorized to act for and on behalf of the partnership
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA32" name="formA32" value="${creditInvestigationInstance?.formA32}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA32">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA32">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            g. Is the applicant the beneficial owner of the proceeds of the loan being applied for?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA33" name="formA33" value="${creditInvestigationInstance?.formA33}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA33">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA33">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            h. Is the beneficial owner residing in a high risk jurisdiction?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA34" name="formA34" value="${creditInvestigationInstance?.formA34}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA34">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA34">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i. Was there an instance when the applicant had been suspected of money laundering and/or financing of terrorism?
        </td>
    </tr>
    
    <tr>
        <td>
        </td>
        <td> 
            3. AML/CFT Risk Assessment
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA35" name="formA35" value="${creditInvestigationInstance?.formA35}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA35">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA35">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            a. Is the applicant involved in a complex business structure with no legitimate commercial rationlae?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA36" name="formA36" value="${creditInvestigationInstance?.formA36}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA36">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA36">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            b. Is the customer in the position which may expose them to the possibility of corruption?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA37" name="formA37" value="${creditInvestigationInstance?.formA37}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA37">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA37">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            c. Is the source of loan payment difficult to verify?
        </td>
    </tr>
    
    <tr>
        <td>
            <div>
                <g:checkBox id="formA38" name="formA38" value="${creditInvestigationInstance?.formA38}"/>
                <g:hasErrors bean="${creditInvestigationInstance}" field="formA38">
                    <div >
                        <span >
                            <g:eachError bean="${creditInvestigationInstance}" field="formA38">
                                <g:message error="${it}" /><br/>
                            </g:eachError>       
                        </span>
                    </div>	
                </g:hasErrors>
            </div>
        </td>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            d. Is the total amount of loan (Interest plus Principal) more than $10,000?
        </td>
    </tr>
    
 
    </table>
    
    <table class="table table-hover table-condensed table-bordered table-striped">
            <tr>
                    <td colspan=3>
                            <label><h4>ON COLLATERAL</h4></label>
                    </td>
            </tr>
            <tr>
                    <td></td>
                    <td colspan=2>
                            <label><h5>A. REAL ESTATE</h5></label>
                    </td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB1" name="formB1" value="${creditInvestigationInstance?.formB1}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB1">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB1">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>1. Photocopy of title offered collateral/s</td>
            </tr>		
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB2" name="formB2" value="${creditInvestigationInstance?.formB2}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB2">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB2">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>2. Current tax declaration (of land and improvement/s(if applicable)</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB3" name="formB3" value="${creditInvestigationInstance?.formB3}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB3">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB3">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>3. Latest tax clearance/s</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB4" name="formB4" value="${creditInvestigationInstance?.formB4}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB4">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB4">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>4. Latest tax receipt/s</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB5" name="formB5" value="${creditInvestigationInstance?.formB5}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB5">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB5">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>5. Approved Subdivision/Lot Plan</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB6" name="formB6" value="${creditInvestigationInstance?.formB6}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB6">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB6">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>6. Affidavit of Non-tenancy</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB7" name="formB7" value="${creditInvestigationInstance?.formB7}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB7">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB7">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>7. Special Power of Attorney notarized by nearest Philippine Consulate</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB8" name="formB8" value="${creditInvestigationInstance?.formB8}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB8">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB8">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>8. Deed of sale</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB9" name="formB9" value="${creditInvestigationInstance?.formB9}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB9">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB9">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>9. Approval of mortgage</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB10" name="formB10" value="${creditInvestigationInstance?.formB10}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB10">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB10">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>10. Permit to Mortgage</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB11" name="formB11" value="${creditInvestigationInstance?.formB11}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB11">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB11">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>11. Certificate of Full payment from DAR/Landbank</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB12" name="formB12" value="${creditInvestigationInstance?.formB12}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB12">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB12">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>12. Extra-judicial settlement</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB13" name="formB13" value="${creditInvestigationInstance?.formB13}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB13">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB13">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>13. Conformity of occupants/owner of improvements</td>
            </tr>	
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB14" name="formB14" value="${creditInvestigationInstance?.formB14}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB14">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB14">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td>14. Master Deed in case if condominium unit/s</td>
            </tr>
            
            <tr>
                    <td></td>
                    <td colspan=2>
                            <label><h4>B. CHATTEL/MOVABLE PROPERTIES</h4></label>
                    </td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB15" name="formB15" value="${creditInvestigationInstance?.formB15}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB15">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB15">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td> 1. Copy of latest OR and Certificate of Registration</td>
            </tr>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB16" name="formB16" value="${creditInvestigationInstance?.formB16}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB16">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB16">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td> 2. LTO Verification</td>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB17" name="formB17" value="${creditInvestigationInstance?.formB17}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB17">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB17">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td> 3. Comprehensive and TPL Insurance</td>
            <tr>
                    <td>
                    </td>
                    <td >
                            <div>
                                    <g:checkBox id="formB18" name="formB18" value="${creditInvestigationInstance?.formB18}"/>
                                    <g:hasErrors bean="${creditInvestigationInstance}" field="formB18">
                                            <div >
                                                    <span >
                                                            <g:eachError bean="${creditInvestigationInstance}" field="formB18">
                                                                    <g:message error="${it}" /><br/>
                                                            </g:eachError>       
                                                    </span>
                                            </div>	
                                    </g:hasErrors>
                            </div>
                    </td>
                    <td> 4. Stencils</td>
                    
    </table>	
</div>