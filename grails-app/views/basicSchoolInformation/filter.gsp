<%@ page import="schoolsdata.BasicSchoolInformationController; schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
    <head>
    <%--
        * author: info AT korwe DOT com
        * 26/3/2014
        * version 1.1
    --%>
        <meta name="layout" content="skinny">
        <g:set var="entityName" value="${message(code: 'basicSchoolInformation.label', default: 'Basic School Info')}"/>
        <title><g:message code="basicSchoolInformation.label" args="[entityName]"/></title>
        <g:javascript library="jquery" />

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVNqjynDsI3fhW-v4J_3OW-ocbG2C7CDE&sensor=false">
        </script>
            <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-38983688-2', 'korwe.com');
            ga('send', 'pageview');
        </script>

        <script type="text/javascript">
            function initialize() {
                var mapDoc = document.getElementById("map-canvas");
                var midLat = ${midLat?:-28.5};
                var midLong = ${midLong?:24};
                var defZoom = ${zoom?:5};

                var mapOptions = { center: new google.maps.LatLng(midLat, midLong), zoom: defZoom};
                var map = new google.maps.Map(mapDoc, mapOptions);

                <g:each in="${basicSchoolInformationList}" status="i" var="basicSchoolInformationInstance">
                    <g:if test="${ (i != 0)}">
                   /*     var basicSchoolInformationSearchParams = {};
                        basicSchoolInformationSearchParams['schoolName'] = "${basicSchoolInformationInstance?.schoolName}";
                        basicSchoolInformationSearchParams['town_City'] = "${basicSchoolInformationInstance?.town_City}";
                        basicSchoolInformationSearchParams['sector'] = "${basicSchoolInformationInstance?.sector}";
                        basicSchoolInformationSearchParams['section21'] = "${basicSchoolInformationInstance?.section21}";
                        basicSchoolInformationSearchParams['noFeeSchool'] = "${basicSchoolInformationInstance?.noFeeSchool}";
                        basicSchoolInformationSearchParams['boardingSchool'] = "${basicSchoolInformationInstance?.boardingSchool}";
                        basicSchoolInformationSearchParams['districtMunicipality'] = "${basicSchoolInformationInstance?.districtMunicipality}";
                        basicSchoolInformationSearchParams['phase'] = "${basicSchoolInformationInstance?.phase}";
                        basicSchoolInformationSearchParams['specialisation'] = "${basicSchoolInformationInstance?.specialisation}";
                        basicSchoolInformationSearchParams['quintile'] = "${basicSchoolInformationInstance?.quintile}";
                        function basicSchoolInformationSearchParamsToString(basicSchoolInformationSearchParams) {
                            var ret = "{ schoolName: " + basicSchoolInformationSearchParams.schoolName + ", town_City:" + basicSchoolInformationSearchParams.town_City + ", sector:" + basicSchoolInformationSearchParams.sector + ", section21:" + basicSchoolInformationSearchParams.section21  + ", noFeeSchool:" + basicSchoolInformationSearchParams.noFeeSchool + ", boardingSchool:" + basicSchoolInformationSearchParams.boardingSchool + ", districtMunicipality:" + basicSchoolInformationSearchParams.districtMunicipality  + ", phase:" + basicSchoolInformationSearchParams.phase + ", specialisation:" + basicSchoolInformationSearchParams.specialisation + ", quintile:" + basicSchoolInformationSearchParams.quintile  +"}";
                            return ret;
                        }*/
                        <%--
                        <g:hiddenField name="xschoolName" value="${basicSchoolInformationInstance?.schoolName}"/>
                        <g:hiddenField name="xtown_City" value="${basicSchoolInformationInstance?.town_City}"/>
                        <g:hiddenField name="xsector" value="${basicSchoolInformationInstance?.sector}"/>
                        <g:hiddenField name="xsection21" value="${basicSchoolInformationInstance?.section21}"/>
                        <g:hiddenField name="xnoFeeSchool" value="${basicSchoolInformationInstance?.noFeeSchool}"/>
                        <g:hiddenField name="xboardingSchool" value="${basicSchoolInformationInstance?.boardingSchool}"/>
                        <g:hiddenField name="xdistrictMunicipality" value="${basicSchoolInformationInstance?.districtMunicipality}"/>
                        <g:hiddenField name="xphase" value="${basicSchoolInformationInstance?.phase}"/>
                        <g:hiddenField name="xspecialisation" value="${basicSchoolInformationInstance?.specialisation}"/>
                        <g:hiddenField name="xquintile" value="${basicSchoolInformationInstance?.quintile}"/>
                        --%>
                    </g:if>
                    <g:if test="${ (i != 0) || (basicSchoolInformationTotal == 1) }">
                        //The first index is a dummy for housekeeping purposes. Disregard it.
                        //Unless there is no other marker apart from the dummy.
                        var schoolIndex=${i};
                        var lat = <g:fieldValue size="110px" bean="${basicSchoolInformationInstance}" field="latitude"/>
                        var lon = <g:fieldValue size="110px" bean="${basicSchoolInformationInstance}" field="longitude"/>
                        if (!isNaN(lat) || !isNaN(lon)) {
                            var marker = new google.maps.Marker({
                                position: new google.maps.LatLng(lat, lon)
                            });

                            var infowindow = new google.maps.InfoWindow();

                            google.maps.event.addListener(marker, 'click', (function (marker, schoolIndex) {
                                return function () {
                                    var txt = "<p><b>${basicSchoolInformationInstance?.schoolName}</b></p>";
                                    txt += "<p>telephone: +${basicSchoolInformationInstance?.telephone}</p>";
                                    txt += "<p>phase: ${basicSchoolInformationInstance?.phase}</p>";
                                    txt += "<p>specialisation: ${basicSchoolInformationInstance?.specialisation}</p>";
                                    txt += "<p>quintile: Number ${basicSchoolInformationInstance?.quintile} of 5</p>";
                                    txt += "<p>scholars 2007-2013:</p>";
                                    txt += "<p>&nbsp;&nbsp;";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2007} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2008} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2009} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2010} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2011} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2012} -";
                                    txt += "${basicSchoolInformationInstance?.snap_Learners_2013}</p>";
                                    txt += "<p>teachers 2007-2013: </p>";
                                    txt += "<p>&nbsp;&nbsp;";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2007} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2008} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2009} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2010} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2011} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2012} -";
                                    txt += "${basicSchoolInformationInstance?.educator_Numbers_2013}</p>";
                                    infowindow.setContent(txt);
                                    infowindow.open(map, marker);
                                }
                            })(marker, schoolIndex));

                            <g:if test="${ (i == 1) || ((i == 0) && (basicSchoolInformationTotal == 1)) }">
                                //Only add one listener
                                function getZoomedMarkersAjax(mapContainer) {
                                    var bounds = mapContainer.getBounds();
                                    var zm = mapContainer.getZoom();
                                    var neCorner = bounds.getNorthEast();
                                    var swCorner = bounds.getSouthWest();
                                    var latMax = neCorner.lat();
                                    var latMin = swCorner.lat();
                                    var longMax = neCorner.lng();
                                    var longMin = swCorner.lng();
                                    var edge = "{latitudeMin:" + latMin + ", latitudeMax:" + latMax + ", longitudeMin:" + longMin + ", longitudeMax:" + longMax + ", zoom:" + zm +  "}";
                                    ${remoteFunction( action:'filterByLatLong', params:"'edge=' + edge ", onSuccess:"onSuccess(data,textStatus)")};
                                }

                                google.maps.event.addListenerOnce(map, 'bounds_changed', function (e1) {
                                    google.maps.event.addListenerOnce(map, 'zoom_changed', function (e2) {
                                        google.maps.event.addListener(map, 'idle', getZoomedMarkersAjax(this));
                                    })
                                });

                                function onSuccess(data, textStatus) {
                                    document.open();
                                    document.write(data);
                                    document.close();
                                }
                            </g:if>
                            marker.setMap(map);
                        }
                    </g:if>
                </g:each>
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body>
        <table id="main_table">
            <tr>
                <td>
                    <g:if test="${!basicSchoolInformationTotal}">
                        <p>Oops.</p>
                    </g:if>
                    <g:elseif test="${basicSchoolInformationTotal == 1}">
                        <p>No search results visible.</p>
                    </g:elseif>
                    <g:elseif test="${basicSchoolInformationTotal == 2}">
                        <p>1 school displayed.</p>
                    </g:elseif>
                    <g:elseif test="${basicSchoolInformationTotal - 1 < session['pageListSize']}">
                        <p>${basicSchoolInformationTotal - 1} schools displayed.</p>
                    </g:elseif>
                    <g:elseif test="${basicSchoolInformationTotal - 1 == session['pageListSize']}">
                        <p>A random selection of ${basicSchoolInformationTotal - 1} schools displayed.</p>
                    </g:elseif>
                    <g:else>
                        <script>
                            console.log("Error: Cannot have this number of schools displayed.");
                        </script>
                    </g:else>
                </td>
                <td>
                    <g:if test="${!totalSchools}">
                        <p>Oops.</p>
                    </g:if>
                    <g:elseif test="${totalSchools == 1}">
                        <p>No search results.</p>
                    </g:elseif>
                    <g:else>
                        <p style="float:right;">${totalSchools-1} schools in search.</p>
                    </g:else>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="map-canvas"   style="width: 100%; height: 380px; position: relative; background-color: rgb(229, 227, 223); overflow: hidden;"/>
                </td>
            </tr>
            <tr>
                <td  colspan="2">
                <g:form>
                    <g:each in="${basicSchoolInformationList}" status="i" var="basicSchoolInformationInstance">
                        <g:if test="${i == 0}">
                            <script>console.log("${basicSchoolInformationInstance.schoolName}");</script>
                            <div id="SS" style="{font-weight: lighter; }">Use % for wildcard search. Not case sensitive.</div>
                            <ul style="list-style-type: none; padding-left: 0px;">
                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="schoolName" id="CAPS">
                                                <g:message code="basicSchoolInformation.schoolName.label" default="School Name:"/>
                                            </label>
                                        </span>
                                        <g:textField  style="width: 401px"  name="schoolName" value="${basicSchoolInformationInstance?.schoolName}"/>
                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="province" id="CAPS">
                                                <g:message code="basicSchoolInformation.province.label" default="Province:"/>
                                            </label>
                                        </span>

                                        <g:select style="width:414px;" id="province" name="province" from="${session['provinces']}"
                                                  value="${basicSchoolInformationInstance?.province}"
                                                  noSelection="['': 'No Selection']"></g:select>
                                    </span>
                                </li>

                                <li>
                                    <span style="width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="districtMunicipality" id="CAPS">
                                                <g:message code="basicSchoolInformation.districtMunicipality.label" default="Municipality:"/>
                                            </label>
                                        </span>

                                        <g:select style="width:414px;"
                                                  id="districtMunicipality"
                                                  name="districtMunicipality"
                                                  from="${session['districtMunicipality']}"
                                                  value="${basicSchoolInformationInstance?.districtMunicipality}"
                                                  noSelection="['': 'No Selection']"/>
                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="town_City" id="CAPS">
                                                <g:message code="basicSchoolInformation.town_City.label" default="Town:"/>
                                            </label>
                                        </span>
                                        <g:textField style="width: 401px" name="town_City" value="${basicSchoolInformationInstance?.town_City}"/>

                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase" id="CAPS">
                                                <g:message code="basicSchoolInformation.phase.label" default="Phase:"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('COMBINED SCHOOL')}">
                                            <g:checkBox name="phase_c" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_c" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.combined.label" default="Combined"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('INTERMEDIATE SCHOOL')}">
                                            <g:checkBox name="phase_i" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_i" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.intermediate.label" default="Intermediate"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('PRIMARY SCHOOL')}">
                                            <g:checkBox name="phase_p" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_p" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.primary.label" default="Primary"/>
                                            </label>
                                        </span>
                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('SECONDARY SCHOOL')}">
                                            <g:checkBox name="phase_s" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_s" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.secondary.label" default="Secondary"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('FINISHING SCHOOL')}">
                                            <g:checkBox name="phase_f" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_f" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.finishing.label" default="Finishing"/>
                                            </label>
                                        </span>

                                        <span style=" display: inline-block; width: 110px;">
                                        </span>
                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="specialisation" id="CAPS">
                                                <g:message code="basicSchoolInformation.specialisation.label" default="Specialisation:"/>
                                            </label>
                                        </span>

                                        <g:select style="width:414px;" id="specialisation" name="specialisation"
                                                  from="${session['specialisation']}" value="${basicSchoolInformationInstance?.specialisation}"
                                                  noSelection="['': 'No Selection']"></g:select>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="sector" id="CAPS">
                                                <g:message code="basicSchoolInformation.sector.label" default="Sector:"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.sector?.contains('PUBLIC')}">
                                            <g:checkBox name="sector_p" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="sector_p" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="sector">
                                                <g:message code="basicSchoolInformation.sector.public.label" default="Public"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.sector?.contains('INDEPENDENT')}">
                                            <g:checkBox name="sector_i" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="sector_i" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="sector">
                                                <g:message code="basicSchoolInformation.sector.independent.label" default="Independent"/>
                                            </label>
                                        </span>
                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="boardingSchool" id="CAPS">
                                                <g:message code="basicSchoolInformation.other.label" default="Other:"/></label>
                                        </span>
                                        <g:if test="${basicSchoolInformationInstance?.boardingSchool == 'YES'}">
                                            <g:checkBox name="boardingSchool" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="boardingSchool" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="boardingSchool">
                                                <g:message code="basicSchoolInformation.boardingSchool.label" default="Boarding School"/>
                                            </label>
                                        </span>


                                        <g:if test="${basicSchoolInformationInstance?.section21 == 'YES'}">
                                            <g:checkBox name="section21" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="section21" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="section21">
                                                <g:message code="basicSchoolInformation.section21.label" default="Section 21"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.noFeeSchool == 'YES'}">
                                            <g:checkBox name="noFeeSchool" checked="true"/>
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="noFeeSchool" checked="false"/>
                                        </g:else>
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="noFeeSchool">
                                                <g:message code="basicSchoolInformation.noFeeSchool.label" default="No Fee"/>
                                            </label>
                                        </span>

                                    </span>
                                </li>

                                <li>
                                    <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 110px;">
                                            <label for="quintile" id="CAPS">
                                                <g:message code="basicSchoolInformation.quintile.label" default="Quintile:"/></label>
                                        </span>

                                        <g:select style="width:414px;" id="quintile" name="quintile"
                                                  from="${session['quintile']}" value="${basicSchoolInformationInstance?.quintile}"
                                                  noSelection="['': 'No Selection']"></g:select>
                                    </span>
                                </li>
                            </ul>
                        </g:if>
                    </g:each>
                    <span style="float: left; padding: 30px 0 0 0 ; font-size: 10px;">Powered by <a href="http://korwe.com/schoolsAdvisor">Korwe</a>. v1.2.0</span>
                    <span style="float: right;">
                        <fieldset class="buttons" style="margin-top: 10px;">
                            <g:actionSubmit class="filterBy" action="filterFromForm" value="${message(code: 'default.button.filter.label', default: 'Filter')}"/>
                            <g:actionSubmit class="reset" action="reset" value="${message(code: 'default.button.reset.label', default: 'Reset')}"/>
                        </fieldset>
                    </span>
                </g:form>
                </td>
            </tr>
        </table>
    </body>
</html>
