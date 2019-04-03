<legend>General Ledger Classification</legend>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'glLink', 'has-error')} required">
    <label class="control-label col-sm-4" for="glLink">
        <g:message code="loan.glLink.label" default="GL Code" />
    </label>
    <div class="col-sm-8">
        <g:select id="glLink" name="glLink.id" from="${icbs.gl.CfgAcctGlTemplate.list().findAll{it.type == 6}}" optionKey="id" optionValue="description" value="${loanInstance?.glLink?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="glLink">
           <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>
<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanPerformanceId', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanPerformanceId">
        <g:message code="loan.loanPerformanceId.label" default="GL Loan Status" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanPerformanceId" name="loanPerformanceId.id" from="${icbs.lov.LoanPerformanceId.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanPerformanceId?.id}" class="many-to-one form-control"/>

        <g:hasErrors bean="${loanInstance}" field="loanPerformanceId">
           <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>
<br/><br/>

<legend>Loan Performance Classification</legend>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanType', 'has-error')} required">

    <label class="control-label col-sm-4" for="loanType">
        <g:message code="loan.loanType.label" default="Name of Institution" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanType" name="loanType.id" from="${icbs.lov.LoanType.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanType?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanType">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>
<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanSecurity', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanSecurity">
        <g:message code="loan.loanSecurity.label" default="Loan Security" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanSecurity" name="loanSecurity.id" from="${icbs.lov.LoanSecurity.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanSecurity?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanSecurity">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanProject', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanProject">
        <g:message code="loan.loanProject.label" default="Economic Activity/Industry" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanProject" name="loanProject.id" from="${icbs.lov.LoanProject.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanProject?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanProject">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>

<!--
<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanProjectAgriagra', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanProjectAgriagra">
        <g:message code="loan.loanProjectAgriagra.label" default="Purpose of AgriAgra" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanProjectAgriagra" name="loanProjectAgriagra.id" from="${icbs.lov.LoanProjectAgriagra.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanProjectAgriagra?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanProjectAgriagra">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>
-->
<!--
<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanProjectSummaryGranted', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanProjectSummaryGranted">
        <g:message code="loan.loanProjectSummaryGranted.label" default="Purpose of Loan Granted" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanProjectSummaryGranted" name="loanProjectSummaryGranted.id" from="${icbs.lov.LoanProjectSummaryGranted.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanProjectSummaryGranted?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanProjectSummaryGranted">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>
-->

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanCreditRating', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanCreditRating">
        <g:message code="loan.loanCreditRating.label" default="Credit Rating" />
    </label>
    <div class="col-sm-8">
    <g:select id="loanCreditRating" name="loanCreditRating.id" from="${icbs.lov.LoanCreditRating.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanCreditRating?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanCreditRating">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>


<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanProvision', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanProvision">
        <g:message code="loan.loanProvision.label" default="Loan Provision" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanProvision" name="loanProvision.id" from="${icbs.lov.LoanProvision.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanProvision?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanProvision">
            <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'loanKindOfLoan', 'has-error')} required">
    <label class="control-label col-sm-4" for="loanKindOfLoan">
        <g:message code="loan.KindOfLoan.label" default="Kind of Loan" />
    </label>
    <div class="col-sm-8">
        <g:select id="loanKindOfLoan" name="loanKindOfLoan.id" from="${icbs.lov.LoanKindOfLoan.list()}" optionKey="id" optionValue="description" value="${loanInstance?.loanKindOfLoan?.id}" class="form-control" noSelection="['null': '']"/>

        <g:hasErrors bean="${loanInstance}" field="loanKindOfLoan">
           <script>
                    $(function
                        var x = '${it}';
                        notify.error(x);
                       // console.log(x)
                       // setTimeout(function(){ notify.success(x); }, 3000);
                    });
            </script>
        </g:hasErrors>
    </div>             
</div>




<%--<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'performanceClassificationScheme1', 'has-error')} required">
    <label class="control-label col-sm-4" for="performanceClassificationScheme1">
        <g:message code="loan.performanceClassificationScheme.label" default="Performance Classification Scheme 1" />
    </label>
    <div id="performance-classification-scheme1" class="col-sm-8">    
        
        <g:hasErrors bean="${loanInstance}" field="performanceClassificationScheme">
            <div class="controls">
                <span class="help-block">
                    <g:eachError bean="${loanInstance}" field="performanceClassificationScheme">
                        <g:message error="${it}" /><br/>
                    </g:eachError>
                </span>
            </div>
        </g:hasErrors>
    </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'performanceClassificationScheme2', 'has-error')} required">
    <label class="control-label col-sm-4" for="performanceClassificationScheme2">
        <g:message code="loan.performanceClassificationScheme.label" default="Performance Classification Scheme 2" />
    </label>
    <div id="performance-classification-scheme2" class="col-sm-8">
    </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'performanceClassificationScheme3', 'has-error')} required">
    <label class="control-label col-sm-4" for="performanceClassificationScheme3">
        <g:message code="loan.performanceClassificationScheme.label" default="Performance Classification Scheme 3" />
    </label>
    <div id="performance-classification-scheme3" class="col-sm-8">    
    </div>             
</div>

<div class="fieldcontain form-group ${hasErrors(bean: loanInstance, field: 'performanceClassificationScheme4', 'has-error')} required">
    <label class="control-label col-sm-4" for="performanceClassificationScheme4">
        <g:message code="loan.performanceClassificationScheme.label" default="Performance Classification Scheme 4" />
    </label>
    <div id="performance-classification-scheme4" class="col-sm-8">    
    </div>             
</div>--%>

<br/><br/>



