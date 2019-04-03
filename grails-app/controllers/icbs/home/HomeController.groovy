package icbs.home

import icbs.admin.UserMessage
import icbs.admin.UserMaster

class HomeController {

	def landing() {
            //println "landing always"
            //println "Timeout: ${session.getMaxInactiveInterval()} seconds"
            def userInstance = UserMaster.get(session.user_id)
            respond UserMessage.findAllByRecipientAndIsRead(UserMaster.get(session.user_id), false, [max:10]), model:[params:params,
                    UserMessageInstanceCount:  UserMessage.count(),userInstance:userInstance]    
        return
	}
    
}
