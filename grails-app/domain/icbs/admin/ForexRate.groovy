package icbs.admin

import icbs.lov.ConfigItemStatus

class ForexRate {

	Currency currency
    String date
	BigDecimal rate
	BigDecimal refRate
	BigDecimal buyRate1
	BigDecimal buyRate2
	BigDecimal buyRate3
	BigDecimal buyRate4
	BigDecimal buyRate5
	BigDecimal sellRate1
	BigDecimal sellRate2
	BigDecimal sellRate3
	BigDecimal sellRate4
	BigDecimal sellRate5
	ConfigItemStatus configItemStatus

    static constraints = {
        id sqlType:'int', generator:'increment'
    	currency nullable:false
        date blank:true, nullable:false
    	rate nullable:false, min:0.00, scale: 5
    	refRate nullable:false, min:0.00, scale: 5
    	buyRate1 nullable:false, min:0.00, scale: 5
    	buyRate2 nullable:true, min:0.00, scale: 5
    	buyRate3 nullable:true, min:0.00, scale: 5
    	buyRate4 nullable:true, min:0.00, scale: 5
    	buyRate5 nullable:true, min:0.00, scale: 5
    	sellRate1 nullable:false, min:0.00, scale: 5
    	sellRate2 nullable:true, min:0.00, scale: 5
    	sellRate3 nullable:true, min:0.00, scale: 5
    	sellRate4 nullable:true, min:0.00, scale: 5
    	sellRate5 nullable:true, min:0.00, scale: 5
    }

    static mapping = {
    	currency sqlType:'smallint'
    	configItemStatus sqlType:'smallint'
    }
}
