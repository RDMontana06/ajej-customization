package icbs.loans

import icbs.admin.UserMaster
import icbs.lov.Lov

class CreditInvestigation {
	LoanApplication loanApplication
        Lov creditSummaryApprover 
	String recommendation
        String collateral
	String appraisedBy
	Date appraisalDate
        Date appraExeDate
        Date dateCreated
        Date ciScheduleDate
        Date ciExecutionDate
        Date loanAnalysisScheduleDate
        Date loanAnalysisExecutionDate
        Date creditComADate
        Date creditComBDate
        Date approvalDate
        String ciName
        String analysName
        String approvedBy
        String termsAndCondition
        String proposal
     
        //using in checklist values
        boolean formA1
        boolean formA2
        boolean formA3
        boolean formA4
        boolean formA5
        boolean formA6
        boolean formA7
        boolean formA8
        boolean formA9
        boolean formA10
        boolean formA11
        
        boolean formA12
        boolean formA13
        boolean formA14
        boolean formA15
        boolean formA16
        boolean formA17
        boolean formA18
        boolean formA19
        String formA20
        boolean formA21
        boolean formA22
        boolean formA23
        boolean formA24
        boolean formA25
        boolean formA26
        boolean formA27
        boolean formA28
        boolean formA29
        boolean formA30
        boolean formA31
        boolean formA32
        boolean formA33
        boolean formA34
        boolean formA35
        boolean formA36
        boolean formA37
        boolean formA38
        boolean formA39
        boolean formA40
        
    
        boolean formB1
        boolean formB2
        boolean formB3
        boolean formB4
        boolean formB5
        boolean formB6
        boolean formB7
        boolean formB8
        boolean formB9
        boolean formB10
        boolean formB11
        boolean formB12
        boolean formB13
        boolean formB14
        boolean formB15
        boolean formB16
        boolean formB17
        boolean formB18
        boolean formC1
        boolean formC2
        boolean formC3
        boolean formC4
        boolean formC5
        boolean formC6
        boolean formC7
        boolean formC8
        boolean formC9
        boolean formC10
        boolean formC11
        boolean formC12
        boolean formC13
        boolean formC14
        boolean formC15
        boolean formC16
        boolean formC17
        boolean formC18
        boolean formC19
        boolean formC20
        boolean formC21
        boolean formC22
        boolean formC23
        boolean formC24
        boolean formC25
        boolean formC26
        boolean formC27
        boolean formC28
        boolean formC29
        boolean formC30
        boolean formC31
        boolean formC32
        boolean formC33
        boolean formC34
        boolean formC35
    
    
    
    
    
    static hasMany = [attachments: LoanAttachment]
    
	static constraints = {
	loanApplication nullable: false
    	recommendation maxSize:255, nullable:true
        termsAndCondition nullable:true
        proposal nullable:true
        collateral maxSize:255, nullable:true
        appraisedBy nullable:true
        appraisalDate nullable:true
        dateCreated nullable:false
        ciScheduleDate nullable:true
        ciExecutionDate nullable:true
        loanAnalysisScheduleDate nullable:true
        loanAnalysisExecutionDate nullable:true
        creditComADate nullable:true
        creditComBDate nullable:true
        ciName nullable:true
        analysName nullable:true
        approvalDate nullable:true
        appraExeDate nullable:true
        approvedBy nullable:true
        creditSummaryApprover nullable:true
        collateral maxSize:255, nullable:true
      
        
        //using in checklist values
        formA1 nullable:true
        formA2 nullable:true
        formA3 nullable:true
        formA4 nullable:true
        formA5 nullable:true
        formA6 nullable:true
        formA7 nullable:true
        formA8 nullable:true
        formA9 nullable:true
        formA10 nullable:true
        formA11	nullable:true
        
        formA12	nullable:true
        formA13	nullable:true
        formA14	nullable:true
        formA15	nullable:true
        formA16	nullable:true
        formA17	nullable:true
        formA18	nullable:true
        formA19	nullable:true
        formA20	nullable:true
        formA21	nullable:true
        formA22	nullable:true
        formA23	nullable:true
        formA24	nullable:true
        formA25	nullable:true
        formA26	nullable:true
        formA27	nullable:true
        formA28	nullable:true
        formA29	nullable:true
        formA30	nullable:true
        formA31	nullable:true
        formA32	nullable:true
        formA33	nullable:true
        formA34	nullable:true
        formA35	nullable:true
        formA36	nullable:true
        formA37	nullable:true
        formA38	nullable:true
        formA39	nullable:true
        formA40	nullable:true
        
        
        formB1 nullable:true
        formB2 nullable:true
        formB3 nullable:true
        formB4 nullable:true
        formB5 nullable:true
        formB6 nullable:true
        formB7 nullable:true
        formB8 nullable:true
        formB9 nullable:true
        formB10 nullable:true
        formB11 nullable:true
        formB12 nullable:true
        formB13 nullable:true
        formB14 nullable:true
        formB15 nullable:true
        formB16 nullable:true
        formB17 nullable:true
        formB18 nullable:true
        formC1 nullable:true
        formC2 nullable:true
        formC3 nullable:true
        formC4 nullable:true
        formC5 nullable:true
        formC6 nullable:true
        formC7 nullable:true
        formC8 nullable:true
        formC9 nullable:true
        formC10 nullable:true
        formC11 nullable:true
        formC12 nullable:true
        formC13 nullable:true
        formC14 nullable:true
        formC15 nullable:true
        formC16 nullable:true
        formC17 nullable:true
        formC18 nullable:true
        formC19 nullable:true
        formC20 nullable:true
        formC21 nullable:true
        formC22 nullable:true
        formC23 nullable:true
        formC24 nullable:true
        formC25 nullable:true
        formC26 nullable:true
        formC27 nullable:true
        formC28 nullable:true
        formC29 nullable:true
        formC30 nullable:true
        formC31 nullable:true
        formC32 nullable:true
        formC33 nullable:true
        formC34 nullable:true
        formC35 nullable:true
        
        
        
        
        
    }
    
	static mapping = {
    	id sqlType: "int", generator: "increment"
    	loanApplication sqlType: "int"
    }
    
    def beforeValidate(){
        dateCreated = new Date()
    }
}