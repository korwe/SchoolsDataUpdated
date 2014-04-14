<%@ page import="schoolsdata.BasicSchoolInformationController; schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
<head>

<%--
    * author: info AT korwe DOT com
    * 26/3/2014
    * version 1.1
--%>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'basicSchoolInformation.label', default: 'Basic School Info')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <g:javascript library="jquery" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
    html {
        height: 100%
    }

    body {
        height: 100%;
        margin: 0;
        padding: 0
    }

    #map-canvas {
        height: 100%
    }
    </style>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVNqjynDsI3fhW-v4J_3OW-ocbG2C7CDE&sensor=true">
    </script>
</head>
<%--
https://developers.google.com/maps/documentation/javascript/maptypes#TileCoordinates
https://developers.google.com/maps/documentation/javascript/events
http://www.w3schools.com/googleapi/google_maps_overlays.asp
--%>
<body>
<a href="#show-basicSchoolInformation" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
        <li><g:link class="home" action="filter"><g:message code="default.home.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<%--<div id="show-basicSchoolInformation" class="content scaffold-show" role="main">--%>
<%--<h1><g:message code="default.show.label" args="[entityName]" /></h1> --%>
<table style="margin-bottom: 0px;">
    <tr>
        <td width="33%">
            <div align="left">
                <g:link class="home" action="filter">
                    <img align="left" width="30%"
                         src="${resource(dir: 'images', file: 'education-university-icon.png')}"></g:link></div>

            <div align="right">
                <g:link class="home" action="filter"><h1>Schools Advisor</h1></g:link></div>
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

<script type="text/javascript">
    function initialize() {
        var mapDoc = document.getElementById("map-canvas");
        var midLat = ${midLat?:-28.5};
        var midLong = ${midLong?:24};
        var defZoom = ${zoom?:6};

        var mapOptions = { center: new google.maps.LatLng(midLat, midLong), zoom: defZoom};
        var map = new google.maps.Map(mapDoc, mapOptions);

        var result = [];
        <g:each in="${basicSchoolInformationList}" status="i" var="basicSchoolInformationInstance">

        <g:if test="${i < session['pageListSize']}">
        var lat = <g:fieldValue size="150px" bean="${basicSchoolInformationInstance}"  field="latitude"/>
        var lon = <g:fieldValue size="150px" bean="${basicSchoolInformationInstance}"  field="longitude"/>
        if (!isNaN(lat) || !isNaN(lon)) {
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(lat, lon)
            });

            var j=${i};
            var infowindow = new google.maps.InfoWindow();

            google.maps.event.addListener(marker, 'click', (function(marker, j) {
                return function() {
                    var txt = "<p>${basicSchoolInformationInstance?.schoolName}<br/>";
                    txt += "contact: ${basicSchoolInformationInstance?.contactPerson}<br/>";
                    txt += "tel: ${basicSchoolInformationInstance?.cellNo}</p>";
                    infowindow.setContent(txt);
                    infowindow.open(map, marker);
                }
            })(marker, j));

            function getZoomedMarkersAjax (x){
                var ddd = x.getBounds();
                var zm = x.getZoom();
                var ne = ddd.getNorthEast();
                var sw = ddd.getSouthWest();
                var latMax = ne.lat();
                var latMin = sw.lat();
                var longMax = ne.lng();
                var longMin = sw.lng();
                var edge = "{latitudeMin:"+latMin+", latitudeMax:" +latMax+", longitudeMin:"+longMin+", longitudeMax:"+longMax+", zoom:"+zm+"}";

                ${remoteFunction( action:'testLatLong', params:"'edge=' + edge ", onComplete:"updateContent(XMLHttpRequest,textStatus)", onSuccess:"onSuccess(data,textStatus)", onFailure:"onError(XMLHttpRequest,textStatus,errorThrown)") };
            }

            if (j==0) {
                google.maps.event.addListener(map, 'zoom_changed', function () {
                    google.maps.event.addListenerOnce(map, 'bounds_changed', function (e) {
                        google.maps.event.addListener(map, 'idle', getZoomedMarkersAjax(this));
                    })
                });
                function updateContent(XMLHttpRequest,textStatus){
                    //alert("updateContent:"+textStatus)
                }

                function onSuccess(data,textStatus){
                    //alert("onSuccess data:"+data+" status:"+textStatus)

                    document.open();
                    document.write(data);
                    document.close();
                    //for(var i in data)
                    //    result.push([i, data [i]]);
                }

                function onError(XMLHttpRequest,textStatus,errorThrown){
                    //alert("onError:"+textStatus)
                }
            }
            marker.setMap(map);
        }
        </g:if>
        </g:each>
    }

    google.maps.event.addDomListener(window, 'load', initialize);

</script>

<table style="margin-bottom: 0px;">
<tr>
<td>

