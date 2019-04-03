package icbs.edi
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import icbs.cif.Customer
import icbs.cif.Employment
import icbs.deposit.Deposit
import icbs.loans.Loan
import icbs.loans.DepEdRemittance
import icbs.loans.DepEdLoanRemDet
import icbs.lov.CustomerStatus
import icbs.loans.DepEdLoanCollection
import icbs.admin.Branch
import icbs.admin.Currency
import icbs.admin.UserMaster
import icbs.gl.GlBatchHdr
import icbs.gl.GlBatch
import icbs.lov.GlBatchHdrStatus

class ExportController {

    def index() { }


    def cif() {
    	def customers = Customer.list()

    	response.setHeader("Content-disposition", "attachment; filename=\"Customer Information.csv\"")
    	response.contentType = "text/csv"

    	def outs = response.outputStream

    	outs << "Customer Name, Customer ID, Customer Type, Branch, Birth Date, Gender, Civil Status, Birth Place, Taxable?," +
            "Credit Limit, Resident Type, Risk Type, Firm Size, Nationality, Dosri Code, SSS No., GSIS No., TIN No., Passport No.," +
            "Address Type, Address, Postal Code, Phone 1, Phone 2, Fax 1, Fax2, Contact Type, Contact\n"

       	customers.each() { customer ->
       		customer.contacts.each() { contact ->
       			customer.addresses.each() { address ->
       				outs << "\"" +
	       				customer.displayName + "\",\"" +
                        customer.customerId + "\",\"" +
	       				customer.type.description + "\",\"" +
		            	customer.branch.name + "\",\"" +
		            	customer.birthDate + "\",\"" +
		            	customer.gender.description + "\",\"" +
		            	customer.civilStatus.itemValue + "\",\"" +
		            	customer.birthPlace + "\",\"" +
		            	customer.isTaxable + "\",\"" +
		            	customer.creditLimit + "\",\"" +
                        customer.customerCode1.description + "\",\"" +
                        customer.customerCode2.description + "\",\"" +
                        customer.customerCode3.description + "\",\"" +
                        customer.nationality.itemValue + "\",\"" +
                        customer.dosriCode.description + "\",\"" +
                        customer.sssNo + "\",\"" +
                        customer.gisNo + "\",\"" +
                        customer.tinNo + "\",\"" +
                        customer.passportNo + "\",\"" +
		            	address.type.description + "\",\"" +
		            	address.address1 + " " + address.address2 + " " + address.address3 + "\",\"" +
                        address.postalCode + "\",\"" +
                        address.phone1 + "\",\"" +
                        address.phone2 + "\",\"" +
                        address.phone3 + "\",\"" +
                        address.phone4 + "\",\"" +
	            		contact.type.itemValue + "\",\"" +
	            		contact.contactValue + "\""
            		outs << "\n"
       			}
            }
       	}
    	outs.flush()
    	outs.close()
        println("Putang Inang Pokwang, Betty La Booba and ArnArn")
    }

    def deposit() {
    	def deposits = Deposit.list()

	response.setHeader("Content-disposition", "attachment; filename=\"Deposits.csv\"")
    	response.contentType = "text/csv"

    	def outs = response.outputStream

    	outs << "Customer Name, Customer ID, Account Number, Account Name, Branch, Type, Product, Ownership Type," +
            "Deposit Interest Scheme, Deposit Tax Charge Scheme, Fixed Deposit Pre Term Scheme, Date Opened, Date Closed," +
            "Maturity Date, Interest Rate\n"

    	deposits.each() { deposit ->
    		outs << "\"" +
    			deposit.customer.displayName + "\",\"" +
                deposit.customer.customerId + "\",\"" +
    			deposit.acctNo + "\",\"" +
    			deposit.acctName + "\",\"" +
    			deposit.branch.name + "\",\"" +
    			deposit.type.description + "\",\"" +
    			deposit.product.name + "\",\"" +
    			deposit.ownershipType.description + "\",\"" +
                deposit.depositInterestScheme + "\",\"" +
                deposit.depositTaxChargeScheme + "\",\"" +
                deposit.fixedDepositPreTermScheme + "\",\"" +
                deposit.dateOpened + "\",\"" +
                deposit.dateClosed + "\",\"" +
                deposit.currentRollover.endDate + "\",\"" +
                deposit.interestRate + "\""
    		outs << "\n"
    	}
        outs.flush()
        outs.close()
    }

