package icbs.loans


import grails.converters.JSON
import grails.converters.deep.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import icbs.lov.LoanApplicationStatus
import icbs.lov.LoanFinancialInfoType
import icbs.lov.LoanCollateralType
import icbs.lov.LoanCollateralStatus
import icbs.lov.ConfigItemStatus
import icbs.cif.Customer
import icbs.cif.Employment
import icbs.admin.UserMaster
import icbs.admin.Branch
import icbs.lov.LoanFinancialInfoType
import icbs.loans.LoanApplicationComaker

@Transactional(readOnly = true)
class LoanApplicationController {
    def auditLogService
    def jasperService
    
    static allowedMethods = [save: "POST", 
                             update: ["PUT","POST"], 
                             updateSpecification: ["PUT","POST"], 
                             updateCollateral: ["PUT","POST"],
                             updateFinancialDetails: ["PUT","POST"], 
                             updateComakers: ["PUT","POST"], 
                             delete: "DELETE"]

    def index(Integer max) {
       // params.max = Math.min(max ?: 10, 100)   // no. of items on display
           params.max = Math.min(max ?: 25, 100)
        
        if (params.sort == null) {  // default ordering
           // params.sort = "id"
              params.sort  = "dateApproved" 
              params.order =  "desc"
        }

        if (params.query == null || params.query.trim() == "") {  // show all instances
            respond LoanApplication.list(params), model:[params:params, LoanApplicationInstanceCount: LoanApplication.count()]
        } else {    // show query results
            def result = LoanApplication.createCriteria().list(params) {
                or{
                    'customer'{
                        or{
                            ilike("displayName","%${params.query.trim()}%")
                        }
                    }
                    if(params.query.trim().isLong()){
                        idEq(params.query.trim().toLong())
                    }
                }
            }
            println result.totalCount
            respond result, model:[params:params, LoanApplicationInstanceCount: result.totalCount]
        }
        return
    } 

    def search(Integer max) {
     // params.max = Math.min(max ?: 10, 100) 
        params.max = Math.min(max ?: 25, 100)
  
         if (params.sort == null) {
            params.sort = "id"
        }

        if (params.query == null || params.query.trim() == "") {  // show all instances
            render(template:"search/searchLoanApplication", model:[params:params, domainInstanceList:LoanApplication.list(params), domainInstanceCount:LoanApplication.count()]) as JSON
        } else {    // show query results
            def result = LoanApplication.createCriteria().list(params) {
                or{
                    'customer'{
                        or{
                            ilike("displayName","%${params.query.trim()}%")
                        }
                    }
                    if(params.query.trim().isLong()){
                        idEq(params.query.trim().toLong())
                    }
                }
            }
            render(template:"search/searchLoanApplication", model:[params:params, domainInstanceList:result, domainInstanceCount:result.totalCount]) as JSON
        }            
        return
    }
    
    //ready for filtering loan application without pendign status
     def searchLoan(Integer max) {
     // params.max = Math.min(max ?: 10, 100) 
        params.max = Math.min(max ?: 25, 100)
  
         if (params.sort == null) {
            params.sort = "id"
        }

        if (params.query == null || params.query.trim() == "") {  // show all instances
            render(template:"search/searchLoanApplication", model:[params:params, domainInstanceList:LoanApplication.list(params), domainInstanceCount:LoanApplication.count()]) as JSON
        } else {    // show query results
            def result = LoanApplication.createCriteria().list(params) {
                or{
                    'customer'{
                        or{
                            ilike("displayName","%${params.query.trim()}%")
                        }
                    }
                    if(params.query.trim().isLong()){
                        idEq(params.query.trim().toLong())
                    }
                }
            }
            render(template:"search/searchLoanApplication", model:[params:params, domainInstanceList:result, domainInstanceCount:result.totalCount]) as JSON
        }            
        return
    }
    

    def show(LoanApplication loanApplicationInstance) {
        def comakers = LoanApplicationComaker.findAllByLoanApplication(loanApplicationInstance)

        respond loanApplicationInstance, model: [comakers: comakers]        
    }

