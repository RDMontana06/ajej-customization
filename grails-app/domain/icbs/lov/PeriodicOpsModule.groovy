package icbs.lov

class PeriodicOpsModule {

	String description
	String status

	static constraints = {
		description maxSize:50
		status maxSize:2
	}
	
	static mapping = {
		description sqlType:'varchar'
		status sqlType:'varchar'
	}

	String toString() {
        return description
    }

    String getCodeDescription() {
        "${code} - ${description}"
    }
}
