package accounting.fixedasset
import icbs.lov.ConfigItemStatus
import icbs.admin.Branch

class Bankasset {

        //static hasMany = [glacc:GlAccount, ebitglacc:GlAccount, creditglacc:GlAccount, vendorlink:Vendor]
        Branch branch
        String assetcode
        String assetdesc
        Date assetexpire
        String assetserial
        String assetpo
        Integer isnew
        String purdesc
        Date purdate
        Double purcost
        Double salvagevalue
        Double deprevalue
        Integer lifeinyears
        Double annualexpense
        String glacc
        String userid
        Integer tag
        String debitglacc
        String creditglacc
        String vendorlink
        Double soldamt
        Integer noofinstallment
        String assacc
        Integer tag2
        Double monthlyexpense
        Double faBalance
        Double accDepreciation
        ConfigItemStatus status

    static constraints = {
         branch nullable:true
         status (nullable: true)
         assetcode(nullable:true, unique:true)
         assetdesc(nullable:false)
         assetexpire(nullable:true)
         assetserial(blank:false, nullable:false)
         assetpo(blank:false, nullable:false)
         isnew(nullable:true)
         purdesc(nullable:true)
         purdate(blank:false, nullable:false)
         purcost(nullable:false, min:0.00D, scale:2)
         salvagevalue(nullable:false, min:0.00D, scale:2)
         deprevalue(nullable:false, min:0.00D, scale:2)
         lifeinyears(nullable:false)
         annualexpense(nullable:false, min:0.00D, scale:2)
         glacc(nullable:true)
         userid(nullable:true)
         tag(nullable:true)
         debitglacc(nullable:true)
         creditglacc(nullable:true)
         vendorlink(nullable:true)
         soldamt(nullable:true, min:0.00D, scale:2)
         noofinstallment(nullable:true)
         assacc(nullable:true)
         tag2(nullable:true)
         faBalance(nullable :true, min:0.00D, scale:2)
         accDepreciation(nullable:true, min:0.00D, scale:2)
         monthlyexpense(blank:false, nullable:false)

    }

    static mapping = {
        id sqlType: 'int', generator: 'increment'
    }

    def beforeInsert() {
        Calendar c = Calendar.getInstance();
        c.setTime(this.purdate);
        c.add(Calendar.YEAR, this.lifeinyears);
        def newDate = c.getTime();

        this.assetexpire = newDate
        this.noofinstallment = this.lifeinyears * 12
        this.soldamt = 0.00D
        this.accDepreciation = 0.00D
        this.faBalance = 0.00D
    }
}
