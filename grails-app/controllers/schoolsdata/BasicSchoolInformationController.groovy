package schoolsdata

import org.springframework.dao.DataIntegrityViolationException

class BasicSchoolInformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    BasicSchoolInformationController() {
        session["provinces"] = getProvinces().result
        session["districtMunicipality"] = getMunicipalities().result
        session["specialisation"] = getSpecialisations().result
        session["quintile"] = getQuintiles().result
    }

    def reset() {
        session.invalidate()
        redirect(action: "index")
    }

    def sabc1() {
    }


    def sabc(Long id) {
        def basicSchoolInformationInstance = BasicSchoolInformation.get(id)
        if (!basicSchoolInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
            return
        }

        [basicSchoolInformationInstance: basicSchoolInformationInstance]
    }
    def index() {
        redirect(action: "filter", params: params)
    }

    def getQuintiles() {
        def result = BasicSchoolInformation.executeQuery("select distinct a.quintile from BasicSchoolInformation a")
        [ result: result ]
    }

    def getProvinces() {
        def result = BasicSchoolInformation.executeQuery("select distinct a.province from BasicSchoolInformation a")
        [ result: result ]
    }

    def getMunicipalities() {
        def result = BasicSchoolInformation.executeQuery("select distinct a.districtMunicipality from BasicSchoolInformation a")
        [ result: result ]
    }

    def getSpecialisations() {
        def result = BasicSchoolInformation.executeQuery("select distinct a.specialisation from BasicSchoolInformation a")
        [ result: result ]
    }


    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [basicSchoolInformationInstanceList: BasicSchoolInformation.list(params), basicSchoolInformationInstanceTotal: BasicSchoolInformation.count()]
    }

    def create() {
        [basicSchoolInformationInstance: new BasicSchoolInformation(params)]
    }

    def save() {
        def basicSchoolInformationInstance = new BasicSchoolInformation(params)
        if (!basicSchoolInformationInstance.save(flush: true)) {
            render(view: "create", model: [basicSchoolInformationInstance: basicSchoolInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), basicSchoolInformationInstance.id])
        redirect(action: "show", id: basicSchoolInformationInstance.id)
    }

    def show(Long id) {
        def basicSchoolInformationInstance = BasicSchoolInformation.get(id)
        if (!basicSchoolInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
            return
        }

        [basicSchoolInformationInstance: basicSchoolInformationInstance]
    }

    def edit(Long id) {
        def basicSchoolInformationInstance = BasicSchoolInformation.get(id)
        if (!basicSchoolInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
            return
        }

        [basicSchoolInformationInstance: basicSchoolInformationInstance]
    }

    def update(Long id, Long version) {
        def basicSchoolInformationInstance = BasicSchoolInformation.get(id)
        if (!basicSchoolInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (basicSchoolInformationInstance.version > version) {
                basicSchoolInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation')] as Object[],
                        "Another user has updated this BasicSchoolInformation while you were editing")
                render(view: "edit", model: [basicSchoolInformationInstance: basicSchoolInformationInstance])
                return
            }
        }

        basicSchoolInformationInstance.properties = params

        if (!basicSchoolInformationInstance.save(flush: true)) {
            render(view: "edit", model: [basicSchoolInformationInstance: basicSchoolInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), basicSchoolInformationInstance.id])
        redirect(action: "show", id: basicSchoolInformationInstance.id)
    }

    def delete(Long id) {
        def basicSchoolInformationInstance = BasicSchoolInformation.get(id)
        if (!basicSchoolInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
            return
        }

        try {
            basicSchoolInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "show", id: id)
        }
    }


    def filter(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.offset = params?.offset ?: 0
        def offset = params.int('offset')
        def maxi = params.int('max') + offset

        def filterResults
        def count
        if (session["filterResults"] == null)  {
            def ufr = BasicSchoolInformation.list()
            session["filterResults"] = ufr
            session["filterResultsCount"] = BasicSchoolInformation.count()
            count = session["filterResultsCount"]

            maxi = (maxi >= count) ? (count - 1) : maxi
            if (maxi >= 0) {
                filterResults =  ufr[offset .. maxi ]
            }
            else {
                filterResults = null
            }
        }
        else {
            def ufr = session["filterResults"]
            count = session["filterResultsCount"]
            maxi = (maxi >= count) ? (count - 1) : maxi
            if (maxi >= 0) {
                filterResults =  ufr[offset .. maxi ]
            }
            else {
                filterResults = null
            }
        }

        render(view: 'filter', model: ['basicSchoolInformationInstanceList': filterResults, 'basicSchoolInformationInstanceTotal': count])
    }

    //This method strips quotes from the beginning and end of strings. Partially quoted strings are assumed to be
    //so intended and not an xls import artifact.
    //If the string is of length zero or null it returns null
    //If it has no quotes (on both sides) it returns the string
    static String stripStringQuotes(String s) {
        if (s==null) {
            return null
        }

        def l = s.size()
        if (l == 0) {
            return null
        }

        if (s[0]=='' && s[l-1]=='') {
            return s.substring(1,l-1)
        }  else
        {
            return s
        }
    }

    def filterBy(Integer max) {
        def   filterResults   = filterSchools(params)
        session["filterResults"] = filterResults
        def count = filterResults.size()
        session["filterResultsCount"] = count
        if (count ==0 ) {
            render(view: 'filter', model: ['basicSchoolInformationInstanceList': null, 'basicSchoolInformationInstanceTotal': count])
            return
        }

        def offset = params.int('offset') ?: 0
        def maxi = params.int('max') ?: 10
        maxi = maxi + offset
        maxi = (maxi >= count) ? (count - 1) : maxi
        def newFilterResults =  filterResults[offset .. maxi]
        //    if (count>10) {
        render(view: 'sabc1', model: ['basicSchoolInformationInstanceList': newFilterResults, 'basicSchoolInformationInstanceTotal': count])
        //    } else
        //   {
    //    render(view: 'sabc1', model: ['AaaInstanceList': newFilterResults, 'AaaInstanceTotal': count])
        //   }
    }

    def filterSchools(params) {
        // def searchResults = {
        def basicSchoolInformationCriteria = BasicSchoolInformation.createCriteria()
        def results

        def districtMunicipality =  stripStringQuotes(params?.districtMunicipality)
        def cdistrictMunicipality = "${districtMunicipality}"

        def province =  stripStringQuotes(params?.province)
        def cprovince = "${province}"

        def town_City =  stripStringQuotes(params?.town_City)
        def ctown_City = "${town_City}"

        def phase_c = params?.phase_c
        def phase_i = params?.phase_i
        def phase_p = params?.phase_p
        def phase_s = params?.phase_s
        def phase_f = params?.phase_f
        def phase = (phase_c == 'on') || (phase_i == 'on') || (phase_p =='on') || (phase_s == 'on') || (phase_f=='on')


        def specialisation =  stripStringQuotes(params?.specialisation)
        def cspecialisation = "${specialisation}"

        def schoolName =  stripStringQuotes(params?.schoolName)
        def cschoolName = "${schoolName}"

        def sector_i = params?.sector_i
        def sector_p = params?.sector_p
        def sector = (sector_i=='on') || (sector_p=='on')

        def section21 =  stripStringQuotes(params?.section21)

        def noFeeSchool =  stripStringQuotes(params?.noFeeSchool)

        def boardingSchool =  stripStringQuotes(params?.boardingSchool)

        def quintile =  stripStringQuotes(params?.quintile)
        def cquintile = "${quintile}"

        def message = "Search: "

        results =   basicSchoolInformationCriteria.list() {
            if (province && province != 'No Selection') {
                ilike("province", cprovince)
                message += " province: " + province
            }

            if (districtMunicipality && districtMunicipality != 'No Selection') {
                ilike("districtMunicipality", cdistrictMunicipality)
                message += " district: " + districtMunicipality
            }

            and {
                if (phase == true) {
                    or {
                        if (phase_c) {
                            ilike("phase", 'COMBINED SCHOOL')
                            message += " phase: combined"
                        }

                        if (phase_i) {
                            ilike("phase", 'INTERMEDIATE SCHOOL')
                            message += " phase: intermediate"
                        }


                        if (phase_p) {
                            ilike("phase", 'PRIMARY SCHOOL')
                            message += " phase: primary"
                        }


                        if (phase_s) {
                            ilike("phase", 'SECONDARY SCHOOL')
                            message += " phase: secondary"
                        }


                        if (phase_f) {
                            ilike("phase", 'FINISHING SCHOOL')
                            message += " phase: finishing"
                        }
                    }
                }
            }

            and {
                if (town_City) {
                    ilike("town_City", ctown_City)
                    message += " town: " + town_City
                }
            }

            and {
                if (specialisation && specialisation != 'No Selection') {
                    ilike("specialisation", cspecialisation)
                    message += " specialisation: " + specialisation
                }
            }

            and {
                if (schoolName) {
                    ilike("schoolName", cschoolName)
                    message += " schoolName: " + cschoolName
                }
            }

            and {
                if (sector == true) {
                    or {
                        if (sector_i) {
                            ilike("sector", 'INDEPENDENT')
                            message += " sector: independent"
                        }

                        if (sector_p) {
                            ilike("sector", 'PUBLIC')
                            message += " sector: public"
                        }
                    }
                }
            }

            and {
                if (section21 == 'on') {
                    ilike("section21", 'YES')
                    message += " section21: " + section21
                }
            }

            and {
                if (noFeeSchool == 'on') {
                    ilike("noFeeSchool", 'YES')
                    message += " noFeeSchool: " + noFeeSchool
                }
            }

            and {
                if (boardingSchool == 'on') {
                    ilike("boardingSchool", 'TRUE')
                    message += " boardingSchool: " + boardingSchool
                }
            }

            and {
                if (quintile && quintile != 'No Selection') {
                    ilike("quintile", cquintile)
                    message += " quintile: " + quintile
                }
            }
        }
        session["message"]= message
        return results
    }

    def map() {
    }

}
