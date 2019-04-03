package icbs.gl



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CfgAcctGlTemplateDetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if(params.offset==null){
            params.offset=0
        }
        if (params.query == null) {
            respond CfgAcctGlTemplateDet.list(params), model:[params:params,CfgAcctGlTemplateDetInstanceCount:  CfgAcctGlTemplateDet.count()]
            return
        }
        else{
            def CfgAcctGlTemplateDetList = CfgAcctGlTemplateDet.createCriteria().list (params) {
                or {
                    ilike("glCode", "%${params.query}%")
                    ilike("glDescription", "%${params.query}%")
                   }                   
            }
            respond CfgAcctGlTemplateDetList, model:[params:params,CfgAcctGlTemplateDetInstanceCount: CfgAcctGlTemplateDetList.totalCount]
        }
        return
    }

    def show(CfgAcctGlTemplateDet cfgAcctGlTemplateDetInstance) {
        respond cfgAcctGlTemplateDetInstance
    }

    def create() {
        respond new CfgAcctGlTemplateDet(params)
    }

    @Transactional
    def save(CfgAcctGlTemplateDet cfgAcctGlTemplateDetInstance) {
        if (cfgAcctGlTemplateDetInstance == null) {
            notFound()
            return
        }

        if (cfgAcctGlTemplateDetInstance.hasErrors()) {
            respond cfgAcctGlTemplateDetInstance.errors, view:'create'
            return
        }

        cfgAcctGlTemplateDetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cfgAcctGlTemplateDet.label', default: 'CfgAcctGlTemplateDet'), cfgAcctGlTemplateDetInstance.id])
                redirect cfgAcctGlTemplateDetInstance
            }
            '*' { respond cfgAcctGlTemplateDetInstance, [status: CREATED] }
        }
    }

    def edit(CfgAcctGlTemplateDet cfgAcctGlTemplateDetInstance) {
        respond cfgAcctGlTemplateDetInstance
    }

    @Transactional
    def update(CfgAcctGlTemplateDet cfgAcctGlTemplateDetInstance) {
        if (cfgAcctGlTemplateDetInstance == null) {
            notFound()
            return
        }

        if (cfgAcctGlTemplateDetInstance.hasErrors()) {
            respond cfgAcctGlTemplateDetInstance.errors, view:'edit'
            return
        }

        cfgAcctGlTemplateDetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CfgAcctGlTemplateDet.label', default: 'CfgAcctGlTemplateDet'), cfgAcctGlTemplateDetInstance.id])
                redirect cfgAcctGlTemplateDetInstance
            }
            '*'{ respond cfgAcctGlTemplateDetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CfgAcctGlTemplateDet cfgAcctGlTemplateDetInstance) {

        if (cfgAcctGlTemplateDetInstance == null) {
            notFound()
            return
        }

        cfgAcctGlTemplateDetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CfgAcctGlTemplateDet.label', default: 'CfgAcctGlTemplateDet'), cfgAcctGlTemplateDetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cfgAcctGlTemplateDet.label', default: 'CfgAcctGlTemplateDet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
