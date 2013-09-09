package schoolsdata

import org.springframework.dao.DataIntegrityViolationException

class SchoolsDataController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "filter", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [schoolsDataInstanceList: SchoolsData.list(params), schoolsDataInstanceTotal: SchoolsData.count()]
    }

    def filter(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [schoolsDataInstanceList: SchoolsData.list(params), schoolsDataInstanceTotal: SchoolsData.count()]
    }


    def filterBy(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [schoolsDataInstanceList: SchoolsData.list(params), schoolsDataInstanceTotal: SchoolsData.count()]
    }

    def map( ) {
    }

    def show(Long id) {
        def schoolsDataInstance = SchoolsData.get(id)
        if (!schoolsDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolsData.label', default: 'SchoolsData'), id])
            redirect(action: "list")
            return
        }

        [schoolsDataInstance: schoolsDataInstance]
    }

    def sabc(Long id) {
        def schoolsDataInstance = SchoolsData.get(id)
        if (!schoolsDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolsData.label', default: 'SchoolsData'), id])
            redirect(action: "list")
            return
        }

        [schoolsDataInstance: schoolsDataInstance]
    }


}
