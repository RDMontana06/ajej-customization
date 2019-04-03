package icbs.atm
import icbs.admin.Branch
import icbs.lov.ConfigItemStatus

class ATMInterfaceController {

    def index(){
        def atmReq = AtmMsgRequest.list(sort: "dateReceived", order: "desc")
        render (view:'/atmInterface/view',model:[atmReq:atmReq]);        
    }
    
    def viewAtmInterface(){
        def atmReq = AtmMsgRequest.list(sort: "dateReceived", order: "desc")
        render (view:'/atmInterface/view',model:[atmReq:atmReq]);
    }
    
    def atmTerminalView(){
        def atmTerminal = AtmTerminalMapping.list(sort: "terminalCode", order: "asc")
        render (view:'/atmInterface/atmTerminalView',model:[atmTerminal:atmTerminal]);       
    }
    def createAtmTerminal(){
        def atmTerminalInstance = new AtmTerminalMapping()
        respond atmTerminalInstance
    }
    
    def saveAtmTerminal(){
        println params
        println params.terminalCode
        println '++++++++++++++'
        def atmTerminalInstance = new AtmTerminalMapping(terminalCode:params.terminalCode, remarks:params.remarks,
            branch:Branch.get(params.branch.id.toInteger()), 
            terminalStatus:ConfigItemStatus.get(params.terminalStatus.toInteger()))
        
        if (!atmTerminalInstance.validate()) {
            flash.message = 'Errors in Create ATM Terminal |error'
            respond atmTerminalInstance.errors, view:'createAtmTerminal'
            return
        }
        atmTerminalInstance.save(flush:true,failOnError:true)
        
        render(view:"show", model:[atmTerminalInstance:atmTerminalInstance])
    }
    
    def show(AtmTerminalMapping atmTerminalInstance) {
        println 'SHOW >>>>' + atmTerminalInstance
        respond atmTerminalInstance
    }
    
    def deleteTerminal(AtmTerminalMapping atmTerminalInstance) {
        println 'DEL >>>>' + atmTerminalInstance
        atmTerminalInstance.terminalStatus = ConfigItemStatus.get(3)
        atmTerminalInstance.save(flush:true,failOnError:true)
        
        redirect(action:"atmTerminalView")
    }
    
    def editTerminal(AtmTerminalMapping atmTerminalInstance){
        println 'EDIT >>>>' + atmTerminalInstance
        render(view:"editTerminal", model:[atmTerminalInstance:atmTerminalInstance])
    }
    
    def updateTerminal(){
           println params
        println params.terminalCode
        println '++++++++++++++'
        /*
        def atmTerminalInstance = new AtmTerminalMapping(terminalCode:params.terminalCode, remarks:params.remarks,
            branch:Branch.get(params.branch.id.toInteger()), 
            terminalStatus:ConfigItemStatus.get(params.terminalStatus.toInteger()))
        
        if (!atmTerminalInstance.validate()) {
            flash.message = 'Errors in Create ATM Terminal |error'
            respond atmTerminalInstance.errors, view:'createAtmTerminal'
            return
        }
        atmTerminalInstance.save(flush:true,failOnError:true)
        */
        render(view:"show", model:[atmTerminalInstance:atmTerminalInstance])     
    }
}
