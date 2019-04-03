package icbs.gl
import icbs.admin.UserMaster


class BankRecon {
    
        String bankAccount
        Date startDate
        Date endDate
        Double beginningBalance
        Double endBalance
        Double adjBalance
       // UserMaster user         
    static constraints = {
        
        bankAccount nullable:true
        startDate nullable:true
        endDate nullable:true
        beginningBalance nullable:true
        endBalance nullable:true
        adjBalance nullable:true       
        
    }
    
    static mapping = {
        
        version false;
        id generator: 'identity',
        params: [table: 'BankRecon', column: 'id']
    }
    
}
