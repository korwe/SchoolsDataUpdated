<%@ page import="schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'basicSchoolInformation.label', default: 'Filter')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-basicSchoolInformation" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home" action="filter"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>           --%>
<div id="list-basicSchoolInformation" class="content scaffold-list" role="main">
    <%--
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    --%>
    <table style="margin-bottom: 0px;">
        <tr>
            <td width="33%">
                <div align="left">
                    <g:link class="home" action="filter">
                        <img align="left" width="30%" src="${resource(dir: 'images', file: 'education-university-icon.png')}">
                    </g:link>
                </div>
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
    <g:if test="${session.message}">
        <div class="message" role="status">Query = ${session.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="boardingSchool" title="${message(code: 'basicSchoolInformation.schoolName.label', default: 'School Name')}" />
            <g:sortableColumn property="districtMunicipality" title="${message(code: 'basicSchoolInformation.districtMunicipality.label', default: 'District Munic')}" />
            <g:sortableColumn property="cellNo" title="${message(code: 'basicSchoolInformation.sector.label', default: 'Sector')}" />
            <g:sortableColumn property="contactPerson" title="${message(code: 'basicSchoolInformation.specialisation.label', default: 'Specialisation')}" />
            <g:sortableColumn property="districtMunicipality" title="${message(code: 'basicSchoolInformation.phase.label', default: 'Phase')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${basicSchoolInformationInstanceList}" status="i" var="basicSchoolInformationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:link action="basicSchoolInformation" id="${basicSchoolInformationInstance.id}">${fieldValue(bean: basicSchoolInformationInstance, field: "schoolName")}
                    </g:link></td>

                <td>${fieldValue(bean: basicSchoolInformationInstance, field: "districtMunicipality")}</td>

                <td>${fieldValue(bean: basicSchoolInformationInstance, field: "sector")}</td>

                <td>${fieldValue(bean: basicSchoolInformationInstance, field: "specialisation")}</td>

                <td>${fieldValue(bean: basicSchoolInformationInstance, field: "phase")}</td>


            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${basicSchoolInformationInstanceTotal}" />
    </div>
</div>
</body>
</html>
