package schoolsdata

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
    }

    def reset() {
        session.invalidate()
        redirect(action: "filter")
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
        filterResults.add(0, basicSchoolInformationInstanceSearchParams)//placeholder for cachedSchoolInformationSearchParams

        def basicSchoolInformationTotal = filterResults.size()//includes zero dummy element of search paras
        def totalSchools = BasicSchoolInformation.count()//excludes zero dummy element
        render(
                view    : 'filter',
                model   : [ 'basicSchoolInformationList'         : filterResults,
                            'totalSchools'                       : totalSchools,
                                'basicSchoolInformationTotal'        : basicSchoolInformationTotal])
    }

    def filterFromForm(Integer max) {
        def filterResults = filterSchools(params)
        def totalSchools = filterResults?.totalSchools
        if (totalSchools == 0) {
            render(
                    view   : 'filter',
                    model  : [    'basicSchoolInformationList'            : null,
                                  'totalSchools'                          : 0,
                                  'basicSchoolInformationTotal'           : 0])
            return
        }

        def basicSchoolInformationList = filterResults.basicSchoolInformationList
        def basicSchoolInformationTotal = basicSchoolInformationList.size()
        render(
                view        : 'filter',
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

        def specialisation = params?.specialisation
        def cspecialisation = "${specialisation}"

        def schoolName = params?.schoolName
        def cschoolName = "${schoolName}"

        def sector_i = params?.sector_i
        def sector_p = params?.sector_p

        def section21 = params?.section21

        def noFeeSchool = params?.noFeeSchool

        def boardingSchool = params?.boardingSchool

        def quintile = params?.quintile
        def cquintile = "${quintile}"

        BasicSchoolInformation cachedSchoolInformationSearchParams = session["cachedSchoolInformationSearchParams"]
        if (cachedSchoolInformationSearchParams == null) {
            cachedSchoolInformationSearchParams = new BasicSchoolInformation()
            session["cachedSchoolInformationSearchParams"] = cachedSchoolInformationSearchParams
        }

        def dummySchoolInformationSearchParams = new BasicSchoolInformation()
        boolean flagChangeSchoolInformationSearchParams = false

        if (schoolName && schoolName != cachedSchoolInformationSearchParams?.schoolName) {
            log.debug("schoolName:"+schoolName)
            dummySchoolInformationSearchParams.schoolName = schoolName
            flagChangeSchoolInformationSearchParams = true
        }

        if (province && province != cachedSchoolInformationSearchParams?.province) {
            log.debug("province:"+province)
            dummySchoolInformationSearchParams.province = province
            flagChangeSchoolInformationSearchParams = true
        }

        if (districtMunicipality && districtMunicipality != cachedSchoolInformationSearchParams?.districtMunicipality) {
            log.debug("districtMunicipality:"+districtMunicipality)
            dummySchoolInformationSearchParams.districtMunicipality = districtMunicipality
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (phase_c && !cachedSchoolInformationSearchParams?.phase ) ||
                (phase_c && cachedSchoolInformationSearchParams?.phase  && !cachedSchoolInformationSearchParams?.phase.contains("COMBINED SCHOOL")) ) {
            log.debug("phase:"+phase_c)
            dummySchoolInformationSearchParams.phase = "COMBINED SCHOOL"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!phase_c && cachedSchoolInformationSearchParams?.phase  && cachedSchoolInformationSearchParams?.phase.contains("COMBINED SCHOOL")) ) {
            log.debug("phase:"+phase_c)
            dummySchoolInformationSearchParams.phase.replace("COMBINED SCHOOL|","")
            dummySchoolInformationSearchParams.phase.replace("|COMBINED SCHOOL","")
            dummySchoolInformationSearchParams.phase.replace("COMBINED SCHOOL","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (phase_i && !cachedSchoolInformationSearchParams?.phase ) ||
                (phase_i && cachedSchoolInformationSearchParams?.phase  && !cachedSchoolInformationSearchParams?.phase.contains("INTERMEDIATE SCHOOL")) ) {
            log.debug("phase:"+phase_i)
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "INTERMEDIATE SCHOOL"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!phase_i  && cachedSchoolInformationSearchParams?.phase && cachedSchoolInformationSearchParams?.phase.contains("INTERMEDIATE SCHOOL")) ) {
            log.debug("phase:"+phase_i)
            dummySchoolInformationSearchParams.phase.replace("INTERMEDIATE SCHOOL|","")
            dummySchoolInformationSearchParams.phase.replace("|INTERMEDIATE SCHOOL","")
            dummySchoolInformationSearchParams.phase.replace("INTERMEDIATE SCHOOL","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (phase_p && !cachedSchoolInformationSearchParams?.phase ) ||
                (phase_p && cachedSchoolInformationSearchParams?.phase && !cachedSchoolInformationSearchParams?.phase.contains("PRIMARY SCHOOL")) ) {
            log.debug("phase:"+phase_p)
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "PRIMARY SCHOOL"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!phase_p  && cachedSchoolInformationSearchParams?.phase  && cachedSchoolInformationSearchParams?.phase.contains("PRIMARY SCHOOL")) ) {
            log.debug("phase:"+phase_p)
            dummySchoolInformationSearchParams.phase.replace("PRIMARY SCHOOL|","")
            dummySchoolInformationSearchParams.phase.replace("|PRIMARY SCHOOL","")
            dummySchoolInformationSearchParams.phase.replace("PRIMARY SCHOOL","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (phase_f && !cachedSchoolInformationSearchParams?.phase) ||
                (phase_f && cachedSchoolInformationSearchParams?.phase  && !cachedSchoolInformationSearchParams?.phase.contains("FINISHING SCHOOL")) ) {
            log.debug("phase:"+phase_f)
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "FINISHING SCHOOL"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!phase_f && cachedSchoolInformationSearchParams?.phase && cachedSchoolInformationSearchParams?.phase.contains("FINISHING SCHOOL")) ) {
            log.debug("phase:"+phase_f)
            dummySchoolInformationSearchParams.phase.replace("FINISHING SCHOOL|","")
            dummySchoolInformationSearchParams.phase.replace("|FINISHING SCHOOL","")
            dummySchoolInformationSearchParams.phase.replace("FINISHING SCHOOL","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (phase_s && !cachedSchoolInformationSearchParams?.phase ) ||
                (phase_s && cachedSchoolInformationSearchParams?.phase && !cachedSchoolInformationSearchParams?.phase.contains("SECONDARY SCHOOL")) ) {
            log.debug("phase:"+phase_s)
            def seperator = ''
            if (dummySchoolInformationSearchParams.phase) seperator = '|'
            dummySchoolInformationSearchParams.phase += seperator + "SECONDARY SCHOOL"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!phase_s  && cachedSchoolInformationSearchParams?.phase && cachedSchoolInformationSearchParams?.phase.contains("SECONDARY SCHOOL")) ) {
            log.debug("phase:"+phase_s)
            dummySchoolInformationSearchParams.phase.replace("SECONDARY SCHOOL|","")
            dummySchoolInformationSearchParams.phase.replace("|SECONDARY SCHOOL","")
            dummySchoolInformationSearchParams.phase.replace("SECONDARY SCHOOL","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (town_City && town_City != cachedSchoolInformationSearchParams?.town_City) {
            log.debug("town:"+town_City)
            dummySchoolInformationSearchParams.town_City = town_City
            flagChangeSchoolInformationSearchParams = true
        }

        if (specialisation && specialisation != cachedSchoolInformationSearchParams?.specialisation) {
            log.debug("specialisation:"+specialisation)
            dummySchoolInformationSearchParams.specialisation = specialisation
            flagChangeSchoolInformationSearchParams = true
        }

        if (quintile && quintile != cachedSchoolInformationSearchParams?.quintile) {
            log.debug("quintile:"+quintile)
            dummySchoolInformationSearchParams.quintile = quintile
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (sector_i && !cachedSchoolInformationSearchParams?.sector ) ||
                (sector_i && cachedSchoolInformationSearchParams?.sector  && !cachedSchoolInformationSearchParams?.sector.contains("INDEPENDENT")) ) {
            log.debug("sector:"+sector_i)
            dummySchoolInformationSearchParams.sector = "INDEPENDENT"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!sector_i && cachedSchoolInformationSearchParams?.sector && cachedSchoolInformationSearchParams?.sector.contains("INDEPENDENT")) ) {
            log.debug("sector: clear")
            dummySchoolInformationSearchParams.phase.replace("INDEPENDENT|","")
            dummySchoolInformationSearchParams.phase.replace("|INDEPENDENT","")
            dummySchoolInformationSearchParams.phase.replace("INDEPENDENT","")
            flagChangeSchoolInformationSearchParams = true
        }

        if (    (sector_p && !cachedSchoolInformationSearchParams?.sector) ||
                (sector_p && cachedSchoolInformationSearchParams?.sector && !cachedSchoolInformationSearchParams?.sector.contains("PUBLIC")) ) {
            log.debug("sector:"+sector_p)
            dummySchoolInformationSearchParams.sector = "PUBLIC"
            flagChangeSchoolInformationSearchParams = true
        }
        else if ((!sector_p  && cachedSchoolInformationSearchParams?.sector && cachedSchoolInformationSearchParams?.sector.contains("PUBLIC")) ) {
            log.debug("sector:clear")
            dummySchoolInformationSearchParams.phase.replace("PUBLIC|","")
            dummySchoolInformationSearchParams.phase.replace("|PUBLIC","")
            dummySchoolInformationSearchParams.phase.replace("PUBLIC","")
            flagChangeSchoolInformationSearchParams = true
        }

        if ( (section21 == 'on' && !cachedSchoolInformationSearchParams?.section21 ) ||
             (section21 != 'on' && cachedSchoolInformationSearchParams?.section21  &&  !cachedSchoolInformationSearchParams?.section21.contains("YES"))) {
            log.debug("section21:"+section21)
            dummySchoolInformationSearchParams.section21 = "YES"
            flagChangeSchoolInformationSearchParams = true
        } else if ( (section21 != 'on'&& cachedSchoolInformationSearchParams?.section21  && cachedSchoolInformationSearchParams?.section21.contains("YES"))) {
            log.debug("section21:"+section21)
            dummySchoolInformationSearchParams.section21 = "NO"
            flagChangeSchoolInformationSearchParams = true
        }

        if ( (noFeeSchool == 'on' && !cachedSchoolInformationSearchParams?.noFeeSchool) ||
                (noFeeSchool != 'on' && cachedSchoolInformationSearchParams?.noFeeSchool &&  !cachedSchoolInformationSearchParams?.noFeeSchool.contains("YES"))) {
            log.debug("noFeeSchool:"+noFeeSchool)
            dummySchoolInformationSearchParams.noFeeSchool = "YES"
            flagChangeSchoolInformationSearchParams = true
        } else if ( (noFeeSchool != 'on' && cachedSchoolInformationSearchParams?.noFeeSchool && cachedSchoolInformationSearchParams?.noFeeSchool.contains("YES"))) {
            log.debug("noFeeSchool:"+noFeeSchool)
            dummySchoolInformationSearchParams.noFeeSchool = "NO"
            flagChangeSchoolInformationSearchParams = true
        }

        if ( (boardingSchool == 'on' && !cachedSchoolInformationSearchParams?.boardingSchool ) ||
                (boardingSchool != 'on' && cachedSchoolInformationSearchParams?.boardingSchool &&  !cachedSchoolInformationSearchParams?.boardingSchool.contains("YES"))) {
            log.debug("boardingSchool:"+boardingSchool)
            dummySchoolInformationSearchParams.boardingSchool = "YES"
            flagChangeSchoolInformationSearchParams = true
        } else if ( (boardingSchool != 'on' && cachedSchoolInformationSearchParams?.boardingSchool && cachedSchoolInformationSearchParams?.boardingSchool.contains("YES"))) {
            log.debug("boardingSchool:"+boardingSchool)
            dummySchoolInformationSearchParams.boardingSchool = "NO"
            flagChangeSchoolInformationSearchParams = true
        }

        if (flagChangeSchoolInformationSearchParams ) {
            log.info("Caching search params")
            session["cachedSchoolInformationSearchParams"] = dummySchoolInformationSearchParams
        }

        def conditionals = {
            if ((dummySchoolInformationSearchParams?.province) && (dummySchoolInformationSearchParams?.province != 'No Selection')) {
                ilike("province", cprovince)
                log.info( " province: " + province)
            }

            if ((dummySchoolInformationSearchParams?.districtMunicipality ) && (dummySchoolInformationSearchParams?.districtMunicipality != 'No Selection')) {
                ilike("districtMunicipality", cdistrictMunicipality)
                log.info( " district: " + districtMunicipality)
            }

            and {
                if (dummySchoolInformationSearchParams?.phase ) {
                    or {
                        if (cachedSchoolInformationSearchParams?.phase.contains("COMBINED SCHOOL")) {
                            ilike("phase", 'COMBINED SCHOOL')
                            log.info( " phase: combined")
                        }

                        if (cachedSchoolInformationSearchParams?.phase.contains("INTERMEDIATE SCHOOL")) {
                            ilike("phase", 'INTERMEDIATE SCHOOL')
                            log.info( " phase: intermediate")
                        }

                        if (cachedSchoolInformationSearchParams?.phase.contains("PRIMARY SCHOOL")) {
                            ilike("phase", 'PRIMARY SCHOOL')
                            log.info( " phase: primary")
                        }

                        if (cachedSchoolInformationSearchParams?.phase.contains("SECONDARY SCHOOL")) {
                            ilike("phase", 'SECONDARY SCHOOL')
                            log.info( " phase: secondary")
                        }

                        if (cachedSchoolInformationSearchParams?.phase.contains("FINISHING SCHOOL")) {
                            ilike("phase", 'FINISHING SCHOOL')
                            log.info( " phase: finishing")
                        }
                    }
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.town_City) {
                    ilike("town_City", ctown_City)
                    log.info( " town: " + town_City)
                }
            }

            and {
                if ((dummySchoolInformationSearchParams?.specialisation ) && (dummySchoolInformationSearchParams?.specialisation != 'No Selection')) {
                    ilike("specialisation", cspecialisation)
                    log.info( " specialisation: " + specialisation)
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.schoolName) {
                    ilike("schoolName", cschoolName)
                    log.info( " schoolName: " + cschoolName)
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.sector != null) {
                    or {
                        if (cachedSchoolInformationSearchParams?.sector.contains("INDEPENDENT")) {
                            ilike("sector", 'INDEPENDENT')
                            log.info( " sector: independent")
                        }

                        if (cachedSchoolInformationSearchParams?.sector.contains("PUBLIC")) {
                            ilike("sector", 'PUBLIC')
                            log.info( " sector: public")
                        }
                    }
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.section21 == 'YES') {
                    ilike("section21", 'YES')
                    log.info( " section21: " + section21)
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.noFeeSchool == 'YES') {
                    ilike("noFeeSchool", 'YES')
                    log.info( " noFeeSchool: " + noFeeSchool)
                }
            }

            and {
                if (dummySchoolInformationSearchParams?.boardingSchool == 'YES') {
                    ilike("boardingSchool", 'TRUE')
                    log.info( " boardingSchool: " + boardingSchool)
                }
            }

            and {
                if ((dummySchoolInformationSearchParams?.quintile != null)&&(dummySchoolInformationSearchParams?.quintile != 'No Selection')) {
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
        basicSchoolInformationList.add(0, session["cachedSchoolInformationSearchParams"])
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
