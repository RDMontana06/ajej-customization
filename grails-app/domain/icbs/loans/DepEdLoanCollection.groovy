package icbs.loans
import icbs.loans.Loan
import icbs.cif.Customer
import icbs.loans.DepEdLoanRemDet
import icbs.admin.Branch
import icbs.deposit.Deposit

class DepEdLoanCollection {
    String batchSerial
    DepEdLoanRemDet depEdLoanRemDet
    Loan loan
    Deposit deposit
    Branch branch
    Customer customer
    Double paymentAmt
    
    static constraints = {
        batchSerial nullable:false
        depEdLoanRemDet nullable:false
        loan nullable:true
        branch nullable:false
        customer nullable:false
        deposit nullable:true
        paymentAmt nullable:true, min:0d, scale:2
    }
}
