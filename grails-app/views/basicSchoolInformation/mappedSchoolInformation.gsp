<%@ page import="schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'BasicSchoolInformation.label', default: 'Basic School Info')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-basicSchoolInformation" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label"   default="Skip to content&hellip;"/>
</a>
<%--
<div class="nav" role="navigation">
<ul>
<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    <li><g:link class="home" action="filter"><g:message code="default.home.label" args="[entityName]" /></g:link></li>
</ul>
</div>
   --%>
    <div id="show-basicSchoolInformation" class="content scaffold-show" role="main">
    <%--<h1><g:message code="default.show.label" args="[entityName]" /></h1> --%>
        <table style="margin-bottom: 0px;">
        <tr>
            <td width="33%">
                <div align="left">
                    <g:link class="home" action="filter">
                        <img align="left" width="30%" src="${resource(dir: 'images', file: 'education-university-icon.png')}"> </g:link></div>
                <div align="right">
                    <g:link class="home" action="filter"><h1>Schools Advisor</h1> </g:link>  </div>
            </td>
            <td><p>Welcome to <b>SABC SchoolAdvisor</b>, where you can <b>find out more about any of the schools
            in your area</b>. Double-click anywhere on the map to zoom in, or use the selection tools below. Click any
            school marker on the map to find out more about that school. Wildcard Search with %</p>
            </td>
        </tr>
    </table>

        <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <g:form>
            <table style="margin-bottom: 0px;" width="100%">
                <tr>
                    <td width="60%" style="background-color: silver">

       <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyAYFUuLY3qIfWUXOCqgIoX0U-hq617C0tA&sensor=true"
               type="text/javascript">
       </script>
       <script type="text/javascript">
           var usCenterPoint = new GLatLng(-29, 24)   ;
           var usZoom = 6;
           function initialize() {
               if (GBrowserIsCompatible()) {
                   var map = new GMap2(document.getElementById("map_canvas"));
                   map.setCenter( map.setCenter(usCenterPoint, usZoom));

                    <g:each in="${basicSchoolInformationInstanceList}" status="i" var="basicSchoolInformationInstance">

                    <g:if test="${i < session['pageListSize']}">
                        var lat = <g:fieldValue size="150px" bean="${basicSchoolInformationInstance}"  field="latitude"/>
                        var lon = <g:fieldValue size="150px" bean="${basicSchoolInformationInstance}"  field="longitude"/>
                        if (!isNaN(lat) || !isNaN(lon)) {
                            var usPoint = new GLatLng(lat,lon);
                            var marker = new GMarker(usPoint)  ;
                            var txt = "<p>${basicSchoolInformationInstance?.schoolName}<br/>";
                            txt += "contact: ${basicSchoolInformationInstance?.contactPerson}<br/>";
                            txt += "tel: ${basicSchoolInformationInstance?.cellNo}</p>";
                            marker.bindInfoWindowHtml( txt);
                            map.addOverlay(marker)      ;
                        }
                        </g:if>
                   </g:each>
                   map.setUIToDefault();
               }
           }

                        </script>

                        <div id="map_canvas" style="width: 700px; height: 650px"></div>

                        <g:if test="${dataSize == 1}">
                            <p>No search results</p>
                        </g:if>
                        <g:elseif test="${dataSize == 2}">
                            <p>1 school displayed.</p>
                        </g:elseif>
                        <g:elseif test="${dataSize < pageListSize}">
                            <p>${dataSize-1} schools displayed.</p>
                        </g:elseif>
                        <g:else>
                            <p>${session['pageListSize']-1} schools displayed. ${dataSize-session['pageListSize']} not displayed.</p>
                        </g:else>
                    </td>
                    <td>
                        <h3>NEWS HEADLINES FROM SABC</h3>
                        <ul style="padding:15px">
                            <li>Tight security at six W Cape schools   </li><li>
                            Education dept to appeal ruling  </li><li>
                            ANC W Cape welcomes formation of an education forum     </li><li>
                            Western Cape school closures set aside  </li><li>
                            ANC W Cape leader calls for education
                            MEC's resignation        </li><li>
                            Cosatu, W Cape Education pact to improve education
                            W Cape adds new teacher posts   </li><li>
                            ANC, Cosatu challenge DA on
                            proposed school closures    </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
        <g:each in="${basicSchoolInformationInstanceList}" status="i" var="basicSchoolInformationInstance">
            <g:if test="${i==0}">
                        <ul style="list-style-type: none; padding-left: 0px;">
                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="schoolName">
                                                <g:message code="basicSchoolInformation.schoolName.label"  default="School Name"/>
                                            </label>
                                        </span>
                                        <g:textField size="60px" name="schoolName" value="${basicSchoolInformationInstance?.schoolName}"/>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="province">
                                                <g:message code="basicSchoolInformation.province.label" default="Province"/>
                                            </label>
                                        </span>

                                        <g:select style="width:524px;" id="province" name="province" from="${session['provinces']}" value="${basicSchoolInformationInstance?.province}"
                                                   noSelection="['':'No Selection']"></g:select>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="town_City">
                                                <g:message code="basicSchoolInformation.town_City.label"    default="Town"/>
                                            </label>
                                        </span>
                                        <g:textField size="60px" name="town_City" value="${basicSchoolInformationInstance?.town_City}"/>
                                </span>
                            </li>

                            <li>
                                <span  style="   width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="districtMunicipality">
                                                <g:message code="basicSchoolInformation.districtMunicipality.label" default="Municipality"/>
                                            </label>
                                        </span>

                                    <g:select  style="width:524px;"
                                               id="districtMunicipality"
                                               name="districtMunicipality"
                                               from="${session['districtMunicipality']}"
                                               value="${basicSchoolInformationInstance?.districtMunicipality}"
                                               noSelection="['':'No Selection']"/>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label  for="phase">
                                                <g:message code="basicSchoolInformation.phase.label" default="Phase"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('COMBINED SCHOOL')}">
                                            <g:checkBox name="phase_c"  checked="true" />
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_c" checked="false"   />
                                        </g:else>
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.combined.label" default="Combined"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('INTERMEDIATE SCHOOL')}">
                                            <g:checkBox name="phase_i"  checked="true" />
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_i"  checked="false" />
                                        </g:else>
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.intermediate.label" default="Intermediate"/>
                                            </label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.phase?.contains('PRIMARY SCHOOL')}">
                                            <g:checkBox name="phase_p"  checked="true" />
                                        </g:if>
                                        <g:else>
                                            <g:checkBox name="phase_p" checked="false" />
                                        </g:else>
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="phase">
                                                <g:message code="basicSchoolInformation.phase.primary.label" default="Primary"/>
                                            </label>
                                        </span>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                    <span style=" display: inline-block; width: 150px;">
                                        <label for="phase">
                                        </label>
                                    </span>

                                    <g:if test="${basicSchoolInformationInstance?.phase?.contains('SECONDARY SCHOOL')}">
                                        <g:checkBox name="phase_s" checked="true" />
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="phase_s" checked="false"   />
                                    </g:else>
                                    <span style=" display: inline-block; width: 150px;">
                                        <label for="phase">
                                            <g:message code="basicSchoolInformation.phase.secondary.label" default="Secondary"/>
                                        </label>
                                    </span>

                                    <g:if test="${basicSchoolInformationInstance?.phase?.contains('FINISHING SCHOOL')}">
                                        <g:checkBox name="phase_f" checked="true" />
                                    </g:if>
                                    <g:else>
                                        <g:checkBox name="phase_f"  checked="false" />
                                    </g:else>
                                    <span style=" display: inline-block; width: 150px;">
                                        <label for="phase">
                                            <g:message code="basicSchoolInformation.phase.finishing.label" default="Finishing"/>
                                        </label>
                                    </span>

                                    <span style=" display: inline-block; width: 150px;">
                                    </span>
                                </span>
                            </li>

                            <li>
                            <span style="  width: 40px;">
                                    <span style=" display: inline-block; width: 150px;">
                                        <label for="specialisation">
                                            <g:message code="basicSchoolInformation.specialisation.label" default="Specialisation"/>
                                        </label>
                                    </span>

                                <g:select  style="width:524px;" id="specialisation" name="specialisation"
                                          from="${session['specialisation']}" value="${basicSchoolInformationInstance?.specialisation}"
                                          noSelection="['':'No Selection']"></g:select>
                            </li>

                        <li>
                            <span style="  width: 40px;">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="sector">
                                        <g:message code="basicSchoolInformation.sector.label" default="Sector"/>
                                    </label>
                                </span>

                                <g:if test="${basicSchoolInformationInstance?.sector?.contains('PUBLIC')}">
                                    <g:checkBox name="sector_p"  checked="true" />
                                </g:if>
                                <g:else>
                                    <g:checkBox name="sector_p"  checked="false"   />
                                </g:else>
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="sector">
                                        <g:message code="basicSchoolInformation.sector.public.label" default="Public"/>
                                    </label>
                                </span>

                                <g:if test="${basicSchoolInformationInstance?.sector?.contains('INDEPENDENT')}">
                                    <g:checkBox name="sector_i" checked="true" />
                                </g:if>
                                <g:else>
                                    <g:checkBox name="sector_i"  checked="false" />
                                </g:else>
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="sector">
                                        <g:message code="basicSchoolInformation.sector.independent.label" default="Independent"/>
                                    </label>
                                </span>
                            </span>
                        </li>

                        <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="boardingSchool">
                                                <g:message code="basicSchoolInformation.boardingSchool.label" default="Boarding School"/></label>
                                        </span>
                                        <g:if test="${basicSchoolInformationInstance?.boardingSchool =='YES'}">
                                            <g:checkBox name="boardingSchool" checked="true" />
                                        </g:if>
                                        <g:else>
                                            <g:checkBox  name="boardingSchool"  checked="false" />
                                        </g:else>
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="boardingSchool">
                                                <g:message code="basicSchoolInformation.boardingSchool.label" default="Boarding School"/>
                                            </label>
                                        </span>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="section21">
                                                <g:message code="basicSchoolInformation.section21.label" default="Section 21"/></label>
                                        </span>

                                        <g:if test="${basicSchoolInformationInstance?.section21 =='YES'}">
                                            <g:checkBox  name="section21"  checked="true" />
                                        </g:if>
                                        <g:else>
                                            <g:checkBox  name="boardingSchool" checked="false" />
                                        </g:else>
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="boardingSchool">
                                                <g:message code="basicSchoolInformation.boardingSchool.label" default="Section 21"/>
                                            </label>
                                        </span>
                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="noFeeSchool">
                                                <g:message code="basicSchoolInformation.noFeeSchool.label" default="No Fee"/></label>
                                        </span>


                                    <g:if test="${basicSchoolInformationInstance?.noFeeSchool =='YES'}">
                                        <g:checkBox  name="noFeeSchool" checked="true" />
                                    </g:if>
                                    <g:else>
                                        <g:checkBox  name="noFeeSchool"  checked="false" />
                                    </g:else>
                                    <span style=" display: inline-block; width: 150px;">
                                        <label for="noFeeSchool">
                                            <g:message code="basicSchoolInformation.noFeeSchool.label" default="No Fee"/>
                                        </label>
                                    </span>

                                </span>
                            </li>

                            <li>
                                <span style="  width: 40px;">
                                        <span style=" display: inline-block; width: 150px;">
                                            <label for="quintile">
                                                <g:message code="basicSchoolInformation.quintile.label" default="Quintile"/></label>
                                        </span>

                                    <g:select  style="width:524px;" id="quintile" name="quintile"
                                               from="${session['quintile']}" value="${basicSchoolInformationInstance?.quintile}"
                                               noSelection="['':'No Selection']"></g:select>
                                </span>
                            </li>

                        </ul>
            </g:if>
            </g:each>
                    </td>
                    <td>
                        <h3>Links to educational material</h3>
                        <ul>
                            <li>More about SABC Education</li>
                            <li>Science for Matrics</li>
                            <li>More Links ...</li>
                        </ul>
                    </td>
                </tr>
            </table>
            <fieldset class="buttons">
                <g:hiddenField name="xschoolName" value="${basicSchoolInformationInstance?.schoolName}" />
                <g:hiddenField name="xtown_City" value="${basicSchoolInformationInstance?.town_City}" />
                <g:hiddenField name="xsector" value="${basicSchoolInformationInstance?.sector}" />
                <g:hiddenField name="xsection21" value="${basicSchoolInformationInstance?.section21}" />
                <g:hiddenField name="xnoFeeSchool" value="${basicSchoolInformationInstance?.noFeeSchool}" />
                <g:hiddenField name="xboardingSchool" value="${basicSchoolInformationInstance?.boardingSchool}" />
                <g:hiddenField name="xdistrictMunicipality" value="${basicSchoolInformationInstance?.districtMunicipality}" />
                <g:hiddenField name="xphase" value="${basicSchoolInformationInstance?.phase}" />
                <g:hiddenField name="xspecialisation" value="${basicSchoolInformationInstance?.specialisation}" />
                <g:hiddenField name="xquintile" value="${basicSchoolInformationInstance?.quintile}" />
                <g:actionSubmit class="filterBy" action="filterBy" value="${message(code: 'default.button.filterBy.label', default: 'Filter')}" />
                <g:actionSubmit class="reset" action="reset" value="${message(code: 'default.button.filterBy.label', default: 'Reset')}" />
            </fieldset>
        </g:form>
    </div>
<!--http://localhost:8080/schoolsdata/BasicSchoolInformation/filterBy?district=BUTTERWORTH&specialisation=&phase=&town_City=
--%>
</body>
</html>
