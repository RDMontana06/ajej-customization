package icbs.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ForexRateController {
    
    def auditLogService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if(params.offset==null){
            params.offset=0
        }
        if (params.query == null) {
            respond ForexRate.list(params), model:[params:params,ForexRateInstanceCount:  ForexRate.count()]
            return
        }
        else{
            def ForexRateList = ForexRate.createCriteria().list (params) {
                
            }
            respond ForexRateList, model:[params:params,ForexRateInstanceCount: ForexRateList.totalCount]
        }
        return
    }

    def show(ForexRate forexRateInstance) {
        respond forexRateInstance
    }

    def create() {
        respond new ForexRate(params)
    }

    @Transactional
    def save(ForexRate forexRateInstance) {
        forexRateInstance.date = new Date().format('yyyy-MM-dd HH:mm')

        if (forexRateInstance == null) {
            notFound()
            return
        }

        if (forexRateInstance.hasErrors()) {
            respond forexRateInstance.errors, view:'create'
            return
        }

        forexRateInstance.save flush:true

        // Log
        def description = 'save Forex Rate ' +  forexRateInstance.currency.name
        auditLogService.insert('040', 'ADM00900', description, 'forexRate', null, null, null, forexRateInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'forexRate.label', default: 'ForexRate'), forexRateInstance.id])
                redirect forexRateInstance
            }
            '*' { respond forexRateInstance, [status: CREATED] }
        }
    }

    def edit(ForexRate forexRateInstance) {
        respond forexRateInstance
    }

    @Transactional
    def update(ForexRate forexRateInstance) {
        if (forexRateInstance == null) {
            notFound()
            return
        }

        if (forexRateInstance.hasErrors()) {
            respond forexRateInstance.errors, view:'edit'
            return
        }

        forexRateInstance.save flush:true

        // Log
        def description = 'update Forex Rate ' +  forexRateInstance.currency.name
        auditLogService.insert('040', 'ADM00900', description, 'forexRate', null, null, null, forexRateInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ForexRate.label', default: 'ForexRate'), forexRateInstance.id])
                redirect forexRateInstance
            }
            '*'{ respond forexRateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ForexRate forexRateInstance) {

        if (forexRateInstance == null) {
            notFound()
            return
        }

        forexRateInstance.delete flush:true

        // Log
        def description = 'delete Forex Rate ' +  forexRateInstance.currency.name
        auditLogService.insert('040', 'ADM00900', description, 'forexRate', null, null, null, forexRateInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ForexRate.label', default: 'ForexRate'), forexRateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'forexRate.label', default: 'ForexRate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
