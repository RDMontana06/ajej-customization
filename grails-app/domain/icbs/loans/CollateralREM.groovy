package icbs.loans

import icbs.lov.AppraisedValueType

class CollateralREM {
	AppraisedValueType appraisedValueType
	String tctNo
	String lotNo
	String location
	String otherOwners
	String registryOfDeeds
	Date dateOfIssuance
	String encumberances

	//static belongsTo = [collateral: Collateral]

	static constraints = {
    	appraisedValueType nullable:false    
		tctNo nullable:false
		lotNo nullable:false
		location nullable:false
		otherOwners nullable:true
		registryOfDeeds nullable:false
		dateOfIssuance nullable:false
		encumberances nullable:true
    }

    static mapping = {
		id sqlType: "int", generator: "increment"
		appraisedValueType sqlType: "smallint"
	}

}