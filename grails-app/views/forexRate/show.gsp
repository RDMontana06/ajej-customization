
<%@ page import="icbs.admin.ForexRate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'forexRate.label', default: 'ForexRate')}" />
		<title>Forex Rate Information</title>
	</head>
	<body>
		<content tag="breadcrumbs">
		  <span class="fa fa-chevron-right"></span><a href="${createLink(uri: '/forexRate')}">Forex Rates Maintenance</a>
          <span class="fa fa-chevron-right"></span><span class="current">Forex Rate Information</span>
		</content>

            <content tag="main-content">   
		<div id="show-forexRate" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list forexRate">
			
				<g:if test="${forexRateInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="forexRate.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:link controller="currency" action="show" id="${forexRateInstance?.currency?.id}">${forexRateInstance?.currency?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="forexRate.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label">${forexRateInstance?.date}</span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.rate}">
				<li class="fieldcontain">
					<span id="rate-label" class="property-label"><g:message code="forexRate.rate.label" default="Rate" /></span>
					
						<span class="property-value" aria-labelledby="rate-label"><g:fieldValue bean="${forexRateInstance}" field="rate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.refRate}">
				<li class="fieldcontain">
					<span id="refRate-label" class="property-label"><g:message code="forexRate.refRate.label" default="Ref Rate" /></span>
					
						<span class="property-value" aria-labelledby="refRate-label"><g:fieldValue bean="${forexRateInstance}" field="refRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.buyRate1}">
				<li class="fieldcontain">
					<span id="buyRate1-label" class="property-label"><g:message code="forexRate.buyRate1.label" default="Buy Rate1" /></span>
					
						<span class="property-value" aria-labelledby="buyRate1-label"><g:fieldValue bean="${forexRateInstance}" field="buyRate1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.buyRate2}">
				<li class="fieldcontain">
					<span id="buyRate2-label" class="property-label"><g:message code="forexRate.buyRate2.label" default="Buy Rate2" /></span>
					
						<span class="property-value" aria-labelledby="buyRate2-label"><g:fieldValue bean="${forexRateInstance}" field="buyRate2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.buyRate3}">
				<li class="fieldcontain">
					<span id="buyRate3-label" class="property-label"><g:message code="forexRate.buyRate3.label" default="Buy Rate3" /></span>
					
						<span class="property-value" aria-labelledby="buyRate3-label"><g:fieldValue bean="${forexRateInstance}" field="buyRate3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.buyRate4}">
				<li class="fieldcontain">
					<span id="buyRate4-label" class="property-label"><g:message code="forexRate.buyRate4.label" default="Buy Rate4" /></span>
					
						<span class="property-value" aria-labelledby="buyRate4-label"><g:fieldValue bean="${forexRateInstance}" field="buyRate4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.buyRate5}">
				<li class="fieldcontain">
					<span id="buyRate5-label" class="property-label"><g:message code="forexRate.buyRate5.label" default="Buy Rate5" /></span>
					
						<span class="property-value" aria-labelledby="buyRate5-label"><g:fieldValue bean="${forexRateInstance}" field="buyRate5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.sellRate1}">
				<li class="fieldcontain">
					<span id="sellRate1-label" class="property-label"><g:message code="forexRate.sellRate1.label" default="Sell Rate1" /></span>
					
						<span class="property-value" aria-labelledby="sellRate1-label"><g:fieldValue bean="${forexRateInstance}" field="sellRate1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.sellRate2}">
				<li class="fieldcontain">
					<span id="sellRate2-label" class="property-label"><g:message code="forexRate.sellRate2.label" default="Sell Rate2" /></span>
					
						<span class="property-value" aria-labelledby="sellRate2-label"><g:fieldValue bean="${forexRateInstance}" field="sellRate2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.sellRate3}">
				<li class="fieldcontain">
					<span id="sellRate3-label" class="property-label"><g:message code="forexRate.sellRate3.label" default="Sell Rate3" /></span>
					
						<span class="property-value" aria-labelledby="sellRate3-label"><g:fieldValue bean="${forexRateInstance}" field="sellRate3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.sellRate4}">
				<li class="fieldcontain">
					<span id="sellRate4-label" class="property-label"><g:message code="forexRate.sellRate4.label" default="Sell Rate4" /></span>
					
						<span class="property-value" aria-labelledby="sellRate4-label"><g:fieldValue bean="${forexRateInstance}" field="sellRate4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forexRateInstance?.sellRate5}">
				<li class="fieldcontain">
					<span id="sellRate5-label" class="property-label"><g:message code="forexRate.sellRate5.label" default="Sell Rate5" /></span>
					
						<span class="property-value" aria-labelledby="sellRate5-label"><g:fieldValue bean="${forexRateInstance}" field="sellRate5"/></span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:forexRateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
				</fieldset>
			</g:form>
		</div>
            </content>
             <content tag="main-actions">
                <ul>
                    <li><g:link class="create" action="create"><g:message code="default.newupdate.label" args="[entityName]" default="New Forex Rate" /></g:link></li>
				</ul>
            </content>
	</body>
</html>
