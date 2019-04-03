package icbs.admin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import icbs.admin.InstitutionConfig

@Transactional(readOnly = true)
class InstitutionController {

    static allowedMethods = [update: "PUT"]

    def index(Integer max) {
        // params.max = Math.min(max ?: 50, 100)
        respond Institution.listOrderById(params), model:[InstitutionInstanceCount: Institution.count()]
    }

    def edit(Integer max) {
        params.max = Math.min(max ?: 50, 100)
        respond Institution.list(params), model:[InstitutionInstanceCount: Institution.count()]
    }

    @Transactional
    def update() {
        def institutionConfig = new InstitutionConfig(params)

        println params

        institutionConfig.validate()

        if (institutionConfig.hasErrors()) {
            respond institutionConfig.errors, view:'edit'
            return
        }


        def institution = Institution.listOrderById()

        institution[0].paramValue = params.institutionName
        institution[1].paramValue = params.institutionCode

        for (i in 0..1) {
            institution[i].save(flush: true, failOnError: true)
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'Institution.label', default: 'Institution')])
        redirect(action: "index")
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
