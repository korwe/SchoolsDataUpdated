package schoolsdata

import java.util.Locale
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import grails.converters.*;
/*
* author: david DOT hislop AT korwe DOT com
* 18/4/2014
* version 1.2
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

        // Preload the preferred locales
        if (session["locales"] == null) session["locales"] = getPreferredLocales()

    }

    def getPreferredLocales() {

        // List of preferred locales catered for
        // User selection is limited to this preferred list
        // Could be written more elegantly, but the purpose is to show functionality
        // Could be a configuration/properties. See http://grails.org/plugin/locale-configuration

        return [new Locale("en"),
                new Locale("af"),
                new Locale("xh"),
                new Locale("zu"),
                new Locale("ve"),
                new Locale("ss"),
                new Locale("st"),
                new Locale("ts"),
                new Locale("nr"),
                new Locale("tn")]
    }

    def changeLanguage() {
        log.info(" Language changed to: " + new Locale(params?.lang).getDisplayLanguage())
        session['lang'] = params?.lang
    }

    def reset() {
        session.invalidate()
        redirect(action: "index")
    }

    def index() {
    }

    def getQuintiles() {
        log.info(" BasicSchoolInformationController getQuintiles")
        def result = BasicSchoolInformation.executeQuery("select distinct a.quintile from BasicSchoolInformation a order by a.quintile asc")
        [result: result]
    }

    def getProvinces() {
        log.info(" BasicSchoolInformationController getProvinces")
        def result = BasicSchoolInformation.executeQuery("select distinct a.province from BasicSchoolInformation a order by a.province asc")
        [result: result]
    }

    def getMunicipalities() {
        log.info(" BasicSchoolInformationController getMunicipalities")
        def result = BasicSchoolInformation.executeQuery("select distinct a.districtMunicipality from BasicSchoolInformation a order by a.districtMunicipality asc")
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
        def result = BasicSchoolInformation.executeQuery("select distinct a.specialisation from BasicSchoolInformation a order by a.specialisation asc")
        [result: result]
    }

    def filter(Integer max) {
        def filterResults = BasicSchoolInformation.executeQuery('from BasicSchoolInformation order by rand()', [max: pageListSize])

        def basicSchoolInformationInstanceSearchParams = new BasicSchoolInformation()
        filterResults.add(0, basicSchoolInformationInstanceSearchParams)//placeholder for dummySchoolInformationSearchParams

        def basicSchoolInformationTotal = filterResults.size()//includes zero dummy element of search paras
        def totalSchools = BasicSchoolInformation.count()//excludes zero dummy element
        render(
                view    : 'index',
                model   : [ 'basicSchoolInformationList'         : filterResults,
                            'totalSchools'                       : totalSchools,
                            'basicSchoolInformationTotal'        : basicSchoolInformationTotal])
    }

    def filterFromForm(Integer max) {
        def filterResults = filterSchools(params)
        def totalSchools = filterResults?.totalSchools
        if (totalSchools == 0) {
            render(
                    view   : 'index',
                    model  : [    'basicSchoolInformationList'            : null,
                                  'totalSchools'                          : 0,
                                  'basicSchoolInformationTotal'           : 0])
            return
        }

        def basicSchoolInformationList = filterResults.basicSchoolInformationList
        def basicSchoolInformationTotal = basicSchoolInformationList.size()
        render(
                view        : 'index',
                model       : [ 'basicSchoolInformationList'            : basicSchoolInformationList,
                                'totalSchools'                          : totalSchools,
                                'basicSchoolInformationTotal'           : basicSchoolInformationTotal])
    }

    def filterSchools(params) {
        def districtMunicipality = params?.districtMunicipality
        def cdistrictMunicipality = "${districtMunicipality}"

        def province = params?.province
        def cprovince = "${province}"

        def town_City = params?.town_City
        def ctown_City = "${town_City}"

        def phase_c = params?.phase_c
        def phase_i = params?.phase_i
        def phase_p = params?.phase_p
        def phase_s = params?.phase_s
        def phase_f = params?.phase_f
        def phase = (phase_c == 'on') || (phase_i == 'on') || (phase_p == 'on') || (phase_s == 'on') || (phase_f == 'on')

        def specialisation = params?.specialisation
        def cspecialisation = "${specialisation}"

        def schoolName = params?.schoolName
        def cschoolName = "${schoolName}"

        def sector_i = params?.sector_i
        def sector_p = params?.sector_p
        def sector = (sector_i == 'on') || (sector_p == 'on')

        def section21 = params?.section21

        def noFeeSchool = params?.noFeeSchool

        def boardingSchool = params?.boardingSchool

        def quintile = params?.quintile
        def cquintile = "${quintile}"

        def dummySchoolInformationSearchParams = new BasicSchoolInformation()

        if (schoolName) {
            dummySchoolInformationSearchParams.schoolName = schoolName
        }

        if (province) {
            dummySchoolInformationSearchParams.province = province
        }

        if (districtMunicipality) {
            dummySchoolInformationSearchParams.districtMunicipality = districtMunicipality
        }

        if (phase_c) {
            dummySchoolInformationSearchParams.phase = "COMBINED SCHOOL"
        }

        if (phase_i) {
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "INTERMEDIATE SCHOOL"
        }

        if (phase_p) {
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "PRIMARY SCHOOL"
        }

        if (phase_f) {
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "FINISHING SCHOOL"
        }

        if (phase_s) {
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "SECONDARY SCHOOL"
        }

        if (town_City) {
            dummySchoolInformationSearchParams.town_City = town_City
            flagChangeSchoolInformationSearchParams = true
        }

        if (specialisation) {
            dummySchoolInformationSearchParams.specialisation = specialisation
            flagChangeSchoolInformationSearchParams = true
        }

        if (quintile) {
            dummySchoolInformationSearchParams.quintile = quintile
            flagChangeSchoolInformationSearchParams = true
        }

        if (sector_i) {
            dummySchoolInformationSearchParams.sector = "INDEPENDENT"
        }

        if (sector_p) {
            def seperator = ''
            if (dummySchoolInformationSearchParams.sector) seperator = '|'
            dummySchoolInformationSearchParams.sector += seperator + "PUBLIC"
        }

        if (section21 == 'on') {
            dummySchoolInformationSearchParams.section21 = "YES"
        }

        if (noFeeSchool == 'on') {
            dummySchoolInformationSearchParams.noFeeSchool = "YES"
        }

        if (boardingSchool == 'on') {
            dummySchoolInformationSearchParams.boardingSchool = "YES"
        }

        def conditionals = {
            if (province && province != 'No Selection') {
                ilike("province", cprovince)
                log.info( " province: " + province)
            }

            if (districtMunicipality && districtMunicipality != 'No Selection') {
                ilike("districtMunicipality", cdistrictMunicipality)
                log.info( " district: " + districtMunicipality)
            }

            and {
                if (phase == true) {
                    or {
                        if (phase_c) {
                            ilike("phase", 'COMBINED SCHOOL')
                            log.info( " phase: combined")
                        }

                        if (phase_i) {
                            ilike("phase", 'INTERMEDIATE SCHOOL')
                            log.info( " phase: intermediate")
                        }

                        if (phase_p) {
                            ilike("phase", 'PRIMARY SCHOOL')
                            log.info( " phase: primary")
                        }

                        if (phase_s) {
                            ilike("phase", 'SECONDARY SCHOOL')
                            log.info( " phase: secondary")
                        }

                        if (phase_f) {
                            ilike("phase", 'FINISHING SCHOOL')
                            log.info( " phase: finishing")
                        }
                    }
                }
            }

            and {
                if (town_City) {
                    ilike("town_City", ctown_City)
                    log.info( " town: " + town_City)
                }
            }

            and {
                if (specialisation && specialisation != 'No Selection') {
                    ilike("specialisation", cspecialisation)
                    log.info( " specialisation: " + specialisation)
                }
            }

            and {
                if (schoolName) {
                    ilike("schoolName", cschoolName)
                    log.info( " schoolName: " + cschoolName)
                }
            }

            and {
                if (sector == true) {
                    or {
                        if (sector_i) {
                            ilike("sector", 'INDEPENDENT')
                            log.info( " sector: independent")
                        }

                        if (sector_p) {
                            ilike("sector", 'PUBLIC')
                            log.info( " sector: public")
                        }
                    }
                }
            }

            and {
                if (section21 == 'on') {
                    ilike("section21", 'YES')
                    log.info( " section21: " + section21)
                }
            }

            and {
                if (noFeeSchool == 'on') {
                    ilike("noFeeSchool", 'YES')
                    log.info( " noFeeSchool: " + noFeeSchool)
                }
            }

            and {
                if (boardingSchool == 'on') {
                    ilike("boardingSchool", 'TRUE')
                    log.info( " boardingSchool: " + boardingSchool)
                }
            }

            and {
                if (quintile && quintile != 'No Selection') {
                    ilike("quintile", cquintile)
                    log.info( " quintile: " + quintile)
                }
            }

            and {
                if (params?.edge) {
                    def list = JSON.parse(params.edge); // Parse the JSON String
                    float latitudeMin = list.latitudeMin
                    float latitudeMax = list.latitudeMax
                    float longitudeMin = list.longitudeMin
                    float longitudeMax = list.longitudeMax
                    between("latitude", latitudeMin, latitudeMax)
                    between("longitude", longitudeMin, longitudeMax)
                    log.info("longitudeMin: " + longitudeMin +" longitudeMax: " + longitudeMax + " latitudeMin: " +
                            latitudeMin + " latitudeMax: " + latitudeMax)
                }
            }
            maxResults(pageListSize)
            sqlRestriction(" 1=1  order by rand() asc")
            //order("town_City")
        }

        log.info("Doing SELECT")
        def basicSchoolInformationList
        try {
            basicSchoolInformationList = BasicSchoolInformation.createCriteria().list(conditionals)
        } catch (Exception ex) {
            log.info(ex.getMessage())
        }
        log.info("basicSchoolInformationTotal = " +basicSchoolInformationList?.size())

        log.info("Doing COUNT")
        def totalSchools  = BasicSchoolInformation.createCriteria().get() {
            conditionals.delegate = delegate
            conditionals()
            projections {
                rowCount()
            }
        }
        log.info("totalSchools = " +totalSchools)

        if (basicSchoolInformationList == null) {
            log.info("Init Array")
            basicSchoolInformationList = new ArrayList<BasicSchoolInformation>();
        }
        basicSchoolInformationList.add(0, session["dummySchoolInformationSearchParams"])
        return [basicSchoolInformationList: basicSchoolInformationList, totalSchools: totalSchools]
    }

    def filterByLatLong() {
        def edge = params.edge
        def list = JSON.parse(edge); // Parse the JSON String

        def latitudeMin = list.latitudeMin
        def longitudeMin = list.longitudeMin
        def latitudeMax = list.latitudeMax
        def longitudeMax = list.longitudeMax
        def zm = list.zoom

        //log.info("latMin " + latitudeMin + " lamMax=" + latitudeMax + " longitudeMin=" + longitudeMin + " longitudeMax=" + longitudeMax)
        def filterResults = filterSchools(params)
        def totalSchools = filterResults.totalSchools
        def basicSchoolInformationList = filterResults.basicSchoolInformationList
        def basicSchoolInformationTotal = basicSchoolInformationList?.size()
        log.info("totalSchools = "+totalSchools)
        log.info("basicSchoolInformationTotal = "+basicSchoolInformationTotal)
        def midLat = (latitudeMax + latitudeMin) / 2.0
        def midLong = (longitudeMax + longitudeMin) / 2.0
        render(
                view        : 'basicSchoolInformation',
                model: ['basicSchoolInformationList'         : basicSchoolInformationList,
                        'basicSchoolInformationTotal'        : basicSchoolInformationTotal,
                        'totalSchools'                       : totalSchools,
                        'zoom'                               : zm,
                        'midLat'                             : midLat,
                        'midLong'                            : midLong])
    }
}
