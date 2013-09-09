<%@ page import="schoolsdata.SchoolsData" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'schoolsData.label', default: 'SchoolsData')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-schoolsData" class="skip" tabindex="-1">
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
<div id="show-schoolsData" class="content scaffold-show" role="main">
    <%--<h1><g:message code="default.show.label" args="[entityName]" /></h1> --%>
    <table style="margin-bottom: 0px;">
        <tr>
            <td width="33%">
                <div align="left">
                <g:link class="home" action="filter">
                    <img align="left" width="30%" src="../../images/education-university-icon.png"> </g:link></div>
                <div align="right">
                    <g:link class="home" action="filter"><h1>Schools Advisor</h1> </g:link>  </div>
            </td>
            <td><p>Welcome to <b>SABC SchoolAdvisor</b>, where you can <b>find out more about any of the schools
            in your area</b>. Double-click anywhere on the map to zoom in, or use the selection tools below. Click any
            school marker on the map to find out more about that school.</p>
            </td>
        </tr>
    </table>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table style="margin-bottom: 0px;" width="100%">
        <tr>
            <td width="60%" style="background-color: silver">

                <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyDRcFqIg8FOU_TDreR-9zqbrXI3GkGfrg4&sensor=true_or_false"
                        type="text/javascript"></script>
                <script type="text/javascript">

                    var usPoint = new GLatLng(<g:fieldValue size="150px" bean="${schoolsDataInstance}"  field="latitude"/>,
                            <g:fieldValue size="150px" bean="${schoolsDataInstance}"  field="longitude"/>)   ;

                    var usCenterPoint = new GLatLng(-29,24)   ;
                    var usZoom = 6;

                    function initialize() {
                        if (GBrowserIsCompatible()) {
                            var map = new GMap2(document.getElementById("map_canvas"));
                            map.setCenter( map.setCenter(usCenterPoint, usZoom));

                            var marker = new GMarker(usPoint)  ;
                            var txt = "More info";
                            <%--<g:textField size="60px" name="localMunicipality" value="${schoolsDataInstance?.localMunicipality}"/>  --%>
                            marker.bindInfoWindowHtml(txt);
                            map.addOverlay(marker)      ;
                            map.setUIToDefault();
                        }
                    }


                </script>
                <div id="map_canvas" style="width: 700px; height: 650px"></div>
                 </td><td><h3>NEWS HEADLINES FROM SABC</h3>
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
        </td></tr><tr><td>
                <%--<img src="../../images/map.png"/>     --%>
                <%-- <g:resource dir="images" file="map.png" />    --%>
                <ul style="list-style-type: none; padding-left: 0px;">

        <li>
            <span style="  width: 40px;">
                <g:if test="${schoolsDataInstance?.schoolName}">
                    <span style=" display: inline-block; width: 150px;">
                        <label for="schoolName">
                            <g:message code="schoolsData.schoolName.label"  default="schoolName"/>
                        </label>
                    </span>
                    <g:textField size="60px" name="schoolName" value="${schoolsDataInstance?.schoolName}"/>
                </g:if>
            </span>
        </li>


        <li>
            <span style="  width: 40px;">
                <g:if test="${schoolsDataInstance?.province}">
                    <span style=" display: inline-block; width: 150px;">
                        <label for="province">
                            <g:message code="schoolsData.province.label" default="Province"/>
                        </label>
                    </span>
                    <g:textField  size="60px" name="province" value="${schoolsDataInstance?.province}"/>
                </g:if>
            </span>
        </li>

        <li>
            <span style="  width: 40px;">
                <g:if test="${schoolsDataInstance?.town_City}">
                    <span style=" display: inline-block; width: 150px;">
                        <label for="town_City"><g:message code="schoolsData.town_City.label"
                                                          default="Town"/>
                        </label>
                    </span>
                    <g:textField size="60px" name="Town" value="${schoolsDataInstance?.town_City}"/>
                </g:if>
            </span>
        </li>
                   <%--
                    <li>
                        <span style="  width: 40px;">
                            <g:if test="${schoolsDataInstance?.district}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="contactPerson">
                                        <g:message code="schoolsData.district.label" default="District"/>
                                    </label>
                                </span>
                                <g:textField size="50px" name="district" value="${schoolsDataInstance?.district}"/>
                            </g:if>
                        </span>
                    </li>
        --%>
                    <li>
                        <span  style="   width: 40px;">
                            <g:if test="${schoolsDataInstance?.districtMunicipality}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="contactPerson">
                                        <g:message code="schoolsData.districtMunicipality.label" default="Municipality"/>
                                    </label>
                                </span>
                                <g:textField size="60px" name="districtMunicipality" value="${schoolsDataInstance?.districtMunicipality}"/>
                            </g:if>
                        </span>
                    </li>
                    <li>
                        <span  style="  width: 40px;">
                            <g:if test="${schoolsDataInstance?.phase}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="phase">
                                        <g:message code="schoolsData.phase.label" default="Phase"/>
                                    </label>
                                </span>
                                <g:textField  size="60px" name="phase" value="${schoolsDataInstance?.phase}"/>
                            </g:if>
                        </span>
                    </li>
                    <li>
                        <span style="  width: 40px;">
                            <g:if test="${schoolsDataInstance?.sector}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="sector">
                                        <g:message code="schoolsData.sector.label" default="Sector"/>
                                    </label>
                                </span>
                                <g:textField size="60px" name="sector" value="${schoolsDataInstance?.sector}"/>
                            </g:if>
                        </span>
                    </li>
                    <li>
                        <span style="  width: 40px;">
                            <g:if test="${schoolsDataInstance?.specialisation}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="specialisation">
                                        <g:message code="schoolsData.specialisation.label" default="Specialisation"/>
                                    </label>
                                </span>
                                <g:textField size="60px" name="specialisation" value="${schoolsDataInstance?.specialisation}"/>
                            </g:if>
                        </span>
                    </li>
                    <li>
                        <span style="  width: 40px;">
                            <g:if test="${schoolsDataInstance?.telephone}">
                                <span style=" display: inline-block; width: 150px;">
                                    <label for="telephone">
                                        <g:message code="schoolsData.telephone.label" default="Telephone"/></label>
                                </span>
                                <g:textField size="60px" name="telephone" value="${schoolsDataInstance?.telephone}"/>
                            </g:if>
                        </span>
                    </li>
                </ul>


            </td><td>
                     <h3>Links to educational material</h3>
        <ul><li>More about SABC Education</li><li>Science for Matrics</li><li>More Links ...</li></ul>
        </td></tr></table>
    <%--<g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${schoolsDataInstance?.id}" />
            <g:link class="edit" action="edit" id="${schoolsDataInstance?.id}">
                <g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </fieldset>
</g:form>  --%>
</div>
</body>
</html>
