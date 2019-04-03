package icbs.gl


import icbs.admin.Branch
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest
import grails.converters.JSON
import grails.converters.deep.JSON
import grails.converters.*
import org.codehaus.groovy.grails.web.json.JSONObject
import groovy.json.JsonSlurper
import groovy.json.JsonBuilder
import icbs.gl.GlBatchHdr
import icbs.loans.Loan
import icbs.lov.LoanAcctStatus
import icbs.deposit.Deposit
import icbs.lov.DepositStatus
import icbs.admin.UserMaster
import icbs.admin.Module
import icbs.lov.GlBatchHdrStatus


@Transactional(readOnly = true)
class GlBatchController {

    
    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]
    
    def GlTransactionService
    def auditLogService
    def jasperService
    def RoleModuleService
    
    def index(Integer max) {
        def user = UserMaster.get(session.user_id)
        params.max = Math.min(max ?: 10, 100)
        if(params.offset==null){
            params.offset=0
        }
        if (params.query == null) {
            def btList = GlBatchHdr.createCriteria().list(params) {
                and {
                    eq("txnDate", Branch.get(1).runDate)
                    ne("status", GlBatchHdrStatus.get(3))
                    ne("status", GlBatchHdrStatus.get(4))
                    if (!user.branch.dataCenter) {
                    eq("branch",user.branch) 
                    }                
                }
            }            
            respond btList, model:[params:params,GlBatchHdrInstanceCount:  btList.totalCount]
            return
        }
        else{
            def btList = GlBatchHdr.createCriteria().list(params) {
                and {
                    eq("txnDate", Branch.get(1).runDate)
                    ne("status", GlBatchHdrStatus.get(3))
                    ne("status", GlBatchHdrStatus.get(4))
                    eq("branch",user.branch)
                    ilike("batchName", "%${params.query}%")
                    if (!user.branch.dataCenter) {
                       eq("branch",user.branch) 
                    }                      
                }
            }            
            respond btList, model:[params:params,GlBatchHdrInstanceCount:  btList.totalCount]
            return
        }
        return
    }

    def show(GlBatch glBatchInstance) {
        respond glBatchInstance
    }

    def create() {
        def createModule = Module.findByCode('GEN00301')
        def allowCreate = RoleModuleService.canPerform(createModule)
        if (!allowCreate) {
            // not allowed to create
            flash.error = 'User not allowed to create batch'
            redirect(action:"index")
            return            
        }
        respond new GlBatch(params)
    }

    @Transactional
    def save(GlBatch glBatchInstance) {

        if (glBatchInstance == null) {
            notFound()
            return
        }

        if (glBatchInstance.hasErrors()) {
            respond glBatchInstance.errors, view:'create'
            return
        }

        glBatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'glBatch.label', default: 'GlBatch'), glBatchInstance.id])
                redirect glBatchInstance
            }
            '*' { respond glBatchInstance, [status: CREATED] }
        }
    }

    def edit(GlBatchHdr glBatchHdrInstance) {
        if (glBatchHdrInstance.status == GlBatchHdrStatus.get(3) || glBatchHdrInstance.status == GlBatchHdrStatus.get(4)) {
            flash.error = 'Cannot edit batch already posted/cancelled'
            redirect(action:"index")
            return
        } else {
            def editModule = Module.findByCode('GEN00301')
            def allowEdit = RoleModuleService.canPerform(editModule)
            if (!allowEdit) {
                // not allowed to create
                flash.error = 'User not allowed to edit batch'
                redirect(action:"index")
                return            
            }            
            respond glBatchHdrInstance
        }
    }
    
    def printNonCheck() {
                try {    
            println params?.id 
            def hdrIdNo = params?.id.toInteger()
            params._name = "printNonCheckDisbursement"
            params._format ="PDF"//required caps
            params._file ="printNonCheckDisbursement.jasper" //jasper file name
            params?.BID = hdrIdNo
//            params.id = 1 //jasper param name
            def reportDef = jasperService.buildReportDefinition(params, request.getLocale(), [])
            byte[] bytes = jasperService.generateReport(reportDef).toByteArray()
            //set the byte content on the response. This determines what is shown in your browser window.       
            response.setContentType('application/pdf')
            response.setContentLength(bytes.length)

            response.setHeader('Content-disposition', 'inline; filename=quote.pdf')
            response.setHeader('Expires', '0');
            response.setHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0');
            response.outputStream << bytes
            response.outputStream.flush()
        }catch(Exception e) {
            //deal with your exception here
            e.printStackTrace()
        }
    }
    

    @Transactional
    def update(GlBatch glBatchInstance) {
        if (glBatchInstance == null) {
            notFound()
            return
        }

        if (glBatchInstance.hasErrors()) {
            respond glBatchInstance.errors, view:'edit'
            return
        }

        glBatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GlBatch.label', default: 'GlBatch'), glBatchInstance.id])
                redirect glBatchInstance
            }
            '*'{ respond glBatchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GlBatch glBatchInstance) {

        if (glBatchInstance == null) {
            notFound()
            return
        }

        glBatchInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GlBatch.label', default: 'GlBatch'), glBatchInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'glBatch.label', default: 'GlBatch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def processBatchAjax () { 
        
        def batch = GlBatch.findAllByBatchId(params?.batchId)
        //println result
        
        def batchHdr = GlBatchHdr.findByBatchId(params?.batchId)
        println batchHdr.batchId
        println batchHdr.status
        
        if (batchHdr.status == GlBatchHdrStatus.get(1)) {
            
            render (contentType: "application/json") 
            {
                status = "1"
            }
            
            redirect(action:"index")
        } else if (batchHdr.status == GlBatchHdrStatus.get(3)) {
            render (contentType: "application/json") 
            {
                status = "2"
            }
            
            redirect(action:"index")           
            render (contentType: "application/json") 
            {
                status = "3"
            }
            
            redirect(action:"index")          
        }  else {
            //Parse the results 
            batch.each {
            
                def batchType = it.batchType
                println it


                //Debit Deposit Account
                if(batchType == "1" ) {
                    GlTransactionService.debitDepositAccount(it.id.toLong(), it.account, it.amount, it.particulars, it.batchId, UserMaster.read(session.user_id))
                 }
                //Credit Deposit Account
                else if (batchType == "2") {
                    //GlTransactionService.creditDepositAccount(it.id.toLong(), it.account, it.amount, it.particulars, it.batchId, UserMaster.read(session.user_id))
                    GlTransactionService.creditDepositAccount(it.id.toLong(), it.account, it.amount, it.particulars, it.batchId, UserMaster.read(session.user_id))
                }
                //Verify
                else if (batchType == "3") {
                    GlTransactionService.depositAcctIcc(it.id.toLong(), it.account, it.amount, it.checkNo ,UserMaster.read(session.user_id))
                }
                //Debit Loan Account
                else if (batchType == "4") {
                    //def debitLoanAccount (String loanAcctNo, Double amount, Double principal, Double interest, Double penalty, Double serviceCharge)
                    GlTransactionService.debitLoanAccount(it.id.toLong(), it.account, it.amount, it.particulars, it.batchId, UserMaster.read(session.user_id))
                }
                // Credit Loan Account (Not Specified)
                else if (batchType == "5" ) {
                    GlTransactionService.creditLoanAccount(it.id.toLong(), it.account, it.amount, it.principal, it.interest, it.penalty, it.serviceCharge, it.particulars, it.batchId, UserMaster.read(session.user_id))
                }
                // Credit Loan Specified
                else if (batchType == "6") {
                    GlTransactionService.creditLoanAccount(it.id.toLong(), it.account, it.amount, it.principal, it.interest, it.penalty, it.serviceCharge, it.particulars, it.batchId, UserMaster.read(session.user_id))
                }
                //Debit GL Account
                else if (batchType == "7") {
                    GlTransactionService.debitGlAccount(it.account, it.amount, it.id.toLong(),UserMaster.read(session.user_id))
                }
                else {
                    GlTransactionService.creditGlAccount(it.account, it.amount, it.id.toLong(),UserMaster.read(session.user_id))
                }

                //GlTransactionService.saveBatchEntry(it)
            }
        
            // update batch header
            batchHdr.status = GlBatchHdrStatus.get(3)
            batchHdr.postedBy = UserMaster.get(session.user_id)
            batchHdr.isLocked = true
            batchHdr.save(flush:true)
            
            auditLogService.insert('140', 'GEN00700', 'Post GL Batch '+params?.bId, 'glBatchHdr', null, null, null, batchHdr.id)
            //render ""
            redirect(action:"index")
        
            return            
        }       
    }
    
    @Transactional
    def getGLAcctByBranch () {
        
        def glAccounts = GlAccount.findAllByBranch(Branch.get(params?.branch_id))
        
        render glAccounts as JSON
    
    }

    @Transactional
    def getLoanAcctByBranch () {
        
        def loanAccounts = Loan.findAllByBranch(Branch.get(params?.branch_id))
        
        def loans = new JsonBuilder()

        loans.message {
              loanAccounts.each {
                    accountNo it.accountNo
            }
        }
        
        render loans as JSON
    
    }

    @Transactional
    def getDepositAcctByBranch () {

        def depositAccounts = Deposit.findAllByBranch(Branch.get(params?.branch_id))
        
        render depositAccounts as JSON
    
    }

    @Transactional
    def saveGLBatchTransactions () {

        def slurper = new JsonSlurper()
        def result = slurper.parseText(params?.transactions) 
        
        result.each {  
            //Save each transaction as a seperate entry
            GlTransactionService.saveBatchEntry(it)
        }

        result = slurper.parseText(params?.batchDetails) 
        GlTransactionService.saveBatchHeader(result)

        def glbh = GlBatchHdr.findByBatchId(result?.batchId)  
        glbh.createdBy = UserMaster.get(session.user_id)
        glbh.save(failOnError:true, flush:true) 
        
        render ""
        
        return

    }

    @Transactional
    def getBatchByBatchIdAjax () {

        def batch = GlBatch.findAllByBatchId(params?.batchId)
         
        render batch as JSON
                
        return 
    }

    @Transactional
    def getBatchDetailsAjax () {
        
        def batchDetails = GlBatchHdr.findByBatchId(params?.batchId)
        
        render(contentType: 'text/json') {[
            'batchDetails' : batchDetails
        ]}
        
        return

    }

    @Transactional
    def updateBatchGLTransactions () {
        
        def slurper = new JsonSlurper() 
        
        GlTransactionService.updateBatchHeader(params?.batchId, slurper.parseText(params?.batchDetails))

        GlTransactionService.deleteAllBatchEntries(params?.batchId) 
        
        def result = slurper.parseText(params?.transactions)
        
        result.each {  
            //Save each transaction as a seperate entry
            GlTransactionService.saveBatchEntry(it)
        }

        render ""

        return
    }
    
    // approve batch
    @Transactional
    def approve() {
        println params
        boolean batchError = false        
        def glb = GlBatchHdr.findByBatchId(params?.bId)      
        def batch = GlBatch.findAllByBatchId(glb.batchId)
        def approveModule = Module.findByCode('GEN00303')
        def allowApprove = RoleModuleService.canPerform(approveModule)
        
        for (b in batch) {
            if (b.lineStatus > '') {
                println b.lineStatus
                batchError = true
            }
        }
        if (batchError) {
            flash.error = 'GL Batch lines with error'
        } else if (!allowApprove) {
            // not allowed
            flash.error = 'User not allowed to approved!'
        } else if (glb.totalDebit != glb.totalCredit) {
            flash.error = 'GL Batch not balanced'
        } else if (glb.valueDate > Branch.get(1).runDate) {
            flash.error = 'GL Batch Value date later than system date'
        } else if (glb.branch != UserMaster.get(session.user_id).branch) {
            if (!UserMaster.get(session.user_id).branch.dataCenter) {
                flash.error = 'GL Batch Branch must match user branch'  
            } else {
                glb.status = GlBatchHdrStatus.get(2)
                glb.approvedBy = UserMaster.get(session.user_id)
                glb.save(failOnError:true, flush:true)

                auditLogService.insert('140', 'GEN00700', 'Approve GL Batch '+params?.bId, 'glBatchHdr', null, null, null, glb.id)
                flash.message = 'Batch Approved |success'                
            }           
        }  else {
            glb.status = GlBatchHdrStatus.get(2)
            glb.approvedBy = UserMaster.get(session.user_id)
            glb.save(failOnError:true, flush:true)
        
            auditLogService.insert('140', 'GEN00700', 'Approve GL Batch '+params?.bId, 'glBatchHdr', null, null, null, glb.id)
            flash.message = 'Batch Approved |success|alert'
        }
        
        //redirect action: 'index'
        def glBatchInstance = batch
        def glBatchHdrInstance = glb
        render(view: "approveBatch", model: [glBatchInstance: glBatchInstance, glBatchHdrInstance: glBatchHdrInstance])
        return
    }

    // print batch details
    def print() {
        try {
            params._name = "GL Batch Report"
            params._format ="PDF"//required caps
            params._file ="GlBatchReport.jasper" //eto ung pangalang ng jasper file
            params.id = params?.bId
            //params.txn_type=1
            //params.acct_id=1
            def reportDef = jasperService.buildReportDefinition(params, request.getLocale(), [])
            byte[] bytes = jasperService.generateReport(reportDef).toByteArray()
            //set the byte content on the response. This determines what is shown in your browser window.       
            response.setContentType('application/pdf')
            response.setContentLength(bytes.length)

            response.setHeader('Content-disposition', 'inline; filename=quote.pdf')
            response.setHeader('Expires', '0');
            response.setHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0');
            response.outputStream << bytes
            response.outputStream.flush()
        }catch(Exception e) {
            //deal with your exception here
            e.printStackTrace()
            //redirect, etc
        }
    }
    
    
    def printGlBatch() {
                try {         
            println params?.id 
            def hdrIdNo = params?.id.toInteger()
            params._name = "GL_Batch_Report"
            params._format ="PDF"//required caps
            params._file ="GL_BATCH_REPORT_NOLOGO.jasper" //jasper file name
            params?.Bid = hdrIdNo
//            params.id = 1 //jasper param name
            def reportDef = jasperService.buildReportDefinition(params, request.getLocale(), [])
            byte[] bytes = jasperService.generateReport(reportDef).toByteArray()
            //set the byte content on the response. This determines what is shown in your browser window.       
            response.setContentType('application/pdf')
            response.setContentLength(bytes.length)

            response.setHeader('Content-disposition', 'inline; filename=quote.pdf')
            response.setHeader('Expires', '0');
            response.setHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0');
            response.outputStream << bytes
            response.outputStream.flush()
        }catch(Exception e) {
            //deal with your exception here
            e.printStackTrace()
        }
    }
    
}
