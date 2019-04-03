<%@ page import="icbs.gl.GlLink" %>


<div>
    <g:if test="${message}">
        <div class="box-body">
            <div class="alert alert-info alert-dismissable">
                <i class="fa fa-info"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <b>Message</b> <div class="message" role="status">${message}</div>
            </div>
        </div>
    </g:if>
    <g:hasErrors bean="${loanInstance}"> 
        <div class="box-body">
            <div class="alert alert-danger alert-dismissable">
                <i class="fa fa-ban"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <b>Alert!</b> 
                <ul class="errors" role="alert">
                    There are errors
                </ul>            
            </div>
        </div>
    </g:hasErrors>
    <g:form name="update-branch-form">
        <g:hiddenField name="id" id="id" value="${loanInstance?.id}"/>
        <div class="form-group fieldcontain ${hasErrors(bean: loanInstance, field: 'branch', 'has-error')} ">
            <label class="control-label col-sm-4" for="branch">Branch</label>
            <div class="col-sm-8">
                <g:select id="branch" name="branch.id" from="${icbs.admin.Branch.findAll{status.id == 2}}" optionKey="id"  optionValue="name" value="${loanInstance?.branch?.id}" class="many-to-one form-control"/>
                <g:hasErrors bean="${loanInstance}" field="branch">
                    <div class="controls">
                        <span class="help-block">
                            <g:eachError bean="${loanInstance}" field="branch">
                                <g:message error="${it}" /><br/>
                            </g:eachError>
                        </span>
                    </div>
                </g:hasErrors>
            </div>
        </div>
    </g:form>  
</div>