    def loanAccount() {
        def loanAccounts = Loan.list()

        response.setHeader("Content-disposition", "attachment; filename=\"Loan Accounts.csv\"")
        response.contentType = "text/csv"

        def outs = response.outputStream

        outs << "Customer Name, Customer ID, Account No., Ownership Type, Branch, Product, Currency," +
            "Interest Income Scheme, Current Penalty Scheme, Past Due Penalty Scheme, Granted Amount, Interest Rate," +
            "Application Date, Opening Date, Maturity Date\n"

        loanAccounts.each() { loan ->
            outs << "\"" +
                loan.customer.displayName + "\",\"" +
                loan.customer.customerId + "\",\"" +
                loan.accountNo + "\",\"" +
                loan.ownershipType.description + "\",\"" +
                loan.branch.name + "\",\"" +
                loan.product.name + "\",\"" +
                loan.currency.name + "\",\"" +
                loan.interestIncomeScheme.name + "\",\"" +
                loan.currentPenaltyScheme.name + "\",\"" +
                loan.pastDuePenaltyScheme.name + "\",\"" +
                loan.grantedAmount + "\",\"" +
                loan.interestRate + "\",\"" +
                loan.applicationDate + "\",\"" +
                loan.openingDate + "\",\"" +
                loan.maturityDate + "\",\""
            outs << "\n"
        }

        outs.flush()
        outs.close()
    }

    def glTrialBalance() {

    }

    def glTransaction() {

    }