    def create() {
        // initialize session variables
        session["financialDetails"] = []
        session["comakers"] = []
        session["collaterals"] = []

        def customer = null
        if (params?.cid) {
            customer = Customer.get(params?.cid)
            
        }

        respond new LoanApplication(params), model:[customer:customer]
        
        
               
    }

    @Transactional
    def save(LoanApplication loanApplicationInstance) {

//        if (loanApplicationInstance.customer == null) {
//            customerInfo()
//            return
//        }
//         println params
      
//        if (pending.id != 2)
//        {
//            statusPending()
//            return
//        }
        if (loanApplicationInstance.applicationDate == null)
            {  
            loanApplicationInstance.applicationDate = Branch.get(1).runDate
        } 
        println "loan customer " + loanApplicationInstance.customer
                if (loanApplicationInstance.customer == null)
        { 
            flash.message = 'Customer ID Cannot be null !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        }
         def pending = Customer.get(params.customer.id).status
                if (pending.id != 2)
        { 
            flash.message = 'Update Customer Status First !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        }
        
                 if (loanApplicationInstance.amount == null)
        { 
            flash.message = 'Loan Amount Cannot be null !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        } 
                 if (loanApplicationInstance.amount < 0)
        { 
            flash.message = 'Amount Cannot be negative !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        } 
                if (loanApplicationInstance.term == null)
        { 
            flash.message = 'Term Cannot be null !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        } 
                if (loanApplicationInstance.purpose == null)
        { 
            flash.message = 'Purpose Cannot be null !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        } 
                if (loanApplicationInstance.accountOfficer == null)
        { 
            flash.message = 'Account Officer Cannot be null !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        }
        
        //Distribution ID Checking
        //def distrib = Employment.get(params.employment.id).distributionId
                if (loanApplicationInstance.customer.employments[0].distributionId == null && loanApplicationInstance.product.code == 606 )
        { 
            flash.message = 'Update Distribution ID First !.|error|alert'
            render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
            return
        }
        
        if (loanApplicationInstance.homePay == null)
        { loanApplicationInstance.homePay = 0 }
        if (loanApplicationInstance.redemption01 == null)
        { loanApplicationInstance.redemption01 = 0 }
        if (loanApplicationInstance.redemption02 == null)
        { loanApplicationInstance.redemption02 = 0 }
        if (loanApplicationInstance.redemption03 == null)
        { loanApplicationInstance.redemption03 = 0 }
        if (loanApplicationInstance.termination01 == null)
        { loanApplicationInstance.termination01 = 0 }
         if (loanApplicationInstance.termination02 == null)
        { loanApplicationInstance.termination02 = 0 }
         if (loanApplicationInstance.termination03 == null)
        { loanApplicationInstance.termination03 = 0 }
         if (loanApplicationInstance.undeducted01 == null)
        { loanApplicationInstance.undeducted01 = 0 }
        if (loanApplicationInstance.undeducted02 == null)
        { loanApplicationInstance.undeducted02 = 0 }
        if (loanApplicationInstance.undeducted03 == null)
        { loanApplicationInstance.undeducted03 = 0 }
        if (loanApplicationInstance.a1 == null)
        { loanApplicationInstance.a1 = 0 }
        if (loanApplicationInstance.b1 == null)
        { loanApplicationInstance.b1 = 0 }
        if (loanApplicationInstance.c1 == null)
        { loanApplicationInstance.c1 = 0 }
        if (loanApplicationInstance.requiredNetPay == null)
        { loanApplicationInstance.requiredNetPay = 0 }
        
        def redemption 
        def termination
        def undeducted
        
        redemption = (loanApplicationInstance.redemption01 + loanApplicationInstance.redemption02 + loanApplicationInstance.redemption03)
        termination =(loanApplicationInstance.termination01 +loanApplicationInstance.termination02 + loanApplicationInstance.termination03) 
        undeducted = (loanApplicationInstance.undeducted01 + loanApplicationInstance.undeducted02 + loanApplicationInstance.undeducted03)
     
        
        loanApplicationInstance.netAvail = ( loanApplicationInstance.homePay + redemption + termination ) - undeducted
        loanApplicationInstance.a1 = (loanApplicationInstance.netAvail - Double.parseDouble(loanApplicationInstance.requiredNetPay.replaceAll(",","")))
        loanApplicationInstance.maxAmt = ((loanApplicationInstance.a1 * loanApplicationInstance.b1).div(loanApplicationInstance.c1))
        
           
            if (session["comakers"]) {
           Boolean same = false 
           for(comaker in session["comakers"]) {
               println comaker
               println params.customer
               if (params.customer == comaker) {
                   same = true
                   println 'same comaker'
               }
           }
           if (same) {
                flash.message = 'Customer cannot be co-maker!.|error|alert'
                render(view: '/loanApplication/create', model: [loanApplicationInstance:loanApplicationInstance])
                return               
           }
        }     
        
        if (loanApplicationInstance.hasErrors()) {
            respond loanApplicationInstance.errors, view:'create'
          return
        } 
        
        for(financialDetail in session["financialDetails"]) {
            loanApplicationInstance.addToFinancialDetails(financialDetail)
        }
        session["financialDetails"] = null

        for(collateral in session["collaterals"]) {
            if (!collateral.isAttached())
                collateral.attach()
            loanApplicationInstance.addToCollaterals(collateral)
        }
        session["collaterals"] = null
       

    
        println 'customer name'
        //loanApplicationInstance.branch = UserMaster.get(session.user_id).branch
        loanApplicationInstance.save flush:true  
        
        for(comaker in session["comakers"]) {
            def comakerLink = new LoanApplicationComaker(loanApplication: loanApplicationInstance, customer: comaker)
            comakerLink.save flush:true            
        }
        session["comakers"] = null
        def description = 'Loan Application ' +  loanApplicationInstance.id + ' was created by ' + UserMaster.get(session.user_id).username
           auditLogService.insert('090', 'LON00201', description, 'Loan', null, null, null, loanApplicationInstance.id)
        
        request.withFormat {
            form multipartForm {
               // flash.message = message(code: 'default.created.message', args: [message(code: 'loanApplication.label', default: 'LoanApplication'), loanApplicationInstance.id])
                redirect loanApplicationInstance
                //redirect action: "show", id: loanApplicationInstance.id
            }
            '*' { respond loanApplicationInstance, [status: CREATED] }
        }
    }

    def edit(LoanApplication loanApplicationInstance) {
        def comakers = LoanApplicationComaker.findAllByLoanApplication(loanApplicationInstance)

        respond loanApplicationInstance, model:[comakers: comakers]

    }
    
    def printLoanApplication(LoanApplication loanApplicationInstance){    
        try {    
            println"---------------- "
            params._name = "Loan Assignment"
            params._format ="PDF"//required caps
            params._file ="loanapp/loanapplicationreportjrxml.jasper" //jasper file name
            def id = LoanApplication.get(loanApplicationInstance.id).id

            params.id =  id.toString()
            params.resourcepath = webRequest.baseUrl
            
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
    def update(LoanApplication loanApplicationInstance) {
        if (loanApplicationInstance == null) {
            notFound()
            return
        }

        if (loanApplicationInstance.hasErrors()) {
            def comakers = LoanApplicationComaker.findAllByLoanApplication(loanApplicationInstance)
            respond loanApplicationInstance.errors, model: [comakers:comakers], view:'edit'
            return
        }
        def redemption 
        def termination
        def undeducted
        def max = (loanApplicationInstance.a1 * loanApplicationInstance.b1)
      
       
        redemption = (loanApplicationInstance.redemption01 + loanApplicationInstance.redemption02 + loanApplicationInstance.redemption03)
        termination =(loanApplicationInstance.termination01 +loanApplicationInstance.termination02 + loanApplicationInstance.termination03) 
        undeducted = (loanApplicationInstance.undeducted01 + loanApplicationInstance.undeducted02 + loanApplicationInstance.undeducted03)
        
        loanApplicationInstance.netAvail = ( loanApplicationInstance.homePay + redemption + termination ) - undeducted
        loanApplicationInstance.a1 = (loanApplicationInstance.netAvail - Double.parseDouble(loanApplicationInstance.requiredNetPay.replaceAll(",","")))
        loanApplicationInstance.maxAmt = ((loanApplicationInstance.a1 * loanApplicationInstance.b1).div(loanApplicationInstance.c1))

        loanApplicationInstance.save flush:true
        def description = 'Loan Application ' +  loanApplicationInstance.id + ' was edited by ' + UserMaster.get(session.user_id).username
           auditLogService.insert('090', 'LON00201', description, 'Loan', null, null, null, loanApplicationInstance.id)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LoanApplication.label', default: 'LoanApplication'), loanApplicationInstance.id])
                redirect loanApplicationInstance
            }
            '*'{ respond loanApplicationInstance, [status: OK] }
            }
    }

    def showUpdateStatusAjax() {
        def loanApplicationInstance = LoanApplication.get(params.id)

        render(template:"status/editStatus", model:[loanApplicationInstance:loanApplicationInstance]) as JSON
        return
    }

    @Transactional
    def updateStatusAjax() {
        def loanApplicationInstance = LoanApplication.get(params.id)

        loanApplicationInstance.approvalStatus = LoanApplicationStatus.get(params.approvalStatus.id)

        if (loanApplicationInstance.approvalStatus.id == 5) {
            loanApplicationInstance.rejectedBy = UserMaster.get(session.user_id)
            loanApplicationInstance.dateRejected = loanApplicationInstance.branch.runDate
        } else if (loanApplicationInstance.approvalStatus.id == 6) {
            loanApplicationInstance.approvedBy = UserMaster.get(session.user_id)
            loanApplicationInstance.dateApproved = loanApplicationInstance.branch.runDate
        }

        loanApplicationInstance.save flush:true

        def message = "Status successfully updated"
        render(template:"status/editStatus", model:[loanApplicationInstance:loanApplicationInstance, message:message]) as JSON

        return
    }    
    
    /*
     * Financial Details
     */

    def showFinancialDetailsAjax() {
        render(template:"financialDetails/list") as JSON
        return
    }    

    def showFinancialDetailsAjax2() {
        def id  = params?.id
        def loanApplicationInstance = LoanApplication.get(id)

        render(template:"financialDetails/list", model:[loanApplicationInstance:loanApplicationInstance]) as JSON
        return
    }    

    def showAddFinancialDetailAjax() {    
        render(template:"financialDetails/form") as JSON
        return
    }

    def addFinancialDetailAjax() { 
        
        def description = params?.description
        def value
          if (params?.value == '')
        {
             value = params?.value 
        }
        else
        {
             value = params?.value.toDouble()
        }
        def type = params?.type
        def des = LoanFinancialInfoType.get(params?.type).description
        
        
        
        if (description == '')
        {
            def message = 'Description cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
         if (value == '')
        {
            def message = 'Amount Value cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
          if (value < 0)
        {
            def message = 'Amount Value cannot be negative !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
       

        def financialDetail = new FinancialDetail(description: description, value: value, type: LoanFinancialInfoType.get(type))
        financialDetail.dateCreated = new Date()

        if (!financialDetail.validate()) {
            render(template:"financialDetails/form", model:[financialDetail:financialDetail]) as JSON
            return
        } 

        def financialDetails
        if (session["financialDetails"]) {
            financialDetails = session["financialDetails"]
        } else {
            financialDetails = []
        }        
        financialDetails.add(financialDetail)
        session["financialDetails"] = financialDetails        

        def message = 'Financial detail type ' + des + ' with value P' + value + ' was succesfully added!'
        render(template:"financialDetails/form", model:[message:message]) as JSON

        return
    }

    @Transactional
    def addFinancialDetailAjax2() {
        def id  = params?.id
        def description = params?.description
        def value
        if (params?.value == '')
        {
             value = params?.value 
        }
        else
        {
             value = params?.value.toDouble()
        }
        def type = params?.type
        def des = LoanFinancialInfoType.get(params?.type).description
        if (description == '')
        {
            def message = 'Description cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
         if (value == '')
        {
            def message = 'Amount Value cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
          if (value < 0)
        {
            def message = 'Amount Value cannot be negative !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }

        def financialDetail = new FinancialDetail(description: description, value: value, type: LoanFinancialInfoType.get(type))
        financialDetail.dateCreated = new Date()

        if (!financialDetail.validate()) {
            render(template:"financialDetails/form", model:[financialDetail:financialDetail]) as JSON
            return
        } 

        def loanApplicationInstance = LoanApplication.get(id)
        loanApplicationInstance.addToFinancialDetails(financialDetail)
        loanApplicationInstance.save flush:true

        def message = 'Financial detail type ' + des + ' with value P' + value + ' was succesfully added!'
        render(template:"financialDetails/form", model:[message:message]) as JSON

        return
    }

    def showUpdateFinancialDetailAjax() {   
        def id = params?.id?.toInteger()
        
        def financialDetails = session["financialDetails"]        
        def financialDetail = financialDetails[id]

        render(template:"financialDetails/form", model:[financialDetail:financialDetail]) as JSON
        return
    }

    def showUpdateFinancialDetailAjax2() {   
        def id = params?.id?.toInteger()
        
        def financialDetail = FinancialDetail.get(id)

        render(template:"financialDetails/form", model:[financialDetail:financialDetail]) as JSON
        return
    }

    def updateFinancialDetailAjax() {   
        def id = params?.id?.toInteger()
        def description = params?.description
        def value = params?.value ? params?.value?.toDouble() : null
        def type = params?.type
        
        
        if (description == '')
        {
            def message = 'Description cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
         if (value == '')
        {
            def message = 'Amount Value cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
          if (value < 0)
        {
            def message = 'Amount Value cannot be negative !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        } 
        
        def tempFinancialDetail = new FinancialDetail(description: description, value: value, type: LoanFinancialInfoType.get(type))
        tempFinancialDetail.dateCreated = new Date()

        if (!tempFinancialDetail.validate()) {
            render(template:"financialDetails/form", model:[financialDetail:tempFinancialDetail]) as JSON
            return
        }        

        def financialDetails = session["financialDetails"]        
        def financialDetail = financialDetails[id]

        financialDetail.description = description
        financialDetail.value = value
        financialDetail.type = LoanFinancialInfoType.get(type)

        def message = "Financial detail successfully updated"
        render(template:"financialDetails/form", model:[financialDetail:financialDetail, message:message]) as JSON

        return
    }

    @Transactional
    def updateFinancialDetailAjax2() {  
        def id  = params?.id
        def description = params?.description
        def value = params?.value ? params?.value?.toDouble() : null
        def type = params?.type
        
         if (description == '')
        {
            def message = 'Description cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
         if (value == '')
        {
            def message = 'Amount Value cannot be null !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
          if (value < 0)
        {
            def message = 'Amount Value cannot be negative !'
            render(template:"financialDetails/form" , model:[message:message]) as JSON
            return
        }
        
        def financialDetail = FinancialDetail.get(id)
        financialDetail.description = description
        financialDetail.value = value
        financialDetail.type = LoanFinancialInfoType.get(type)

        if (!financialDetail.validate()) {
            render(template:"financialDetails/form", model:[financialDetail:financialDetail]) as JSON
            return
        }  

        financialDetail.save flush:true

        def message = "Financial detail successfully updated"
        render(template:"financialDetails/form", model:[financialDetail:financialDetail, message:message]) as JSON

        return
    }
        
    def deleteFinancialDetailAjax() {
        def id = params?.id?.toInteger()
        session["financialDetails"].remove(id)

        render "success"
        return
    }

    @Transactional
    def deleteFinancialDetailAjax2() {
        def id = params?.id?.toInteger()
        def financialDetailId = params?.financialDetailId?.toInteger()

        def loanApplicationInstance = LoanApplication.get(id)
        def financialDetail = FinancialDetail.get(financialDetailId)

        loanApplicationInstance.removeFromFinancialDetails(financialDetail)
        loanApplicationInstance.save flush:true

        render "success"
        return
    }

    /*
     * Comakers
     */

    def showComakersAjax() {
        render(template:"comakers/list") as JSON
        return
    }   

    def showComakersAjax2() {
        def id  = params?.id
        def loanApplicationInstance = LoanApplication.get(id)
        def comakers = LoanApplicationComaker.findAllByLoanApplication(loanApplicationInstance)

        render(template:"comakers/list", model:[comakers:comakers]) as JSON
        return
    }  

    def addComakerAjax() {
        def id = params?.id

        def comaker = Customer.get(id)

        def comakers
        if (session["comakers"]) {
            comakers = session["comakers"]
        } else {
            comakers = []
        }

        if (!(comakers*.id.contains(comaker.id))) {
            comakers.add(comaker)
            session["comakers"] = comakers
        }

        render "success"
        return
    }

    @Transactional
    def addComakerAjax2() {    
        def id = params?.id
        def cid = params?.cid

        def loanApplicationInstance = LoanApplication.get(id)
        def comaker = Customer.get(cid)

        if (!LoanApplicationComaker.find{loanApplication == loanApplicationInstance && customer == comaker}) {            
            def comakerLink = new LoanApplicationComaker(loanApplication: loanApplicationInstance, customer: comaker)
            comakerLink.save flush:true
        }
       
        render "success"
        return
    }

    def deleteComakerAjax() {
        def id = params?.id?.toInteger()
        session["comakers"].remove(id)

        render "success"
        return
    }

    @Transactional
    def deleteComakerAjax2() {
        def id = params?.id

        def comakerLink = LoanApplicationComaker.get(id)
        comakerLink.delete flush:true

        render "success"
        return
    }
    
    /*
     * Collateral
     */

    def showCollateralAjax() {
        render(template:"collateral/list") as JSON
        return
    }

    def showCollateralAjax2() {
        def id  = params?.id
        def loanApplicationInstance = LoanApplication.get(id)
        
        render(template:"collateral/list",  model:[loanApplicationInstance:loanApplicationInstance]) as JSON
        return
    }  

    def addCollateralAjax() {
        def id = params?.id
        def stat = Collateral.get(params.id).status.id
        println "geloy " + stat
        if (stat != 2)
        {
            def message = 'Update Collateral Status!'
            render "message"
            return  
        }
        def collateral = Collateral.get(id)

        def collaterals
        if (session["collaterals"]) {
            collaterals = session["collaterals"]
        } else {
            collaterals = []
        }

        if (!(collaterals*.id.contains(collateral.id))) {
            collaterals.add(collateral)
            session["collaterals"] = collaterals
        }

        render "success"
        return
    }

    @Transactional
    def addCollateralAjax2() {    
        def id = params?.id
        def collateralId = params?.collateralId
     
         def stat = Collateral.get(collateralId).status.id
         println "gelo" + stat
         if (stat != 2)
        {
            def message = 'Update Collateral Status!'
            render "message"
            return  
        }
        def loanApplicationInstance = LoanApplication.get(id)
        def collateral = Collateral.get(collateralId)

        if (!(loanApplicationInstance*.collaterals.id.contains(collateral.id))) {
            loanApplicationInstance.addToCollaterals(collateral)
            loanApplicationInstance.save flush:true
        }

        render "success"
        return
    }

    def deleteCollateralAjax() {
        def id = params?.id?.toInteger()
        session["collaterals"].remove(id)

        render "success"
        return
    }

    @Transactional
    def deleteCollateralAjax2() {
        def id = params?.id
        def collateralId = params?.collateralId
        
        def loanApplicationInstance = LoanApplication.get(id)
        def collateral = Collateral.get(collateralId)

        loanApplicationInstance.removeFromCollaterals(collateral)
        loanApplicationInstance.save flush:true

        render "success"
        return
    }    

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loanApplication.label', default: 'LoanApplication'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
        protected void customerInfo() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.customer', args: [message(code: 'loanApplication.label', default: 'LoanApplication'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
        protected void statusPending() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.cifstatus', args: [message(code: 'loan.label', default: 'Loan'), params.id])
                redirect action: "index", method: "GET"
              
           
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
