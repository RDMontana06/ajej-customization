<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <title>Customer View Information</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
    </head>
    <body>
        <content tag="main-content">
            
            
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Primary  Information</legend>
                        <div class="infowrap">
                             <div class="col-xs-3 col-sm-3">
                                <div style="margin:auto; padding:20px;"><g:if test="${(customerInstance?.attachments?.find{it.isPrimaryPhoto==true})?.id}"> <img width="160px" height="160px"src="${createLink(controller:'Attachment', action:'show', id: (customerInstance?.attachments?.find{it.isPrimaryPhoto==true})?.id )}"/></g:if></div>
                             </div>
                            
                            
                            <div class="col-xs-12 col-sm-8">
                            
                                <g:if test="${customerInstance?.type.id==1}">
                                    
                                    <h3 style="font-weight:bold;">${customerInstance?.name3}, ${customerInstance?.name1} ${customerInstance?.name2}</h3>
                                    <p><i>(Last Name, First Name, Middle Name)</i></p>
                                    
                                    
                                    <dl class="dl-horizontal">
                                        <dt>Display Name</dt>
                                        <dd>${customerInstance?.displayName}</dd>
                                    </dl>
                                    
                                    
                                    <dl class="dl-horizontal">
                                        <dt>Title</dt>
                                        <dd>${customerInstance?.title?.itemValue}</dd>
                                    </dl>
                                    
                                                                      
                                     <dl class="dl-horizontal">
                                        <dt>Initials</dt>
                                        <dd>${customerInstance?.name4}</dd>
                                    </dl>
                                    
                                    <dl class="dl-horizontal">
                                        <dt>Gender</dt>
                                        <dd>${customerInstance?.gender?.description}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Date of Birth</dt>
                                        <dd>${customerInstance?.birthDate?.format("MM/dd/yyyy")}</dd>
                                    </dl>
                                </g:if>
                                <g:else>
                                    <dl class="dl-horizontal">
                                        <dt>Company Name</dt>
                                        <dd>${customerInstance?.name1}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Registration Date</dt>
                                        <dd>${customerInstance?.birthDate?.format("MM/dd/yyyy")}</dd>
                                    </dl>
                                </g:else>
                                    
                                      <dl class="dl-horizontal">
                                        <dt>Customer ID</dt>
                                        <dd>${customerInstance?.customerId}</dd>
                                     </dl>
                                      
                                     <dl  class="dl-horizontal">
                                       <dt>Customer Type</dt>
                                        <dd>${customerInstance?.type?.description}</dd>
                                    </dl>
                                
                              <g:if test="${customerInstance?.type?.id==1}">
                                    <dl class="dl-horizontal">
                                        <dt>Civil Status</dt>
                                        <dd>${customerInstance?.civilStatus?.itemValue}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Birth Place</dt>
                                        <dd>${customerInstance?.birthPlace}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Nationality</dt>
                                        <dd>${customerInstance?.nationality?.itemValue}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>SSS No.</dt>
                                        <dd>${customerInstance?.sssNo}</dd>
                                    </dl>
                                    <dl class="dl-horizontal">
                                        <dt>Credit Limit</dt>
                                        <dd><g:formatNumber format="#,##0.00" number="${customerInstance?.creditLimit}"/></dd>
                                    </dl>
                                       
       
                            </g:if>   
                                    
                         
                        </div>    
                    </fieldset>
                  </div><!-- end section-container-->
                </div><!-- end of column -->
               </div> <!-- end of row-->
                
             <div class="row">
                     <div class="col-xs-12 col-sm-12">
              <div class="section-container">
           
               
                   <h2 class="section-header">Contact Information</h2>
                <div class="table-responsive no-padding">
                    <table class="table table-hover">
                      <thead>
                        <tr>    
                            <th>Contact Type</th>
                            <th>Contact Value</th>
                            <th>Primary Email</th>
                            <th>Primary Phone</th>
                        </tr>
                      </thead>
                        <g:each in="${customerInstance.contacts}" status="i" var="contact">
                            <g:if test="${contact?.status.id == 2}">
                            <tr>
                                <td>${fieldValue(bean: contact, field: "type.itemValue")}</td>
                                <td>${fieldValue(bean: contact, field: "contactValue")}</td>
                                <td>${fieldValue(bean: contact, field: "isPrimaryEmail")}</td>
                                <td>${fieldValue(bean: contact, field: "isPrimaryPhone")}</td>
                             </tr>
                            </g:if>
                        </g:each>
                    </table>
                </div>
              </div><!-- end section-container --> 
            </div>
            </div>
   
            
            
            <div class="row">
                 <div class="col-xs-12 col-sm-12">   
              <div class="section-container">
                <h2 class="section-header">Addresses Information</h2>
                  <div class="table-responsive no-padding">
                      <table class="table table-hover">
                        <thead>
                          <tr>    
                              <th>Address Type</th>
                              <th>Full Address</th>

                              <th>Phone (1)</th>
                              <th>Phone (2)</th>
                              <th>Fax (1)</th>
                              <th>Fax (2)</th>
                              <th>Primary</th>
                              <th> Mailing</th>
                              <th>Owned</th>
                              <th>Mortgaged</th>
                          </tr>
                        </thead>
                        <g:each in="${customerInstance.addresses}" status="i" var="address">
                            <g:if test="${address.status.id==1 || address.status.id==2}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: address, field: "type.description")}</td>
                                    <td>${fieldValue(bean: address, field: "address1")} ${fieldValue(bean: address, field: "address2")} ${fieldValue(bean: address, field: "town.description")} ${fieldValue(bean: address, field: "address3")}</td>
                                    <td>${fieldValue(bean: address, field: "phone1")}</td>
                                    <td>${fieldValue(bean: address, field: "phone2")}</td>
                                    <td>${fieldValue(bean: address, field: "phone3")}</td>
                                    <td>${fieldValue(bean: address, field: "phone4")}</td>
                                    <td>${fieldValue(bean: address, field: "isPrimary")}</td>
                                    <td>${fieldValue(bean: address, field: "isOwned")}</td>
                                    <td>${fieldValue(bean: address, field: "isMailing")}</td>
                                    <td>${fieldValue(bean: address, field: "isMortaged")}</td>
                                </tr>
                            </g:if>
                        </g:each>
                      </table>
                  </div> 
              </div><!-- end section-container -->
            </div>
            </div>
            
            
            <div class="row">
                      <div class="col-xs-12 col-sm-12">
               <div class="section-container">
                <g:if test="${customerInstance?.type?.id==1}"><h2 class="section-header">Relations Information</h2></g:if>
                <g:if test="${customerInstance?.type?.id!=1}"><h2 class="section-header">Company Connections Information</h2></g:if>
                <div class="table-responsive no-padding">
                    <table class="table table-hover">
                        <thead>
                          <tr>    
                              <th>Relation Type</th>
                              <th>Customer Id</th>
                              <th>First Name</th>
                              <th>Middle Name</th>
                              <th>Last Name</th> 
                              <th>Initials</th>
                          </tr>
                        </thead>
                        <g:each in="${customerInstance.relations}" status="i" var="relation">
                            <g:if test="${relation.status.id==2}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: relation, field: "type.itemValue")}</td>
                                    <td>${fieldValue(bean: relation, field: "customer2.customerId")}</td>
                                    <td>${fieldValue(bean: relation, field: "customer2.name1")}</td>
                                    <td>${fieldValue(bean: relation, field: "customer2.name2")}</td>
                                    <td>${fieldValue(bean: relation, field: "customer2.name3")}</td>
                                    <td>${fieldValue(bean: relation, field: "customer2.name4")}</td>
                                 </tr>
                            </g:if>
                        </g:each>
                    </table>
                </div> 
              </div><!-- end section container -->
            </div>
            </div>
            
            <g:if test="${customerInstance?.type?.id==1}">
                
                
                
            <div class="row">
                      <div class="col-xs-12 col-sm-12">
               <div class="section-container">
                <h2 class="section-header">Education Information</h2>
                <div class="table-responsive no-padding">
                    <table class="table table-hover">
                        <thead>
                          <tr>    
                              <th>Education Type</th>
                              <th>School Name</th>
                              <th>Year Start</th>
                              <th>Year End</th>
                              <th>Degree</th>                                     
                          </tr>
                        </thead>
                        <g:each in="${customerInstance.educations}" status="i" var="education">
                            <g:if test="${education.status.id==2}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: education, field: "type.itemValue")}</td>
                                    <td>${fieldValue(bean: education, field: "schoolAttended")}</td>
                                    <td>${fieldValue(bean: education, field: "yearStart")}</td>
                                    <td>${fieldValue(bean: education, field: "yearEnd")}</td>
                                    <td>${fieldValue(bean: education, field: "educationDegree")}</td>
                                 </tr>
                            </g:if>     
                        </g:each>
                    </table>
                </div> 
              </div><!-- end section-container -->
            </div>
            </div>
            
            
            
              <div class="row">
                    <div class="col-xs-12 col-sm-12">    
                 <div class="section-container">
                 <h2 class="section-header">Presented Ids</h2>
                 <div class="table-responsive no-padding">
                     <table class="table table-hover">
                        <thead>
                           <tr>    
                               <th>Presented Id Type</th>
                               <th>Id No</th>
                               <th>Issue Date</th>
                               <th>Valid Till Date</th>
                               <th>Gov't Issue</th>
                               <th>With Picture</th>
                               <th>With Signature</th>           
                           </tr>
                         </thead>
                         <g:each in="${customerInstance.presentedids}" status="i" var="presentedId">
                            <g:if test="${presentedId.status.id==2}"> 
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                     <td>${fieldValue(bean: presentedId, field: "type.itemValue")}</td>
                                     <td>${fieldValue(bean: presentedId, field: "idNo")}</td>
                                     <td>${presentedId?.issueDate?.format("MM/dd/yyyy")}</td>
                                     <td>${presentedId?.validDate?.format("MM/dd/yyyy")}</td>
                                     <td>${fieldValue(bean: presentedId, field: "isGovtIssue")}</td>
                                     <td>${fieldValue(bean: presentedId, field: "isWithPhoto")}</td>
                                     <td>${fieldValue(bean: presentedId, field: "isWithSignature")}</td>
                                </tr>
                            </g:if>
                         </g:each>
                     </table>
                 </div> 
               </div><!-- end section-container-->
              </div>
              </div>
            </g:if>
                
            
            <div class="row">
                   <div class="col-xs-12 col-sm-12">   
               <div class="section-container">
                <h2 class="section-header">Other Accounts</h2>
                <div class="table-responsive no-padding">
                    <table class="table table-hover">
                        <thead>
                          <tr>    
                              <th>Other Acct Type</th>
                              <th>Bank Name</th>
                              <th>Branch Name</th>
                              <th>Acct No</th>
                              <th>Joint Acct</th>                                     
                          </tr>
                        </thead>
                        <g:each in="${customerInstance.otheraccts}" status="i" var="otherAcct">
                            <g:if test="${otherAcct.status.id==2}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: otherAcct, field: "type.description")}</td>
                                    <td>${fieldValue(bean: otherAcct, field: "bankName")}</td>
                                    <td>${fieldValue(bean: otherAcct, field: "branchName")}</td>
                                    <td>${fieldValue(bean: otherAcct, field: "acctNo")}</td>
                                    <td>${fieldValue(bean: otherAcct, field: "isOtherAcctJoint")}</td>
                                 </tr>
                            </g:if>
                        </g:each>
                    </table>
                </div> 
              </div><!-- end section-container-->
            </div>
            </div>
            
            
            <div class="row">
                
                    <div class="col-xs-12 col-sm-12">  
               <div class="section-container">
                <h2 class="section-header">Attachments</h2>
                <div class="table-responsive no-padding">
                    <table class="table table-hover">
                      <thead>
                        <tr>    
                            <th>Attachment Type</th>
                            <th>Attachment Name</th> 
                        </tr>
                      </thead>
                        <g:each in="${customerInstance.attachments}" status="i" var="attachment">
                            <g:if test="${attachment.status.id==2}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: attachment, field: "type.description")}</td>
                                    <td>
                                        <div class="input-group">
                                        ${fieldValue(bean: attachment, field: "fileName")}
                                        <g:if test="${attachment?.id!=null}">
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-default 
                                                   dropdown-toggle" data-toggle="dropdown">
                                                   Action
                                                   <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu">
                                                   <li> <a target="_blank"href="${createLink(controller:'Attachment', action:'show', id: attachment?.id)}">View</a></li>
                                              <!--     <li> <a target="_blank"href="${createLink(controller:'Attachment', action:'download', id: attachment?.id)}">Download</a></li> -->
                                                </ul>
                                            </span>
                                        </g:if>
                                        </div>
                                    </td>

                                 </tr>
                            </g:if>
                        </g:each>
                    </table>
                </div> 
              </div><!-- end section-container-->
            </div>
                
                
                
             
                
                  <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Record Tagging</legend>
                        <div class="infowrap">
                             <dl class="dl-horizontal">
                               <dt>PEP Description</dt>
                               <dd>${customerInstance?.politicallyExposedPerson?.itemValue}</dd>
                           </dl>
                           
                           <dl class="dl-horizontal">
                               <dt>AMLA Verified By</dt>
                               <dd>${customerInstance?.amlaVerifier?.itemValue}</dd>
                           </dl>
                           
                           <dl class="dl-horizontal">
                               <dt>Source of Income</dt>
                               <dd>${customerInstance?.sourceOfIncome}</dd>
                           </dl>
                           
                           
                           <dl class="dl-horizontal">
                               <dt>Size of Firm</dt>
                               <dd>${customerInstance?.customerCode3?.description}</dd>
                           </dl>
                           
                                     <dl class="dl-horizontal">
                               <dt>Risk Classification</dt>
                               <dd>${customerInstance?.customerCode2?.description}</dd>
                           </dl>
                           
                         <dl class="dl-horizontal">
                               <dt>Type of Resident</dt>
                               <dd>${customerInstance?.customerCode1?.description}</dd>
                           </dl>
                        
                        </div>
                    </fieldset>
                  </div>  
                


                <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Record Status and History Information</legend>
                        <div class="infowrap">
                         
                              <dl class="dl-horizontal">
                                  <dt>Record Status</dt>
                                  <dd>${customerInstance?.status?.description}</dd>
                                </dl>
                                  <dl class="dl-horizontal">
                                  <dt>Created</dt>
                                  <dd><g:formatDate format="MM/dd/yyyy" date="${customerInstance?.createdAt}"/></dd>
                              </dl>
                              <dl class="dl-horizontal">
                                  <dt>Last Updated By</dt>
                                  <dd>${customerInstance?.lastUpdatedBy?.username}</dd>
                              </dl>
                              <dl class="dl-horizontal">
                                  <dt>Last Updated On</dt>
                                  <dd><g:formatDate format="MM/dd/yyyy" date="${customerInstance?.lastUpdatedAt}"/></dd>
                              </dl>
             
                 


                      </div>
                   </fieldset>
                 </div><!-- end section-container -->
                </div>
            </div>
           </div> 
            
            
            
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                        <legend class="section-header">Business Information</legend>
                        <div class="infowrap">
                          <dl class="dl-horizontal">
                              <dt>Business Name</dt>
                              <dd>${customerInstance?.businesses[0]?.name}</dd>
                          </dl>
                          
                           <dl class="dl-horizontal">
                             <dt>Economic Activity</dt>
                             <dd>${customerInstance?.businesses[0]?.lProject}</dd>
                         </dl>
                              
                              <dl class="dl-horizontal">
                              <dt>Business Address</dt>
                              <dd>${customerInstance?.businesses[0]?.address1}</dd>
                              <dd>${customerInstance?.businesses[0]?.address2}</dd>
                              <dd>${customerInstance?.businesses[0]?.address3}</dd>
                          </dl>
                          <dl class="dl-horizontal">
                              <dt>Business Registration Date</dt>
                              <dd>${customerInstance?.businesses[0]?.registrationDate?.format("MM/dd/yyyy")}</dd>
                          </dl>
                          <dl class="dl-horizontal">
                              <dt>Fax No</dt>
                              <dd>${customerInstance?.businesses[0]?.faxNo}</dd>
                          </dl>
                          <dl class="dl-horizontal">
                              <dt>Email Address</dt>
                              <dd>${customerInstance?.businesses[0]?.eMail}</dd>
                          </dl>
                       </div>
                    </fieldset>
                  </div><!-- end section-container -->
                </div>
                <div class="col-xs-12 col-sm-12">
                  <div class="section-container">
                    <fieldset>
                      <legend class="section-header">Employment Information</legend>
                      <div class="infowrap">
                          <dl class="dl-horizontal">
                             <dt>Employer Name</dt>
                             <dd>${customerInstance?.employments[0]?.employerName}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Employer Address</dt>
                              <dd>${customerInstance?.employments[0]?.address1}</dd>
                              <dd>${customerInstance?.employments[0]?.address2}</dd>
                              <dd>${customerInstance?.employments[0]?.address3}</dd>
                          </dl>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Year Start</dt>
                             <dd>${customerInstance?.employments[0]?.yearStart}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Year End</dt>
                             <dd>${customerInstance?.employments[0]?.yearEnd}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Designation</dt>
                             <dd>${customerInstance?.employments[0]?.designation}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Employment Id No</dt>
                             <dd>${customerInstance?.employments[0]?.employmentId}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Gov't Distribution Id</dt>
                             <dd>${customerInstance?.employments[0]?.distributionId}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Region</dt>
                             <dd>${customerInstance?.employments[0]?.region?.itemValue}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Contact No</dt>
                             <dd>${customerInstance?.employments[0]?.contactNo}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Fax No</dt>
                             <dd>${customerInstance?.employments[0]?.faxNo}</dd>
                         </dl>
                         <dl class="dl-horizontal">
                             <dt>Email</dt>
                             <dd>${customerInstance?.employments[0]?.eMail}</dd>
                         </dl>
                     </div>
                   </fieldset>
                  </div><!-- end section-container -->
                </div>
            </div>
          
        </content>
        <content tag="main-actions">
            <ul>
                <li><g:link  action="customerInquiry" id="${customerInstance?.id}">Back to Customer Inquiry</g:link></li>
                <li><g:link target="_blank" id="${customerInstance?.id}" controller="customer" action="printCustomerInformation" > Print Customer Information</g:link></li>
            </ul>
        </content>
    </body>
</html>