    def depEdCollectionProcessing(){
        // display GSP
    }
    def loanCollectionProcessing(){
        // display GSP
    }
    def processDepEd() {
        println params
        Double amtDue
        Double amtDueFull
        Double totDedLn
        Double amtLeft
        String sa
        // should replace prList from Institution
        String prList = '002-600,002-088,002-089,002-095,003-088,003-089,003-095,004-088,004-089,004-095'
        if(params.checkClearing){
            def f = request.getFile('checkClearing')
            if (f.empty) {
                flash.message = 'file cannot be empty'
                render(view:"depEdCollectionProcessing")
                return
            }else{
                def batchSerial = new Date().toTimestamp().toString()
                Double prinDue = 0.00D
                Double intDue = 0.00D
                Double penDue = 0.00D
                Double balDue = 0.00D
                //parse
                BufferedReader reader = new BufferedReader(new InputStreamReader(f.getInputStream(), "UTF-8"));
                def lineCount = -1
                try {
                    for (String line = reader.readLine(); line != null; line = reader.readLine()) {
                        ++lineCount
                        println lineCount
                        if (lineCount==0){
                            continue
                        }
                        String[] fields = line.split(',');
                        def depEdRem = new DepEdRemittance(batchSerial:batchSerial, regNo:fields[0], divCode:fields[1], staCode:fields[2] ,
                            empCode:fields[3], fnPre:fields[4], fName:fields[5], lName:fields[6], midName:fields[7], appel:fields[8], dedCode:fields[9], 
                            DedIdNo:fields[10], effYear:fields[11], effMm:fields[12], terYy:fields[13], terMm:fields[14], 
                            dedAmt:fields[15].toDouble(), policyNo:fields[16], agent:fields[17], principal:fields[18].toDouble(), 
                            interest:fields[19].toDouble(), charges:fields[20].toDouble(),proceeds:fields[21].toDouble(), agency:fields[22], 
                            downDate:fields[23], payrDate:fields[24])

                        def customer = Customer.createCriteria().list(){
                            and{
                                eq("status",CustomerStatus.get(2))
                                employments{
                                    and{
                                        eq("employmentId",fields[3])
                                    }
                                }
                            }
                        }
                        if (customer) {
                            for (c in customer) {
                                depEdRem.customer = c
                            }
                        }
                        //depEdRem.customer = Employment.findAllByEmploymentId(fields[3]).customer
                        depEdRem.dedAmt =  depEdRem.dedAmt.div(100)
                        depEdRem.save(flush:true)

                        // aggregate the totals
                        if (depEdRem.customer) {
                            println batchSerial
                            println depEdRem.customer
                            def totDepEd = DepEdLoanRemDet.findByBatchSerialAndCustomer(batchSerial,depEdRem.customer)
                            //def totDepEd = DepEdLoanRemDet.findByBatchSerial(batchSerial)
                            println totDepEd
                            if (totDepEd) {
                                totDepEd.remAmount += depEdRem.dedAmt
                                totDepEd.save(flush:true)
                                println "------> EXISTING"
                            } else {
                                println "------> NEW"

                                def newDepEdTot = new DepEdLoanRemDet(customer:depEdRem.customer, batchSerial:batchSerial, 
                                    remAmount:depEdRem.dedAmt)
                                newDepEdTot.save(flush:true, validateOnError:true)
                                println batchSerial+'>>>'
                                println newDepEdTot.batchSerial+'>>>'
                            }
                        } else {
                            // deped employee id not found 
                        }
                    }
                    // distribute to loans
                    def totDepEd = DepEdLoanRemDet.findAllByBatchSerial(batchSerial)
                    def oldestLoan
                    for (tot in totDepEd) {
                        def loanList = Loan.createCriteria().list() {
                            and {
                                    eq("customer", tot.customer)
                                    gt("balanceAmount", 0.00D)
                                }
                            order("openingDate", "desc")    
                        }         
                        amtLeft = tot.remAmount
                        oldestLoan = null
                        for (l in loanList) {
                                println l.accountNo.substring(0,6)
                                println l.accountNo
                                println("Only defined products")
                            // check branch and product
                            if (l.product.code == 600) {
                                // do nonthing
                            } else if (l.product.code == 92 || l.product.code == 73 || l.product.code == 83 ) {  
                                // do not include this product
                                println l.accountNo.substring(0,6)
                                println l.accountNo
                                println("Do not include this product codes")
                                continue;
                            } else if (prList.indexOf(l.accountNo.substring(0, 6)) > 0)  {
                                // do nothing
                                println l.accountNo.substring(0,6)
                                println l.accountNo
                                println("Defined products only")
                            } else {
                                // move to next record
                                continue;
                            }
                            prinDue = 0.00
                            intDue = 0.00
                            penDue = 0.00
                            balDue = 0.00
                            if (l.overduePrincipalBalance) {
                                prinDue = l.overduePrincipalBalance
                            }
                            if (l.interestBalanceAmount) {
                                intDue = l.interestBalanceAmount
                            }
                            if (l.penaltyBalanceAmount) {
                                penDue = l.penaltyBalanceAmount
                            }
                            if (l.balanceAmount) {
                                balDue = l.balanceAmount
                            }
                            amtDue = prinDue + intDue + penDue
                            amtDueFull = 0.00
                            if ((amtLeft > 0) && (amtDue > 0)) {
                                //if (amtLeft > amtDue) {
                                    // amount greater than full loan
                                    //if (amtLeft > amtDueFull) {
                                    //    amtDue = amtDueFull
                                    //}
                                    // amount greater than due  but less than full amount
                                    //if (amtLeft >= amtDue) {
                                    //    amtDue = amtLeft
                                    //}
                                //}
                                // amount less than amount due
                                if (amtLeft < amtDue) {
                                    amtDue = amtLeft
                                }    
                                def x = new DepEdLoanCollection(depEdLoanRemDet:tot, loan:l, branch:l.branch, 
                                    customer:tot.customer,paymentAmt:amtDue, batchSerial:batchSerial)
                                x.save(flush:true, validateOnError:true)                  
                                amtLeft = amtLeft - amtDue
                            }
                            oldestLoan = l
                        }
                        if (oldestLoan) {
                            if (amtLeft > 0) {
                                   if (oldestLoan.balanceAmount > amtLeft) {
                                       amtDue = amtLeft
                                       amtLeft = 0
                                   } else {
                                       amtDue = oldestLoan.balanceAmount
                                       amtLeft = amtLeft - amtDue
                                   }
                                   def x = new DepEdLoanCollection(depEdLoanRemDet:tot, loan:oldestLoan, branch:oldestLoan.branch, 
                                    customer:tot.customer,paymentAmt:amtDue, batchSerial:batchSerial)
                                    x.save(flush:true, validateOnError:true)                                               
                            }
                        } 
                        if (amtLeft > 0) {
                            // credit to savings
                            //def emps = tot.customer.listAllEmployment()
                            sa = null
                            for (em in tot.customer.employments) {
                                sa = em.debitAccount
                            }
                            def depSa = Deposit.findByAcctNo(sa)
                            if (depSa) {
                                def x = new DepEdLoanCollection(depEdLoanRemDet:tot, deposit:depSa, branch:depSa.branch, 
                                    customer:tot.customer,paymentAmt:amtLeft, batchSerial:batchSerial)
                                x.save(flush:true, validateOnError:true)                                    
                            } else {
                                // no deposit so this is AP
                                def x = new DepEdLoanCollection(depEdLoanRemDet:tot, branch:tot.customer.branch, 
                                    customer:tot.customer,paymentAmt:amtLeft, batchSerial:batchSerial)
                                x.save(flush:true, validateOnError:true)                                    
                                
                            }
                        }
                    }
                    //println "count!"+ cmd.count

                } finally {
                  reader.close();
                }  
                //cmd.validate()
                // create batch for each branch
                def gHdr
                def gLine
                def nLine
                def totCr
                def bl = Branch.list()
                for (b in bl) {
                    def depEdBatch = DepEdLoanCollection.findAllByBatchSerialAndBranch(batchSerial, b)
                    if (depEdBatch) {
                        // create new batch header
                        gHdr = new GlBatchHdr(batchId: batchSerial+b.id,
                            batchName:'DEPED-'+b.name+'-'+b.runDate.toString(), batchCurrency:Currency.get(1),
                            branch:b, batchType:'1',totalDebit:0.00D, totalCredit:0.00D, isLocked:false,
                            isBalanced:false, txnDate:b.runDate,  valueDate:b.runDate, status:GlBatchHdrStatus.get(1))
                        gHdr.save(flush:true,validateOnError:true)
                        // create batch details
                        nLine = 0
                        totCr = 0
                        for (db in depEdBatch) {
                            if (db.loan) {
                                // create loan batch
                                nLine++
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'5', recordDate:b.runDate,
                                    amount:db.paymentAmt, particulars:'Dep Ed Collection-'+db.customer.displayName, 
                                    currency:Currency.get(1), creditAccount:db.loan.accountNo,
                                    credit:db.paymentAmt, account:db.loan.accountNo, reference:'DepEd-'+batchSerial, 
                                    accountName: db.customer.displayName, lineNo:nLine.toString())
                                gLine.save(flush:true,validateOnError:true)
                                totCr += db.paymentAmt                                
                            } else if (db.deposit) {
                                // credit deposit line
                                nLine++
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'2', recordDate:b.runDate,
                                    amount:db.paymentAmt, particulars:'Dep Ed Collection-'+db.customer.displayName, 
                                    currency:Currency.get(1), creditAccount:db.deposit.acctNo,
                                    credit:db.paymentAmt, account:db.deposit.acctNo, reference:'DepEd-'+batchSerial, 
                                    accountName: db.customer.displayName, lineNo:nLine.toString())
                                gLine.save(flush:true,validateOnError:true)
                                totCr += db.paymentAmt                                
                            } else {
                                // credit AP line
                                nLine++
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'8', recordDate:b.runDate,
                                    amount:db.paymentAmt, particulars:'Dep Ed Collection-'+db.customer.displayName+' A/P', 
                                    currency:Currency.get(1), creditAccount:'2-30-06-01-00-00-00-00-07',
                                    credit:db.paymentAmt, account:'2-30-06-01-00-00-00-00-07', reference:'DepEd-'+batchSerial, 
                                    accountName: 'ACCOUNTS PAYABLE - DEPED', lineNo:nLine.toString())
                                gLine.save(flush:true,validateOnError:true)
                                totCr += db.paymentAmt                                
                            }

                        }
                        // total credit
                        gHdr.totalCredit = totCr
                        gHdr.save(flush:true,validateOnError:true)
                    }
                }

