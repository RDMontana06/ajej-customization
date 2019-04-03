<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<g:hiddenField id="Customer_status" name="Customer_status" value="${customerInstance?.status}"/>
<g:hiddenField id="customer" name="customer.id" value="${customerInstance?.id}"/>
    <div class="section-container">
        <fieldset>
            <legend class="section-header"><g:if test="${boxName}">${boxName}</g:if><g:else>Principal Owner Details</g:else></legend>
            <div class="col-xs-8 col-sm-8 col-md-8">
                <div class="infowrap">
                    <dl class="dl-horizontal">
                             <dt>Customer ID</dt>
                             <dd>${customerInstance?.customerId}</dd>
                          </dl>
                    <dl class="dl-horizontal">
                           <g:if test="${customerInstance?.type?.id==1}">
                                <dt>Customer Name</dt>
                            </g:if>
                            <g:else>
                                <dt>Company Name</dt>
                            </g:else>
                           <dd>${customerInstance?.displayName}</dd>
                    </dl>
                    <dl class="dl-horizontal">
                           <g:if test="${customerInstance?.type?.id==1}"> 
                                <dt>Date Of Birth</dt>
                           </g:if>
                           <g:else>
                                <dt>Registration Date</dt>
                            </g:else>
                           <dd><g:formatDate format="MM/dd/yyyy" date="${customerInstance?.birthDate}"/></dd>
                    </dl>
                    <dl class="dl-horizontal">
                           <dt>Address</dt>
                           <g:set var = "address" value="${customerInstance?.addresses?.find{it.isPrimary==true}}"/>
                            <g:if test="${address}">
                                <dd>
                                     ${address?.address1}<br>
                                     ${address?.address2}<br>
                                     ${address?.town?.description}<br>
                                     ${address?.address3}<br>

                                </dd>
                            </g:if>
                            <g:else>
                                N/A
                            </g:else>
                    </dl>
                </div>
            </div>
            <div class="infowrap">
                <dl class="dl-horizontal">
                   <dd><g:if test="${(customerInstance?.attachments?.find{it.isPrimaryPhoto==true})?.id}"> <img width="120px" style="float:right" height="120px"src="${createLink(controller:'Attachment', action:'show', id: (customerInstance?.attachments?.find{it.isPrimaryPhoto==true})?.id )}"/></g:if></dd>
                </dl>
            </div>
        </fieldset>
    </div>