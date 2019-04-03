package accounting.fixedasset
import icbs.tellering.TxnFile
import accounting.fixedasset.Bankasset
class FixedAssetLedger {
    
    Bankasset bankAsset
    Date txnDate
    Date valueDate
    String reference
    String particulars
    Double debitAmt
    Double creditAmt
    Double balanceAmt
    TxnFile txnFile

    
    static constraints = {
        bankAsset nullable:true
        txnDate nullable:true
        valueDate nullable:true
        reference nullable:true
        particulars nullable:true
        debitAmt min:0D, scale:2
        creditAmt min:0D, scale:2
        balanceAmt min:0D, scale:2
        txnFile nullable:true 
   
    }
    
    static mapping = {
      id sqlType: "int", generator: "increment"
    }    
}