<g:each in="${basicSchoolInformationList}" status="i" var="basicSchoolInformationInstance">
<g:if test="${i == 0}">
<ul style="list-style-type: none; padding-left: 0px;">
<li>
    <span style="  width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="schoolName">
                <g:message code="basicSchoolInformation.schoolName.label" default="School Name"/>
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

        <g:select style="width:524px;" id="province" name="province" from="${session['provinces']}"
                  value="${basicSchoolInformationInstance?.province}"
                  noSelection="['': 'No Selection']"></g:select>
    </span>
</li>

<li>
    <span style="  width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="town_City">
                <g:message code="basicSchoolInformation.town_City.label" default="Town"/>
            </label>
        </span>
        <g:textField size="60px" name="town_City" value="${basicSchoolInformationInstance?.town_City}"/>
    </span>
</li>

<li>
    <span style="   width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="districtMunicipality">
                <g:message code="basicSchoolInformation.districtMunicipality.label" default="Municipality"/>
            </label>
        </span>

        <g:select style="width:524px;"
                  id="districtMunicipality"
                  name="districtMunicipality"
                  from="${session['districtMunicipality']}"
                  value="${basicSchoolInformationInstance?.districtMunicipality}"
                  noSelection="['': 'No Selection']"/>
    </span>
</li>

<li>
    <span style="  width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.phase.label" default="Phase"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.phase?.contains('COMBINED SCHOOL')}">
            <g:checkBox name="phase_c" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="phase_c" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.phase.combined.label" default="Combined"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.phase?.contains('INTERMEDIATE SCHOOL')}">
            <g:checkBox name="phase_i" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="phase_i" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.phase.intermediate.label" default="Intermediate"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.phase?.contains('PRIMARY SCHOOL')}">
            <g:checkBox name="phase_p" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="phase_p" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.phase.primary.label" default="Primary"/>
            </label>
        </span>
    </span>
</li>

<li>
    <span style="  width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.phase?.contains('SECONDARY SCHOOL')}">
            <g:checkBox name="phase_s" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="phase_s" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.phase.secondary.label" default="Secondary"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.phase?.contains('FINISHING SCHOOL')}">
            <g:checkBox name="phase_f" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="phase_f" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
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

        <g:select style="width:524px;" id="specialisation" name="specialisation"
                  from="${session['specialisation']}" value="${basicSchoolInformationInstance?.specialisation}"
                  noSelection="['': 'No Selection']"></g:select>
</li>

<li>
    <span style="  width: 40px;">
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.sector.label" default="Sector"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.sector?.contains('PUBLIC')}">
            <g:checkBox name="sector_p" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="sector_p" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
                <g:message code="basicSchoolInformation.sector.public.label" default="Public"/>
            </label>
        </span>

        <g:if test="${basicSchoolInformationInstance?.sector?.contains('INDEPENDENT')}">
            <g:checkBox name="sector_i" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="sector_i" checked="false"/>
        </g:else>
        <span style=" display: inline-block; width: 150px;">
            <label for="${message(code:"phase")}">
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
        <g:if test="${basicSchoolInformationInstance?.boardingSchool == 'YES'}">
            <g:checkBox name="boardingSchool" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="boardingSchool" checked="false"/>
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

        <g:if test="${basicSchoolInformationInstance?.section21 == 'YES'}">
            <g:checkBox name="section21" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="boardingSchool" checked="false"/>
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

        <g:if test="${basicSchoolInformationInstance?.noFeeSchool == 'YES'}">
            <g:checkBox name="noFeeSchool" checked="true"/>
        </g:if>
        <g:else>
            <g:checkBox name="noFeeSchool" checked="false"/>
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

        <g:select style="width:524px;" id="quintile" name="quintile"
                  from="${session['quintile']}" value="${basicSchoolInformationInstance?.quintile}"
                  noSelection="['': 'No Selection']"></g:select>
    </span>
</li>

</ul>
</g:if>
</g:each>
</td>

</tr>
</table>

<g:if test="${basicSchoolInformationTotal == 1}">
    <p>No search results</p>
</g:if>
<g:elseif test="${basicSchoolInformationTotal == 2}">
    <p>1 school displayed.</p>
</g:elseif>
<g:elseif test="${basicSchoolInformationTotal < session['pageListSize']}">
    <p>${basicSchoolInformationTotal - 1} schools displayed.</p>
</g:elseif>
<g:else>
    <p>${basicSchoolInformationTotal - 1} schools displayed. ${totalSchools?:0 - basicSchoolInformationTotal?:0} not displayed.</p>
</g:else>

<fieldset class="buttons">
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
    <g:actionSubmit class="filterBy" action="filterBy"
                    value="${message(code: 'default.button.filter.label', default: 'Filter')}"/>
    <g:actionSubmit class="reset" action="reset"
                    value="${message(code: 'default.button.reset.label', default: 'Reset')}"/>
</fieldset>
</g:form>

<div id="map-canvas"/>
</body>
</html>
