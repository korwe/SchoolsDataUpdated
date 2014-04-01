package schoolsdata

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*;
/*
* author: david DOT hislop AT korwe DOT com
* 26/3/2014
* version 1.1
*/

class BasicSchoolInformationController {
    private Logger Log = LoggerFactory.getLogger(this.getClass());

    //def authenticationService
    //The first element in the list is the search parameter
    def pageListSize = 300

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    BasicSchoolInformationController() {
        log.info(" BasicSchoolInformationController ctor")
        if (session["provinces"] == null) session["provinces"] = getProvinces().result
        if (session["districtMunicipality"] == null) session["districtMunicipality"] = getMunicipalities().sort().result
        if (session["specialisation"] == null) session["specialisation"] = getSpecialisations().sort().result
        if (session["quintile"] == null) session["quintile"] = getQuintiles().sort().result
        if (session["pageListSize"] == null) session["pageListSize"] = pageListSize
    }

    def reset() {
        session.invalidate()
        redirect(action: "index")
    }

    def mappedSchoolInformation() {
    }

    def basicSchoolInformation(Long id) {
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
        log.info(" BasicSchoolInformationController getQuintiles")
        def result = BasicSchoolInformation.executeQuery("select distinct a.quintile from BasicSchoolInformation a  order by a.quintile asc")
        [result: result]
    }

    def getProvinces() {
        log.info(" BasicSchoolInformationController getProvinces")
        def result = BasicSchoolInformation.executeQuery("select distinct a.province from BasicSchoolInformation a  order by a.province asc")
        [result: result]
    }

    def getMunicipalities() {
        log.info(" BasicSchoolInformationController getMunicipalities")
        def result = BasicSchoolInformation.executeQuery("select distinct a.districtMunicipality from BasicSchoolInformation a  order by a.districtMunicipality asc")
        [result: result]
    }

    def getMunicipalitiesByProvince(province) {
        log.info(" BasicSchoolInformationController getMunicipalitiesByProvince " + province)
        def result = BasicSchoolInformation.executeQuery("select distinct a.districtMunicipality from BasicSchoolInformation a where province=\'" + province + "\' order by a.districtMunicipality asc")
        [result: result]
    }


    def getTownsByMunicipalities(districtMunicipality) {
        log.info(" BasicSchoolInformationController getTownsByMunicipalities" + districtMunicipality)
        def result = BasicSchoolInformation.executeQuery("select distinct a.town_City from BasicSchoolInformation a  where districtMunicipality=\'" + districtMunicipality + "\' order by a.town_City asc")
        [result: result]
    }

