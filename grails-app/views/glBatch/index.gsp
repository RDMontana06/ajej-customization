<%@ page import="icbs.gl.GlBatchHdr" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'glBatchHdr.label', default: 'GL Batch Transactions')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript>
        var processBatchTransactionAjaxLink = "${createLink(controller:'glBatch',action:'processBatchAjax')}";
        var getGlAccountsAjaxLink = "${createLink(controller:'glBatch',action:'getGLAcctByBranch')}"
    </g:javascript>
  </head>
  <body>
    <content tag="main-content">
      <div id="batch">
        <div id="list-glBatchHdr" class="content scaffold-list" role="main">
          <g:if test="${flash.message}">
              <script>
                    $(function(){
                        var x = '${flash.error}';
                            notify.message(x);
                    });
              </script>      
          </g:if>
          <g:if test="${flash.error}">
                <script>
                    $(function(){
                        var x = '${flash.error}';
                            notify.message(x+'|error|alert');
                    });
                </script>
          </g:if>          
                            <g:form class="form-inline">
            <div class="form-group">
              <g:select name="max" value="${params.max}" from="[5, 10, 15, 20]" class="form-control input-sm pull-left"onchange="this.form.submit()" />
            </div>
            <div class="right">
              <div class="form-group">
                <g:textField  type="text" name="query" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
              </div>
              <g:submitButton name="Search" class="btn btn-sm btn-default"><i class="fa fa-search"></i></g:submitButton>
            </div>
          </g:form>
          <div class="table-responsive">
                                <table class="table table-hover table-condensed table-bordered table-striped">
                                    <thead>
              <tr>
                <th><g:message code="glBatchHdr.contraGl.label" default="Batch Series" /></th>
                <th><g:message code="glBatchHdr.contraGl.label" default="Batch ID" /></th>
              
                <th><g:message code="glBatchHdr.errorGl.label" default="Batch Name" /></th>
              
                <g:sortableColumn property="batchType" title="${message(code: 'glBatchHdr.batchType.label', default: 'Branch')}" />
              
                <g:sortableColumn property="batchParticulars" title="${message(code: 'glBatchHdr.batchParticulars.label', default: 'Total Debits')}" />
              
                <th><g:message code="glBatchHdr.loanAcct.label" default="Total Credits" /></th>
                
                <g:sortableColumn property="batchStatus" title="${message(code: 'glBatchHdr.batchStatus.label', default: 'Batch Status')}" />
              
                <th> Actions </th>
                
                <td> Created By </th>
              
              </tr>
            </thead>
            <tbody>
            <g:each in="${glBatchHdrInstanceList}" status="i" var="glBatchHdrInstance">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: glBatchHdrInstance, field: "id")}</td>
                <td>${fieldValue(bean: glBatchHdrInstance, field: "batchId")}</td>
                <!-- <td><g:link action="edit" id="${glBatchHdrInstance.id}">${fieldValue(bean: glBatchHdrInstance, field: "batchId")}</g:link></td> -->
              
                <td>${fieldValue(bean: glBatchHdrInstance, field: "batchName")}</td>
              
                <td>${fieldValue(bean: glBatchHdrInstance, field: "branch.name")}</td>
              
                <td>${fieldValue(bean: glBatchHdrInstance, field: "totalDebit")}</td>
              
                <td>${fieldValue(bean: glBatchHdrInstance, field: "totalCredit")}</td>
                <td>${glBatchHdrInstance.status.description}</td>
              
                <td> <button v-on="click: processBatch('${glBatchHdrInstance.batchId}')" class="btn btn-primary btn-xs"id="${glBatchHdrInstance.batchId}"> Run </button>
                 <g:link class="btn btn-primary btn-xs" action="edit" id="${glBatchHdrInstance.id}"> Edit </g:link>
                 <g:link class="btn btn-primary btn-xs" target="_blank" action="printGlBatch" id="${glBatchHdrInstance.id}" params="['id': glBatchHdrInstance?.id]"> Print </g:link>
                </td>
                
                <td>${fieldValue(bean: glBatchHdrInstance, field: "createdBy.username")}</td>
              
              </tr>
            </g:each>
            </tbody>
          </table>
                         </div>
          <div class="pagination">
            <g:paginate total="${GlBatchHdrInstanceCount ?: 0}" params="${params}" />
          </div>
        </div>
      </div>   
    </content>
            <content tag="main-actions">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
    </content>
  </body>
</html>