                flash.message = 'Deped Upload Completed!'
                render(view:"depEdCollectionProcessing")
                println("Nag sulod na diri")
                return
            }
        }
        render(view:"depEdCollectionProcessing")
    }
    def processLoanColl(){
        if(params.checkClearing){
            def f = request.getFile('checkClearing')
            if (f.empty) {
                flash.message = 'file cannot be empty'
                render(view:"loanCollectionProcessing")
                return
            } else {
                def batchSerial = new Date().toTimestamp().toString()
                def batchLn
                def txnAmt
                def txnType
                def batchPrin
                def batchInt
                def batchPen
                def batchRef
                def loan
                def apAmt

                // gl batch related
                def gHdr
                def gLine
                def nLine
                def totCr
                // new batch header
                gHdr = new GlBatchHdr(batchId: batchSerial+Branch.get(1).id,
                            batchName:'LOAN COLLECTION - '+Branch.get(1).runDate.toString(), batchCurrency:Currency.get(1),
                            branch:Branch.get(1), batchType:'1',totalDebit:0.00D, totalCredit:0.00D, isLocked:false,
                            isBalanced:false, txnDate:Branch.get(1).runDate,  valueDate:Branch.get(1).runDate,
                            status:GlBatchHdrStatus.get(1), createdBy:UserMaster.get(session.user_id))
                gHdr.save(flush:true,validateOnError:true)
                nLine = 0
                totCr = 0

                //parse
                BufferedReader reader = new BufferedReader(new InputStreamReader(f.getInputStream(), "UTF-8"));
                def lineCount = -1
                try {
                    for (String line = reader.readLine(); line != null; line = reader.readLine()) {
                        ++lineCount
                        println lineCount
                        if (lineCount==0){
                            continue
                        }                        
                        String[] fields = line.split(',');
                        batchLn = fields[0] // BBB-PPP-SSSSS-D format
                        txnType = fields[1].toInteger()
                        txnAmt = fields[2].toDouble()
                        batchPrin = fields[3].toDouble() //no decimal format without comma, if none should be 000
                        batchInt = fields[4].toDouble() //no decimal format without comma, if none should be 000
                        batchPen = fields[5].toDouble() // no decimal format without comma, if none should be 000
                        batchRef = fields[6]
                        if (txnAmt > 0) {
                            txnAmt = txnAmt.div(100)
                        }
                        if (batchPrin > 0) {
                            batchPrin = batchPrin.div(100)
                        }
                        if (batchInt > 0) {
                            batchInt = batchInt.div(100)
                        }
                        if (batchPen > 0) {
                            batchPen = batchPen.div(100)
                        }


                        println 'field check ********'
                        println fields[0]
                        println fields[1]
                        println fields[2]
                        println fields[3]
                        println fields[4]
                        println fields[5]
                        println fields[6]
                        println '********************'
                        // get loan account
                        loan = Loan.findByAccountNo(batchLn)
                        if (loan) {
                            // after loan has been validated check amount due in case of overpayment
                            // to be fixed
//                            def prevln = GlBatch.findAllByBatchIdAndCreditAccount(gHdr.batchId,loan.accountNo)                            
//                            def pays
//                            pays = txnAmt
//                            for (pl in prevln){
//                                pl.amount += pays
//                                pl.credit += pays
//                                pl.save(flush:true,validateOnError:true)
//                                totCr += pays
//                                println ("------> EXISTING " + pl.account)
//                            }
                            
                            apAmt = 0.00D
                            if (txnAmt >= (loan.balanceAmount + loan.interestBalanceAmount + loan.penaltyBalanceAmount)) {
                                apAmt = txnAmt - loan.balanceAmount - loan.interestBalanceAmount - loan.penaltyBalanceAmount
                                txnAmt = loan.balanceAmount + loan.interestBalanceAmount + loan.penaltyBalanceAmount
                                batchPrin = loan.balanceAmount
                                batchInt = loan.interestBalanceAmount
                                batchPen = loan.penaltyBalanceAmount
                            }
                            
                            if (loan.balanceAmount == 0.00D){
                                apAmt = txnAmt
                                txnAmt = 0.00D
                            }
                            // regular
                            if (txnType == 5) {
                                nLine++
                                if (loan.balanceAmount > 0.00D){
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'5', recordDate:Branch.get(1).runDate,
                                    amount:txnAmt,
                                    particulars:'Loan Collection Reg - '+loan.customer.displayName,
                                    currency:Currency.get(1), creditAccount:loan.accountNo,
                                    credit:txnAmt, account:loan.accountNo,
                                    reference:batchRef, accountName: loan.customer.displayName,
                                    lineNo:nLine.toString())   
                                    gLine.save(flush:true,validateOnError:true)
                                    totCr += txnAmt
                                }
                            }
                            // specified
                            if (txnType == 6) {
                                nLine++
                                if (loan.balanceAmount > 0.00D){
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'6', recordDate:Branch.get(1).runDate,
                                    amount:batchPrin + batchInt + batchPen,
                                    particulars:'Loan Collection Spec -'+loan.customer.displayName,
                                    currency:Currency.get(1), creditAccount:loan.accountNo,
                                    credit:batchPrin + batchInt + batchPen, account:loan.accountNo,
                                    reference:batchRef, accountName: loan.customer.displayName,
                                    principal:batchPrin, interest:batchInt, penalty:batchPen,
                                    lineNo:nLine.toString())
                                gLine.save(flush:true,validateOnError:true)
                                totCr += txnAmt
                                }
                            }
                            // create credit to GL for excess
                            if (apAmt > 0) {
                                nLine++
                                gLine = new GlBatch(batchId:gHdr.batchId, batchType:'8', recordDate:Branch.get(1).runDate,
                                    amount:apAmt,
                                    particulars:'Overpayment -'+loan.customer.displayName,
                                    currency:Currency.get(1), creditAccount:'2-30-12-00-00-00-00-00-01',
                                    credit:apAmt, account:'2-30-12-00-00-00-00-00-01',
                                    reference:batchRef, accountName: 'Loan Refund Payable',
                                    principal:0.00, interest:0.00, penalty:0.00,
                                    lineNo:nLine.toString())
                                gLine.save(flush:true,validateOnError:true)
                                totCr += apAmt
                            }
                        }
                    }
                } finally {
                  reader.close();
                }
                // update header for total credit
                gHdr.totalCredit = totCr
                gHdr.save(flush:true, failOnError:true)

                // display gsp
                flash.message = 'Import Completed, please proceed to GL Batch for processing'
                render(view:"loanCollectionProcessing")
                return
            }
        } else {
            flash.message = 'invalid params'
            render(view:"loanCollectionProcessing")
            return
        }
    }
}
