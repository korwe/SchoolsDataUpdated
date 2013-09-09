<%@ page import="schoolsdata.SchoolsData" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'schoolsData.label', default: 'SchoolsData')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-schoolsData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home" action="filter"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>           --%>
<div id="list-schoolsData" class="content scaffold-list" role="main">
    <%--
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    --%>
    <table style="margin-bottom: 0px;">
        <tr>
            <td width="33%">
                <div align="left">
                    <g:link class="home" action="filter">
                        <img align="left" width="30%" src="../images/education-university-icon.png"></g:link></div>
                <div align="right">
                    <g:link class="home" action="filter"><h1>Schools Advisor</h1> </g:link>  </div>
            </td>
            <td><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </td>
        </tr>
    </table>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="boardingSchool" title="${message(code: 'schoolsData.schoolName.label', default: 'School Name')}" />
            <g:sortableColumn property="district" title="${message(code: 'schoolsData.district.label', default: 'District')}" />
            <g:sortableColumn property="cellNo" title="${message(code: 'schoolsData.sector.label', default: 'Sector')}" />
            <g:sortableColumn property="contactPerson" title="${message(code: 'schoolsData.specialisation.label', default: 'Specialisation')}" />
            <g:sortableColumn property="districtMunicipality" title="${message(code: 'schoolsData.phase.label', default: 'Phase')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${schoolsDataInstanceList}" status="i" var="schoolsDataInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:link action="sabc" id="${schoolsDataInstance.id}">${fieldValue(bean: schoolsDataInstance, field: "schoolName")}
                    </g:link></td>

                <td>${fieldValue(bean: schoolsDataInstance, field: "district")}</td>

                <td>${fieldValue(bean: schoolsDataInstance, field: "sector")}</td>

                <td>${fieldValue(bean: schoolsDataInstance, field: "specialisation")}</td>

                <td>${fieldValue(bean: schoolsDataInstance, field: "phase")}</td>


            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${schoolsDataInstanceTotal}" />
    </div>
</div>
</body>
</html>
