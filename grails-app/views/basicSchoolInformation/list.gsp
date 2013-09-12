<%@ page import="schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-basicSchoolInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-basicSchoolInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="boardingSchool" title="${message(code: 'basicSchoolInformation.boardingSchool.label', default: 'Boarding School')}" />
					
						<g:sortableColumn property="cellNo" title="${message(code: 'basicSchoolInformation.cellNo.label', default: 'Cell No')}" />
					
						<g:sortableColumn property="contactPerson" title="${message(code: 'basicSchoolInformation.contactPerson.label', default: 'Contact Person')}" />
					
						<g:sortableColumn property="district" title="${message(code: 'basicSchoolInformation.district.label', default: 'District')}" />
					
						<g:sortableColumn property="districtMunicipality" title="${message(code: 'basicSchoolInformation.districtMunicipality.label', default: 'District Municipality')}" />
					
						<g:sortableColumn property="educator_Numbers_2007" title="${message(code: 'basicSchoolInformation.educator_Numbers_2007.label', default: 'Educator Numbers2007')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${basicSchoolInformationInstanceList}" status="i" var="basicSchoolInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${basicSchoolInformationInstance.id}">${fieldValue(bean: basicSchoolInformationInstance, field: "boardingSchool")}</g:link></td>
					
						<td>${fieldValue(bean: basicSchoolInformationInstance, field: "cellNo")}</td>
					
						<td>${fieldValue(bean: basicSchoolInformationInstance, field: "contactPerson")}</td>
					
						<td>${fieldValue(bean: basicSchoolInformationInstance, field: "district")}</td>
					
						<td>${fieldValue(bean: basicSchoolInformationInstance, field: "districtMunicipality")}</td>
					
						<td>${fieldValue(bean: basicSchoolInformationInstance, field: "educator_Numbers_2007")}</td>
					
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