    def getSpecialisations() {
        log.info(" BasicSchoolInformationController getSpecialisations")
        def result = BasicSchoolInformation.executeQuery("select distinct a.specialisation from BasicSchoolInformation a  order by a.specialisation asc")
        [result: result]
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
            Log.error("DataIntegrityViolationException", e)
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation'), id])
            redirect(action: "show", id: id)
        }
    }

    def filter(Integer max) {
        def ufr
        if (session["filterResults"] == null) {
            ufr = BasicSchoolInformation.executeQuery('from BasicSchoolInformation order by rand()', [max: pageListSize])

            def basicSchoolInformationInstanceSearchParams = new BasicSchoolInformation()
            ufr.add(0, basicSchoolInformationInstanceSearchParams)

            session["filterResults"] = ufr
        } else {
            ufr = session["filterResults"]
        }

        def totalSchools = ufr.size()//includes zeroth

        params.max = max ?: pageListSize
        params.offset = params?.offset ?: 0
        def offset = params.int('offset')
        def maxi = params.int('max') + offset

        maxi = (maxi >= totalSchools) ? (totalSchools - 1) : maxi
        def filterResults = ufr[offset..maxi]

        def count = filterResults.size()//includes zeroth

        render(view: 'mappedSchoolInformation',
                model: ['basicSchoolInformationInstanceList': filterResults, 'basicSchoolInformationInstanceTotal': count, 'totalSchools': totalSchools])
    }

    //This method strips quotes from the beginning and end of strings. Partially quoted strings are assumed to be
    //so intended and not an xls import artifact.
    //If the string is of length zero or null it returns null
    //If it has no quotes (on both sides) it returns the string
    static String stripStringQuotes(String s) {
        if (s == null) {
            return null
        }

        def l = s.size()
        if (l == 0) {
            return null
        }

        if (s[0] == '' && s[l - 1] == '') {
            return s.substring(1, l - 1)
        } else {
            return s
        }
    }

    def filterBy(Integer max) {
        def filterResults = filterSchools(params)
        session["filterResults"] = filterResults
        def totalSchools = filterResults.size()
        if (totalSchools == 0) {
            render(view: 'mappedSchoolInformation', model: ['basicSchoolInformationInstanceList': null, 'basicSchoolInformationInstanceTotal': 0, 'totalSchools': totalSchools])
            return
        }

        def offset = params.int('offset') ?: 0
        def maxi = params.int('max') ?: pageListSize
        maxi = maxi + offset
        maxi = (maxi >= totalSchools) ? (totalSchools - 1) : maxi
        def newFilterResults = filterResults[offset..maxi]
        def count = newFilterResults.size()
        render(template: 'iframe.gsp', view: 'mappedSchoolInformation', model: ['basicSchoolInformationInstanceList': newFilterResults, 'basicSchoolInformationInstanceTotal': count, 'totalSchools': totalSchools])
    }

    def filterSchools(params) {
        def districtMunicipality = stripStringQuotes(params?.districtMunicipality)
        def cdistrictMunicipality = "${districtMunicipality}"

        def province = stripStringQuotes(params?.province)
        def cprovince = "${province}"

        def town_City = stripStringQuotes(params?.town_City)
        def ctown_City = "${town_City}"

        def phase_c = params?.phase_c
        def phase_i = params?.phase_i
        def phase_p = params?.phase_p
        def phase_s = params?.phase_s
        def phase_f = params?.phase_f
        def phase = (phase_c == 'on') || (phase_i == 'on') || (phase_p == 'on') || (phase_s == 'on') || (phase_f == 'on')

        def specialisation = stripStringQuotes(params?.specialisation)
        def cspecialisation = "${specialisation}"

        def schoolName = stripStringQuotes(params?.schoolName)
        def cschoolName = "${schoolName}"

        def sector_i = params?.sector_i
        def sector_p = params?.sector_p
        def sector = (sector_i == 'on') || (sector_p == 'on')

        def section21 = stripStringQuotes(params?.section21)

        def noFeeSchool = stripStringQuotes(params?.noFeeSchool)

        def boardingSchool = stripStringQuotes(params?.boardingSchool)

        def quintile = stripStringQuotes(params?.quintile)
        def cquintile = "${quintile}"

        def message = "Search: "
        def basicSchoolInformationInstanceSearchParams = new BasicSchoolInformation()
        basicSchoolInformationInstanceSearchParams.schoolName = schoolName
        basicSchoolInformationInstanceSearchParams.province = province
        basicSchoolInformationInstanceSearchParams.districtMunicipality = districtMunicipality

        if (phase_c) {
            basicSchoolInformationInstanceSearchParams.phase = "COMBINED SCHOOL"
        }
        if (phase_i) {
            def seperator = ''
            if (basicSchoolInformationInstanceSearchParams.phase) seperator = '|'
            basicSchoolInformationInstanceSearchParams.phase += seperator + "INTERMEDIATE SCHOOL"
        }
        if (phase_p) {
            def seperator = ''
            if (basicSchoolInformationInstanceSearchParams.phase) seperator = '|'
            basicSchoolInformationInstanceSearchParams.phase += seperator + "PRIMARY SCHOOL"
        }
        if (phase_f) {
            def seperator = ''
            if (basicSchoolInformationInstanceSearchParams.phase) seperator = '|'
            basicSchoolInformationInstanceSearchParams.phase += seperator + "FINISHING SCHOOL"
        }
        if (phase_s) {
            def seperator = ''
            if (basicSchoolInformationInstanceSearchParams.phase) seperator = '|'
            basicSchoolInformationInstanceSearchParams.phase += seperator + "SECONDARY SCHOOL"
        }
        basicSchoolInformationInstanceSearchParams.town_City = town_City
        basicSchoolInformationInstanceSearchParams.specialisation = specialisation
        basicSchoolInformationInstanceSearchParams.quintile = quintile

        if (sector_i) {
            basicSchoolInformationInstanceSearchParams.sector = "INDEPENDENT"
        }

        if (sector_p) {
            def seperator = ''
            if (basicSchoolInformationInstanceSearchParams.sector) seperator = '|'
            basicSchoolInformationInstanceSearchParams.sector += seperator + "PUBLIC"
        }

        if (section21 == 'on') {
            basicSchoolInformationInstanceSearchParams.section21 = "YES"
        }

        if (noFeeSchool == 'on') {
            basicSchoolInformationInstanceSearchParams.noFeeSchool = "YES"
        }

        if (boardingSchool == 'on') {
            basicSchoolInformationInstanceSearchParams.boardingSchool = "YES"
        }

        def basicSchoolInformationCriteria = BasicSchoolInformation.createCriteria()
        def results = basicSchoolInformationCriteria.list() {
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
        session["message"] = message
        results.add(0, basicSchoolInformationInstanceSearchParams)
        return results
    }

    def testLatLong() {
        def edge = params.edge
        def list = JSON.parse(edge); // Parse the JSON String

        def latitudeMin = list.latitudeMin
        def longitudeMin = list.longitudeMin
        def latitudeMax = list.latitudeMax
        def longitudeMax = list.longitudeMax
        def zm = list.zoom

        //log.info("latMin " + latitudeMin + " lamMax=" + latitudeMax + " longitudeMin=" + longitudeMin + " longitudeMax=" + longitudeMax)
        def filterResults = new ArrayList<BasicSchoolInformationController>()
        def count
        def nextList = pageListSize + 1
        if (session["filterResults"] == null) {
            return filterResults;
        }
        def ufr = session["filterResults"]
        def totalSchools = ufr.size()
        def int nLog = 0
        for (u in ufr) {
            if (filterResults.size() == 0) {
                filterResults.add(u)
                continue
            } else if (filterResults.size() > pageListSize) {
                //log.debug("Finished adding")
                break
            }
            nLog++
            def lat = u.latitude
            def lon = u.longitude
            if ((nLog <= pageListSize) && (((lat < latitudeMax) && (lat > latitudeMin)) && ((lon < longitudeMax) && (lon > longitudeMin)))) {
                filterResults.add(u)
                //log.info("Adding " + nLog)
            } else {
                // log.info("Missing "+(nLog-1))
                while (nextList < totalSchools) {
                    def u1 = ufr[nextList]
                    def lat1 = u1.latitude
                    def lon1 = u1.longitude
                    if (((lat1 < latitudeMax) && (lat1 > latitudeMin)) && ((lon1 < longitudeMax) && (lon1 > longitudeMin))) {
                        filterResults.add(u1)
                        //log.info("New " + nextList)
                        nextList++
                        break
                    }
                    nextList++
                }
            }
        }
        count = filterResults.size()
        def midLat = (latitudeMax + latitudeMin) / 2.0
        def midLong = (longitudeMax + longitudeMin) / 2.0
        render(view: 'mappedSchoolInformation', model: ['basicSchoolInformationInstanceList' : filterResults,
                                                        'basicSchoolInformationInstanceTotal': count,
                                                        'totalSchools'                       : totalSchools, 'zoom': zm,
                                                        'midLat'                             : midLat, 'midLong': midLong])
    }
}
