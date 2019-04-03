package icbs.loans

import icbs.cif.Customer
import icbs.admin.Product
import icbs.admin.Branch
import icbs.admin.Currency
import icbs.admin.UserMaster
import icbs.lov.LoanApplicationStatus
import icbs.lov.LoanDepedBillingType

class LoanApplication {
	Customer customer
        Product product
	Branch branch
	Currency currency
    Double amount
    Integer term
    String purpose
    String accountOfficer
        Double homePay
        String redemption1
        String redemption2
        String redemption3
        Double redemption01
        Double redemption02
        Double redemption03
        //String redemption4
        String termination1
        String termination2
        String termination3
        Double termination01
        Double termination02
        Double termination03
        //String termination4
        String undeducted1
        String undeducted2
        String undeducted3
        Double undeducted01
        Double undeducted02
        Double undeducted03
        //String undeducted4
        Double netAvail
        Double maxAmt
        Double a1
        Double b1
        Double c1
        String requiredNetPay
        String availableAmountForLoan
        String fTM
        String othersSpecify
        LoanDepedBillingType loanDepedBillingType
    Date applicationDate    
    LoanApplicationStatus approvalStatus
	UserMaster approvedBy
	UserMaster rejectedBy
	Date dateApproved
	Date dateRejected
        
        boolean formD1
        boolean formD2
        boolean formD3
        boolean formD4
        boolean formD5
        boolean formD6
        boolean formD7
        boolean formD8
        boolean formD9
        boolean formD10
        
    List financialDetails = [].withLazyDefault {new FinancialDetail()}
    
	static hasMany = [financialDetails: FinancialDetail, 
                      //comakers: LoanApplicationComaker, 
                      collaterals: Collateral]

    static constraints = {    	
        customer nullable: false  
        product nullable: false
        branch nullable: false
        currency nullable: false
        amount nullable: false, blank: false, min:0d, scale:2
        term nullable: false, blank: false, min:0
        purpose nullable: false, blank: false
        accountOfficer nullable: false
        applicationDate nullable: true
        approvalStatus nullable: true
        approvedBy nullable: true
        rejectedBy nullable: true
        dateApproved nullable: true
        dateRejected nullable: true
        homePay nullable:true
        redemption1 nullable:true
        redemption2 nullable:true
        redemption3 nullable:true
        redemption01 nullable:true
        redemption02 nullable:true
        redemption03 nullable:true
        //redemption4 nullable:true
        termination1 nullable:true
        termination2 nullable:true
        termination3 nullable:true
        termination01 nullable:true
        termination02 nullable:true
        termination03 nullable:true
        //termination4 nullable:true
        undeducted1 nullable:true
        undeducted2 nullable:true
        undeducted3 nullable:true
        undeducted01 nullable:true
        undeducted02 nullable:true
        undeducted03 nullable:true
        //undeducted4 nullable:true
        netAvail nullable:true
        maxAmt nullable:true
        a1 nullable:true
        b1 nullable:true
        c1 nullable:true
  
        formD1 nullable:true
        formD2 nullable:true
        formD3 nullable:true
        formD4 nullable:true
        formD5 nullable:true
        formD6 nullable:true
        formD7 nullable:true
        formD8 nullable:true
        formD9 nullable:true
        formD10 nullable:true
        requiredNetPay nullable:true
        availableAmountForLoan nullable:true
        fTM nullable:true
        othersSpecify nullable:true
        loanDepedBillingType nullable:true
    }

    static mapping = {
		id sqlType: "int", generator: "increment"
		customer sqlType: "int"
      
		product sqlType: "int"
		branch sqlType: "int"
		currency sqlType: "int"
		term sqlType: "smallint"
		approvalStatus sqlType: "smallint"
		approvedBy sqlType: "int"
		rejectedBy sqlType: "int"
        financialDetails  cascade:"all-delete-orphan"
	}
	
    def beforeValidate() {
        this.branch = this?.customer?.branch
        this.currency =  this?.product?.currency

        // process financial details
        /*def tempFinancialDetails = []
        tempFinancialDetails.addAll(financialDetails)
        for (financialDetail in tempFinancialDetails) {
            if (financialDetail) {
                financialDetail.dateCreated = new Date()
                if (!financialDetail.type) {
                    this.removeFromFinancialDetails(financialDetail)
                }
            }
        }*/

        return true
    }

	def beforeInsert(){
		// determine user rights first
		approvalStatus = LoanApplicationStatus.get(1)
        
        return true
    }    
}	
