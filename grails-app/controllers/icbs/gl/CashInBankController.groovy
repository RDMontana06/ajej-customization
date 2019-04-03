package icbs.gl

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import groovy.sql.Sql
import groovy.json.JsonBuilder


import grails.transaction.Transactional
import icbs.gl.BankRecon
import icbs.admin.UserMaster
import icbs.lov.DepositStatus
import icbs.lov.CheckStatus
import icbs.gl.CashInBankLedger
import icbs.tellering.TxnFile
import icbs.admin.Currency
import icbs.admin.TxnTemplate
import icbs.lov.TxnType
import icbs.gl.GlAccount
import icbs.admin.Branch
import icbs.lov.ConfigItemStatus
import icbs.tellering.TxnBreakdown
import icbs.lov.CheckStatus
import icbs.gl.CashInBankCheckbook
import java.text.DateFormat
import java.text.SimpleDateFormat
import grails.converters.*
import java.lang.*


class CashInBankController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def dataSource
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        if (params.sort == null) {  // default ordering
            params.sort = "branch"
        }

        if (params.query == null) {  // show all instances
            def cashInBankList = CashInBank.createCriteria().list(params) {
                and {
                    eq("branch", UserMaster.get(session.user_id).branch)
                }
            }
            respond cashInBankList, model:[CashInBankInstanceCount: cashInBankList.totalCount]
            // respond CashInBank.list(params), model:[CashInBankInstanceCount: CashInBank.count()]
        }
        else {    // show query results
            def cashInBankList = CashInBank.createCriteria().list(params) {
                and {
                    eq("branch", UserMaster.get(session.user_id).branch)
                }
                or {

                    ilike("bankName", "%${params.query}%")
                    ilike("bankBranch", "%${params.query}%")
                    ilike("acctNo", "%${params.query}%")
                }
            }
            respond cashInBankList, model:[CashInBankInstanceCount: cashInBankList.totalCount]
        }
    }

    def create(){
        respond new CashInBank(params)
    }

    @Transactional
    def save(CashInBank cashInBankInstance){

        if (cashInBankInstance == null) {
            notFound()
            return
        }

        if (cashInBankInstance.hasErrors()) {
            respond cashInBankInstance.errors, view:'create'
            return
        }

        if (!cashInBankInstance.bankName){
            flash.error = 'Bank name cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'create'
            return
        }
        if (!cashInBankInstance.acctNo){
            flash.error = 'Bank name cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'create'
            return
        }
        if (cashInBankInstance.type.id == 3) {
            if (!cashInBankInstance.maturityDate) {
                flash.error = 'Maturity Date cannot be null|error|alert'
                respond cashInBankInstance.errors, view:'create'
                return
            }
            if (cashInBankInstance.maturityDate <= cashInBankInstance.openDate){
                flash.error = 'Maturity Date cannot be less than opening date|error|alert'
                respond cashInBankInstance.errors, view:'create'
                return
            }
        }

        // initialize other values
        cashInBankInstance.user = UserMaster.get(session.user_id)
        cashInBankInstance.status = DepositStatus.get(2)
        cashInBankInstance.balance = 0.00D
        cashInBankInstance.maturityDate = cashInBankInstance.maturityDate


        cashInBankInstance.branch = UserMaster.get(session.user_id).branch
        cashInBankInstance.createDate = cashInBankInstance.branch.runDate

        cashInBankInstance.save flush:true

        // Log
        //def description = 'save Currency ' +  currencyInstance.name
        //auditLogService.insert('040', 'ADM00100', description, 'currency', null, null, null, currencyInstance.id)


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cashInBank.label', default: 'Cash in Bank'), cashInBankInstance.id])
                redirect cashInBankInstance
            }
            '*' { respond cashInBankInstance, [status: CREATED] }
        }

    }

    def show(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cashInBank.label', default: 'Cash in Bank'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def edit(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    @Transactional
    def update(CashInBank cashInBankInstance){
        if (cashInBankInstance == null) {
            notFound()
            return
        }

        if (cashInBankInstance.hasErrors()) {
            respond cashInBankInstance.errors, view:'edit'
            return
        }

        if (!cashInBankInstance.bankName){
            flash.error = 'Bank name cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }
        if (!cashInBankInstance.acctNo){
            flash.error = 'Bank name cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }
        if (cashInBankInstance.type.id == 3) {
            if (!cashInBankInstance.maturityDate) {
                flash.error = 'Maturity Date cannot be null|error|alert'
                respond cashInBankInstance.errors, view:'edit'
                return
            }
            if (cashInBankInstance.maturityDate <= cashInBankInstance.openDate){
                flash.error = 'Maturity Date cannot be less than opening date|error|alert'
                respond cashInBankInstance.errors, view:'edit'
                return
            }
        } else {
            cashInBankInstance.maturityDate = null
        }


        cashInBankInstance.save flush:true

        // Log
        //def description = 'save Currency ' +  currencyInstance.name
        //auditLogService.insert('040', 'ADM00100', description, 'currency', null, null, null, currencyInstance.id)


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cashInBank.label', default: 'Cash in Bank'), cashInBankInstance.id])
                redirect cashInBankInstance
            }
            '*' { respond cashInBankInstance, [status: CREATED] }
        }

    }

    def viewTransactions(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    def checkbookList(CashInBank cashInBankInstance){
       println(cashInBankInstance.list())
       respond cashInBankInstance

    }

    def createCb(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }
    def cashWithdrawal(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }
    def creditAdjustment(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }
    def cibDebit(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }
    def saveCb(CashInBank cashInBankInstance){
        println params
        if (cashInBankInstance == null) {
            notFound()
            return
        }

        if (!params.seriesStart){
            flash.error = 'Series start cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }

        if (!params.seriesEnd){
            flash.error = 'Series end cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }

        def i = params.seriesStart.toInteger()
        def j = params.seriesEnd.toInteger()

        if (j <= i) {
            flash.error = 'Series end cannot be less than/equal to series start|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }

        def chkBookStart = CashInBankCheckbook.findByCheckNo(i)
        def chkBookEnd = CashInBankCheckbook.findByCheckNo(j)

        if (chkBookStart || chkBookEnd) {
            flash.error = 'duplicate series|error|alert'
            respond cashInBankInstance.errors, view:'edit'
            return
        }

        for (int x=i;x<=j;x++) {
            def newCb = new CashInBankCheckbook(cashInBank:cashInBankInstance, checkNo:x,
                createdBy:UserMaster.get(session.user_id), createDate:Branch.get(1).runDate,
                checkStatus:CheckStatus.get(1), checkAmt: 0.00D)
            newCb.save(flush:true, failOnError:true)
            println newCb
        }

        respond cashInBankInstance, view:"checkbookList"
    }

    def chkDetails(CashInBankCheckbook cashInBankCheckbookInstance){
        respond cashInBankCheckbookInstance
    }

    def chkDisburse(CashInBankCheckbook cashInBankCheckbookInstance){
        cashInBankCheckbookInstance.releaseDate = Branch.get(1).runDate
        cashInBankCheckbookInstance.checkStatus = CheckStatus.get(3)
        cashInBankCheckbookInstance.save(flush:true)
        render (view:'chkDetails', model:[cashInBankCheckbookInstance:cashInBankCheckbookInstance])
    }

    def cashAndCheckDeposit(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    def saveDeposit(CashInBank cashInBankInstance){
        println params
        // new txnfile
        def amountCash  = params.cashDeposit.toString().replace(',','').toDouble()
        def amountChk = params.checkDeposit.toString().replace(',','').toDouble()

        def cibId = CashInBank.get(params.cashInBankId.toInteger())
        def b = Branch.get(1)
        def t = TxnTemplate.get(params.txnType.toInteger())
        def tx  = new TxnFile(txnCode:t.code,txnDescription:t.description,txnDate:b.runDate,currency:cibId.currency,
            txnAmt:amountCash+amountChk,txnRef:params.reference,status:ConfigItemStatus.get(2), branch:cibId.branch,
            txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,txnType:t.txnType,txnTemplate:t,
            user:UserMaster.get(session.user_id))
        tx.save(flush:true, failOnError:true);
        def cibLedger = new CashInBankLedger(cashInBank:cibId, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:amountCash+amountChk, creditAmt:0.00D,
            balanceAmt:cibId.balance+amountCash+amountChk, txnFile:tx)
        cibLedger.save(flush:true)

        cibId.balance = cibId.balance + amountCash + amountChk
        cibId.save(flush:true)

        def txnDr = new TxnBreakdown(branch:tx.branch, currency:cibId.currency,debitAcct:cibId.glContra,
            debitAmt:amountCash + amountChk, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnDr.save(flush:true)

        if (amountCash > 0.00D) {
            def cashGl = UserMaster.get(session.user_id).cash.code
            def txnCrCash = new TxnBreakdown(branch:tx.branch, currency:cibId.currency,creditAcct:cashGl,
                creditAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnCrCash.save(flush:true)
        }

        if (amountChk>0.00D) {
            def chkGl = UserMaster.get(session.user_id).coci.code
            def txnCrChk = new TxnBreakdown(branch:tx.branch, currency:cibId.currency,creditAcct:chkGl,
                creditAmt:amountChk, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnCrChk.save(flush:true)
        }

            println('ito na: '+tx)


        cashInBankInstance = cibId
        respond cashInBankInstance.errors, view:'show'
    }
    def savecibDebit(CashInBank cashInBankInstance){
        println params
        // new txnfile
        def amountCash  = params.debitAdjustment.toString().replace(',','').toDouble()

        def cibId = CashInBank.get(params.cibDebit.toInteger())
        def b = Branch.get(1)
        def t = TxnTemplate.get(params.txnType.toInteger())
        def tx  = new TxnFile(txnCode:t.code,txnDescription:t.description,txnDate:b.runDate,currency:cibId.currency,
            txnAmt:amountCash,txnRef:params.reference,status:ConfigItemStatus.get(2), branch:cibId.branch,
            txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,txnType:t.txnType,txnTemplate:t,
            user:UserMaster.get(session.user_id))
        tx.save(flush:true, failOnError:true);
        def cibLedger = new CashInBankLedger(cashInBank:cibId, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:amountCash, creditAmt:0.00D,
            balanceAmt:cibId.balance+amountCash, txnFile:tx)
        cibLedger.save(flush:true)
        println ('Debit')
        cibId.balance = cibId.balance + amountCash
        cibId.save(flush:true)

        def txnDr = new TxnBreakdown(branch:tx.branch, currency:cibId.currency,debitAcct:cibId.glContra,
            debitAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnDr.save(flush:true)

        if (amountCash > 0.00D) {
            def cashGl = UserMaster.get(session.user_id).cash.code
            def txnCrCash = new TxnBreakdown(branch:tx.branch, currency:cibId.currency,creditAcct:t.defContraAcct,
                creditAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnCrCash.save(flush:true)
        }
            println('ito na: '+tx)


        cashInBankInstance = cibId
        respond cashInBankInstance.errors, view:'show'
    }
    def saveWithdrawal(CashInBank cashInBankInstance){
        println params
        // new txnfile
        def amountCash  = params.cashWithdrawal.toString().replace(',','').toDouble()
        def cashInBankIDID = CashInBank.get(params.cashInBankId.toInteger())
        if (amountCash > cashInBankIDID.balance)
        {
            flash.message = "Invalid Withdrawal Amount|error|alert"
            render(view:'/cashInBank/cashWithdrawal', model: [cashInBankInstance:cashInBankIDID])
            return
        }

        def b = Branch.get(1)
        def t = TxnTemplate.get(params.txnType.toInteger())
        def tx  = new TxnFile(txnCode:t.code,txnDescription:t.description,txnDate:b.runDate,currency:cashInBankIDID.currency,
            txnAmt:amountCash,txnRef:params.reference,status:ConfigItemStatus.get(2), branch:cashInBankIDID.branch,
            txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,txnType:t.txnType,txnTemplate:t,
            user:UserMaster.get(session.user_id))

            tx.save(flush:true, failOnError:true);

        def cibLedger = new CashInBankLedger(cashInBank:cashInBankIDID, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:0.00D, creditAmt:amountCash,
            balanceAmt:cashInBankIDID.balance-amountCash, txnFile:tx)
        cibLedger.save(flush:true)

        cashInBankIDID.balance = cashInBankIDID.balance - amountCash
        cashInBankIDID.save(flush:true)

        def txnDr = new TxnBreakdown(branch:tx.branch, currency:cashInBankIDID.currency,creditAcct:cashInBankIDID.glContra,
            creditAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
        txnDr.save(flush:true)

        if (amountCash > 0.00D) {
            def cashGl = UserMaster.get(session.user_id).cash.code
            def txnCrCash = new TxnBreakdown(branch:tx.branch, currency:cashInBankIDID.currency,debitAcct:cashGl,
                debitAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
            txnCrCash.save(flush:true)
        }
        cashInBankInstance = cashInBankIDID
        respond cashInBankInstance.errors, view:'show'
    }
    def savecreditAdjustment(CashInBank cashInBankInstance){
        println params
        // new txnfile
        def amountCash  = params.creditAmt.toString().replace(',','').toDouble()

        def cashInBankIDID = CashInBank.get(params.creditAdjustmentId.toInteger())
        if (amountCash > cashInBankIDID.balance)
        {
            flash.message = "Invalid Withdrawal Amount|error|alert"
            render(view:'/cashInBank/cashWithdrawal', model: [cashInBankInstance:cashInBankIDID])
            return
        }

        def b = Branch.get(1)
        def t = TxnTemplate.get(params.txnType.toInteger())
        def tx  = new TxnFile(txnCode:t.code,txnDescription:t.description,txnDate:b.runDate,currency:cashInBankIDID.currency,
            txnAmt:amountCash,txnRef:params.reference,status:ConfigItemStatus.get(2), branch:cashInBankIDID.branch,
            txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,txnType:t.txnType,txnTemplate:t,
            user:UserMaster.get(session.user_id))

            tx.save(flush:true, failOnError:true);

        def cibLedger = new CashInBankLedger(cashInBank:cashInBankIDID, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:0.00D, creditAmt:amountCash,
            balanceAmt:cashInBankIDID.balance-amountCash, txnFile:tx)
        cibLedger.save(flush:true)

        cashInBankIDID.balance = cashInBankIDID.balance - amountCash
        cashInBankIDID.save(flush:true)

        def txnDr = new TxnBreakdown(branch:tx.branch, currency:cashInBankIDID.currency, txnCode:t.code, txnDate:b.runDate, debitAcct:t.defContraAcct,
                debitAmt:amountCash,txnFile:tx, user:UserMaster.get(session.user_id))
        txnDr.save(flush:true)

        if (amountCash > 0.00D) {
            def cashGl = UserMaster.get(session.user_id).cash.code
            def txnCrCash = new TxnBreakdown(branch:tx.branch, currency:cashInBankIDID.currency,creditAcct:cashInBankIDID.glContra,
            creditAmt:amountCash, txnCode:t.code, txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
            txnCrCash.save(flush:true)
        }
        cashInBankInstance = cashInBankIDID
        respond cashInBankInstance.errors, view:'show'
    }
    def cibClose(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    def saveCibClose(CashInBank cashInBankInstance){
        if (cashInBankInstance.balance != 0.00D){
            flash.message = "Account Balance not zero|error|alert"
            render(view:'/cashInBank/cibClose', model: [cashInBankInstance:cashInBankIDID])
            return
        }
        if (cashInBankInstance.status.id == 7){
            flash.message = "Account alredy closed|error|alert"
            render(view:'/cashInBank/cibClose', model: [cashInBankInstance:cashInBankIDID])
            return
        }

        cashInBankInstance.status = DepositStatus.get(7)
        cashInBankInstance.save(flush:true, failOnError:true)

        respond cashInBankInstance, view:'show'
    }
    def createCheckTransaction(CashInBank cashInBankInstance){
        respond cashInBankInstance
    }

    @Transactional
 def saveChkTransaction(CashInBank cashInBankInstance){
        println('pumasok')
        if (cashInBankInstance == null) {
            notFound()
            return
        }

        if (cashInBankInstance.hasErrors()) {
            respond cashInBankInstance.errors, view:'create'
            return
        }

        if (!params.checkNo){
            flash.error = 'Check No cannot be null|error|alert'
            respond cashInBankInstance.errors, view:'create'
            return
        }
        // initialize other values
        println ('params: '+ params)
        println("")


        def cashInBankCheckTransacInstance  = CashInBankCheckbook.findByCashInBankAndCheckNo(CashInBank.get(params.cashInBankInstanceChkT) ,params.checkNo.toInteger())

        def cashInBankChk = CashInBank.get(params.cashInBankInstanceChkT)
        //if there is a existing checkbook number
        if(!cashInBankCheckTransacInstance){
            println("lololool")
            flash.message = "Invalid Status of Cheque |error|alert"
            render(view:'/cashInBank/createCheckTransaction', model: [cashInBankInstance:cashInBankChk])
            return
        }else{
            if(cashInBankCheckTransacInstance.checkStatus.id == 3 || cashInBankCheckTransacInstance.checkStatus.id == 4 || cashInBankCheckTransacInstance.checkStatus.id == 5){
                println("qwerty")
                flash.message = "Invalid Status of Cheque |error|alert"
                render(view:'/cashInBank/createCheckTransaction', model: [cashInBankInstance:cashInBankChk])
                return
            }else{
                println '--------------------------------------------------------------------'
                println("cashInBankCheckTransacInstanceeeee: "+ cashInBankCheckTransacInstance)
                println params
                def checkBookTransac = CashInBankCheckbook.findByCashInBankAndCheckNo(CashInBank.get(params.cashInBankInstanceChkT) ,params.checkNo.toInteger())
                def cDate = dateconvert(params.checkDate + " 00:00:00")
                def test = Date.parse("yyyy-MM-dd",cDate)
                //cashInBankCheckTransacInstance.checkNo = params.checkNo.toString().replace(',','').toDouble()

                checkBookTransac.reference = params.reference
                checkBookTransac.checkVoucherNo = params.checkVoucherNo
                checkBookTransac.checkDate = test
                checkBookTransac.payee = params.payee
                checkBookTransac.particulars = params.particulars
                checkBookTransac.checkAmt = params.checkAmt.toString().replace(',','').toDouble()
                checkBookTransac.checkStatus = CheckStatus.get(2)
                checkBookTransac.issuedBy = UserMaster.get(session.user_id)
                checkBookTransac.cashInBank = CashInBank.get(params.cashInBankInstanceChkT)

                checkBookTransac.save(flush:true)
                //println('cashInBankCheckTransacInstance: '+ cashInBankCheckTransacInstance)

                def amountChk  = params.checkAmt.toString().replace(',','').toDouble()

                if (amountChk > cashInBankChk.balance)
                {
                    flash.message = "Invalid Withdrawal Amount|error|alert"
                    render(view:'/cashInBank/createCheckTransaction', model: [cashInBankInstance:cashInBankChk])
                    return
                }else{

                def b = Branch.get(1)
                def t = TxnTemplate.get(params.txnType.toInteger())
                def tx  = new TxnFile(txnCode:t.code,txnDescription:t.description,txnDate:b.runDate,currency:cashInBankChk.currency,
                    txnAmt:amountChk,txnRef:params.reference,status:ConfigItemStatus.get(2), branch:cashInBankChk.branch,
                    txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,txnType:t.txnType,txnTemplate:t,
                    user:UserMaster.get(session.user_id))

                tx.save(flush:true, failOnError:true);

                def txnDr = new TxnBreakdown(branch:tx.branch, currency:cashInBankChk.currency, txnCode:tx.txnCode, txnDate:b.runDate,
                    debitAcct:t.defContraAcct, debitAmt:amountChk,txnFile:tx, user:UserMaster.get(session.user_id))
                txnDr.save(flush:true)
                def txnCr = new TxnBreakdown(branch:tx.branch, currency:cashInBankChk.currency,
                    creditAcct:checkBookTransac.cashInBank.glContra, creditAmt:amountChk, txnCode:tx.txnCode,
                    txnDate:b.runDate, txnFile:tx, user:UserMaster.get(session.user_id))
                txnCr.save(flush:true)


                def cibLedger = new CashInBankLedger(cashInBank:cashInBankChk, txnDate:b.runDate, valueDate:b.runDate,
                    reference:params.reference, particulars:params.particulars, debitAmt:0.00D, creditAmt:amountChk,
                    balanceAmt:cashInBankChk.balance-amountChk, txnFile:tx, checkbook:checkBookTransac)
                cibLedger.save(flush:true)

                cashInBankChk.balance = cashInBankChk.balance - amountChk
                cashInBankChk.save(flush:true)
                checkBookTransac.txnFile = tx
                checkBookTransac.save(flush:true)

                println("cashInBankChk : " + cashInBankChk)
                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.created.message', args: [message(code: 'cashInBank.label', default: 'Cash in Bank'), cashInBankInstance.id])
                        println('aasa pa')

                        render(view:"checkbookList", model:[cashInBankInstance:cashInBankInstance])
                    }
                   '*' { respond view:'checkbookList',[status: CREATED] }
                }
                }

            }

        }
    }
    public def dateconvert(String xxdate){

                def functiondate
                DateFormat yinputDF  = new SimpleDateFormat("MM/dd/yy HH:mm:ss");
                Date dat3 = yinputDF.parse(xxdate)
                Calendar ynow = Calendar.getInstance();
                ynow.setTime(dat3);
                int years = ynow.get(Calendar.YEAR);
                int months = ynow.get(Calendar.MONTH) + 1; // Note: zero based!
                int days = ynow.get(Calendar.DAY_OF_MONTH);

               // functiontime = years + "-"+ months +"-"+days + " " + hours +":"+ minutes + ":00";
                functiondate = years + "-"+ months +"-"+ days
                return functiondate

    }

    def bankRecon() {
        def bankReconInstance = params.id
        render (view:'bankRecon',model:[bankReconInstance:bankReconInstance])
    }

    def showCashInBank(){

        def json = request.JSON
        def sql = new Sql(dataSource)

        println "jason amount" + json.amount
        println "JSON startDATe " + json.startDate
        println "JSON endDate " + json.endDate
        println "JSON beg bal " + json.begBal
        println "JSON end bal " + json.endBal

        def cashBankIn = "select a.id,a.debit_amt,a.credit_amt,a.txn_date,a.reference,a.balance_amt from cash_in_bank_ledger a inner join cash_in_bank b"
            cashBankIn += " on a.cash_in_bank_id = b.id where TRIM(b.acct_no) = '"+json.accountNumber+"' AND "
            cashBankIn += " (txn_date::date BETWEEN '"+json.startDate+"' AND '"+json.endDate+"')" + ' AND '
            cashBankIn += "a.bankrecon_id is null order by a.txn_date,a.id"

        def sqlExec = sql.rows(cashBankIn)
        println sqlExec
        render sqlExec as JSON

    }

    def saveBankRecon(){
        try{
        def json = request.JSON

        println "json.accountNumber " + json.accountNumber
        println "dateconvert(json.startDate) " + dateconvert(json.startDate + " 00:00:00")
        println "dateconvert(json.endDate) " + dateconvert(json.endDate + " 00:00:00")
        println "json.begBal " + json.begBal
        println "json.endBal " + json.endBal

        def saveRecon = new BankRecon()
        saveRecon.bankAccount = json.accountNumber
        saveRecon.startDate = Date.parse("yyyy-MM-dd HH:mm:ss", dateconvert(json.startDate + " 00:00:00") + " 00:00:00")
        saveRecon.endDate = Date.parse("yyyy-MM-dd HH:mm:ss", dateconvert(json.endDate+ " 00:00:00") + " 00:00:00")
        saveRecon.beginningBalance = Double.parseDouble(json.begBal.toString())
        saveRecon.endBalance = Double.parseDouble(json.endBal.toString())
        saveRecon.adjBalance = Double.parseDouble(json.adjBal.toString())
        saveRecon.save()
        
        //update cashInbankLedger if already check
        println "this is json.cbid"+  json.cibid
        println saveRecon
        def cibid = json.cibid 
        def xid =  cibid.split('@@')
        Boolean x = true

        for(int i = 0  ;  i < xid.length ; i ++){
        println xid[i]
        def updateCashInBank = CashInBankLedger.get(xid[i].toInteger())
        
        updateCashInBank.isBankrecon = x
        updateCashInBank.bankrecon = saveRecon
        updateCashInBank.save(flush:true,failOnError:true)
        println updateCashInBank
        }

        
        render ('True') as JSON
        }catch(ex){
           println "ERROR : " + ex
           render ('False') as JSON
        }


    }
    
    def fundTransfer(){
        // show view
    }
    
    def saveFundTransfer(){
        println params
        // validations
        if (params.drBank == params.crBank){
            flash.message = "Cannot transfer to same Cash in Bank record |error|alert"
            render(view:'/cashInBank/fundTransfer')
            return              
        }
        def cibIdSource = CashInBank.get(params.drBank.toInteger())
        def cibIdDest = CashInBank.get(params.crBank.toInteger()) 
        def amount  = params.debitAdjustment.toString().replace(',','').toDouble()
        
        if (amount > cibIdSource.balance) {
            flash.message = "Insufficient Funds in source account |error|alert"
            render(view:'/cashInBank/fundTransfer')
            return                 
        }
        
        // start updating
        def b = Branch.get(1)
        
        // source
        def tSource = TxnTemplate.get(params.drTxnType.toInteger())
        
        def txSource  = new TxnFile(txnCode:tSource.code,txnDescription:tSource.description,txnDate:b.runDate,
            currency:cibIdSource.currency,txnAmt:amount,txnRef:params.reference,status:ConfigItemStatus.get(2), 
            branch:cibIdSource.branch, txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,
            txnType:tSource.txnType,txnTemplate:tSource, user:UserMaster.get(session.user_id))
        txSource.save(flush:true, failOnError:true);
        
        def cibLedgerSource = new CashInBankLedger(cashInBank:cibIdSource, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:0.00D, creditAmt:amount,
            balanceAmt:cibIdSource.balance - amount, txnFile:txSource)
        cibLedgerSource.save(flush:true);
        
        cibIdSource.balance = cibIdSource.balance - Amount 
        cibIdSource.save(flush:true)
        
        def txnSourceDr = new TxnBreakdown(branch:txSource.branch, currency:cibIdSource.currency,
            debitAcct:tSource.defContraAcct, debitAmt:amount, txnCode:tSource.code, txnDate:b.runDate, 
            txnFile:txSource, user:UserMaster.get(session.user_id))
        txnSourceDr.save(flush:true)
        def txnSourceCr = new TxnBreakdown(branch:txSource.branch, currency:cibIdSource.currency,
            creditAcct:cibIdSource.glContra, creditAmt:amount, txnCode:tSource.code, txnDate:b.runDate, 
            txnFile:txSource, user:UserMaster.get(session.user_id))      
        txnSourceCr.save(flush:true)           
        
        // destination
        def tDest = TxnTemplate.get(params.crTxnType.toInteger())
        def txDest  = new TxnFile(txnCode:tDest.code,txnDescription:tDest.description,txnDate:b.runDate,
            currency:cibIdDest.currency,txnAmt:amount,txnRef:params.reference,status:ConfigItemStatus.get(2), 
            branch:cibIdDest.branch,txnTimestamp: new Date().toTimestamp(),txnParticulars:params.particulars,
            txnType:tDest.txnType,txnTemplate:tDest,user:UserMaster.get(session.user_id))
        txDest.save(flush:true, failOnError:true);  
        
        def cibLedgerDest = new CashInBankLedger(cashInBank:cibIdDest, txnDate:b.runDate, valueDate:b.runDate,
            reference:params.reference, particulars:params.particulars, debitAmt:amount, creditAmt:0.00D,
            balanceAmt:cashInBankIDID.balance + amount, txnFile:txDest)
        cibLedgerDest.save(flush:true)
        
        cibIdDest.balance = cibIdDest.balance + amount 
        cibIdDest.save(flush:true)
        
        def txnDrDest = new TxnBreakdown(branch:txDest.branch, currency:cibIdDest.currency, txnCode:tDest.code, 
            txnDate:b.runDate, debitAcct:cibIdDest.glContra,debitAmt:amount,txnFile:txDest, 
            user:UserMaster.get(session.user_id))
        txnDrDest.save(flush:true)
        
        def txnCrDest = new TxnBreakdown(branch:txDest.branch, currency:cibIdDest.currency,creditAcct:tDest.defContraAcct,
            creditAmt:amount, txnCode:tDest.code, txnDate:b.runDate, txnFile:txDest, 
            user:UserMaster.get(session.user_id))      
        txnCrDest.save(flush:true)

        // response
        render(view: "saveFundTransfer", model: [txSource: txSource, txDest:txDest])
    }

}
