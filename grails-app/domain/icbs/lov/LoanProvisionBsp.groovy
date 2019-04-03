package icbs.lov

class LoanProvisionBsp {
    
    String code 	
    String description	
    Integer loanProvision	
    Integer minAge	
    Integer maxAge	
    Double otherAclRate	
    Double remAclRate	
    Boolean status
    
    static constraints = {
    	code maxSize:10, unique:true
    	//description maxSize:75, unique:true
    }

    static mapping = {
    	id sqlType:'smallint'
    }

    String toString() {
        return description
    }

    String getCodeDescription() {
        "${code} - ${description}"
    }
}
