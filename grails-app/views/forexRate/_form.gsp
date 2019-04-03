<%@ page import="icbs.admin.ForexRate" %>




<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'currency', 'has-error')} required">
	<label class="control-label col-sm-4" for="currency">
		<g:message code="forexRate.currency.label" default="Currency" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8"><g:select id="currency" name="currency.id" from="${icbs.admin.Currency.findAll{configItemStatus.id == 2}}" optionKey="id" optionValue="name" required="" value="${forexRateInstance?.currency?.id}" class="many-to-one form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="currency">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="currency">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'rate', 'has-error')} ">
	<label class="control-label col-sm-4" for="rate">
		<g:message code="forexRate.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8"><g:field name="rate" value="${fieldValue(bean: forexRateInstance, field: 'rate')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="rate">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="rate">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'refRate', 'has-error')} ">
	<label class="control-label col-sm-4" for="refRate">
		<g:message code="forexRate.refRate.label" default="Ref Rate" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8"><g:field name="refRate" value="${fieldValue(bean: forexRateInstance, field: 'refRate')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="refRate">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="refRate">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'buyRate1', 'has-error')} ">
	<label class="control-label col-sm-4" for="buyRate1">
		<g:message code="forexRate.buyRate1.label" default="Buy Rate1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8"><g:field name="buyRate1" value="${fieldValue(bean: forexRateInstance, field: 'buyRate1')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="buyRate1">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="buyRate1">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'buyRate2', 'has-error')} ">
	<label class="control-label col-sm-4" for="buyRate2">
		<g:message code="forexRate.buyRate2.label" default="Buy Rate2" />
		
	</label>
	<div class="col-sm-8"><g:field name="buyRate2" value="${fieldValue(bean: forexRateInstance, field: 'buyRate2')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="buyRate2">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="buyRate2">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'buyRate3', 'has-error')} ">
	<label class="control-label col-sm-4" for="buyRate3">
		<g:message code="forexRate.buyRate3.label" default="Buy Rate3" />
		
	</label>
	<div class="col-sm-8"><g:field name="buyRate3" value="${fieldValue(bean: forexRateInstance, field: 'buyRate3')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="buyRate3">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="buyRate3">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'buyRate4', 'has-error')} ">
	<label class="control-label col-sm-4" for="buyRate4">
		<g:message code="forexRate.buyRate4.label" default="Buy Rate4" />
		
	</label>
	<div class="col-sm-8"><g:field name="buyRate4" value="${fieldValue(bean: forexRateInstance, field: 'buyRate4')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="buyRate4">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="buyRate4">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'buyRate5', 'has-error')} ">
	<label class="control-label col-sm-4" for="buyRate5">
		<g:message code="forexRate.buyRate5.label" default="Buy Rate5" />
		
	</label>
	<div class="col-sm-8"><g:field name="buyRate5" value="${fieldValue(bean: forexRateInstance, field: 'buyRate5')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="buyRate5">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="buyRate5">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'sellRate1', 'has-error')} ">
	<label class="control-label col-sm-4" for="sellRate1">
		<g:message code="forexRate.sellRate1.label" default="Sell Rate1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8"><g:field name="sellRate1" value="${fieldValue(bean: forexRateInstance, field: 'sellRate1')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="sellRate1">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="sellRate1">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'sellRate2', 'has-error')} ">
	<label class="control-label col-sm-4" for="sellRate2">
		<g:message code="forexRate.sellRate2.label" default="Sell Rate2" />
		
	</label>
	<div class="col-sm-8"><g:field name="sellRate2" value="${fieldValue(bean: forexRateInstance, field: 'sellRate2')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="sellRate2">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="sellRate2">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'sellRate3', 'has-error')} ">
	<label class="control-label col-sm-4" for="sellRate3">
		<g:message code="forexRate.sellRate3.label" default="Sell Rate3" />
		
	</label>
	<div class="col-sm-8"><g:field name="sellRate3" value="${fieldValue(bean: forexRateInstance, field: 'sellRate3')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="sellRate3">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="sellRate3">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'sellRate4', 'has-error')} ">
	<label class="control-label col-sm-4" for="sellRate4">
		<g:message code="forexRate.sellRate4.label" default="Sell Rate4" />
		
	</label>
	<div class="col-sm-8"><g:field name="sellRate4" value="${fieldValue(bean: forexRateInstance, field: 'sellRate4')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="sellRate4">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="sellRate4">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: forexRateInstance, field: 'sellRate5', 'has-error')} ">
	<label class="control-label col-sm-4" for="sellRate5">
		<g:message code="forexRate.sellRate5.label" default="Sell Rate5" />
		
	</label>
	<div class="col-sm-8"><g:field name="sellRate5" value="${fieldValue(bean: forexRateInstance, field: 'sellRate5')}" class="form-control"/>

            <g:hasErrors bean="${forexRateInstance}" field="sellRate5">
                <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${forexRateInstance}" field="sellRate5">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                </div>
            </g:hasErrors>
        </div>             
</div>

<div><g:hiddenField name="configItemStatus" value="2" /></div>
<div><g:hiddenField name="date" value="${new Date()}" /></div>