
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-schoolsData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="boardingSchool" title="${message(code: 'schoolsData.boardingSchool.label', default: 'Boarding School')}" />
					
						<g:sortableColumn property="cellNo" title="${message(code: 'schoolsData.cellNo.label', default: 'Cell No')}" />
					
						<g:sortableColumn property="contactPerson" title="${message(code: 'schoolsData.contactPerson.label', default: 'Contact Person')}" />
					
						<g:sortableColumn property="district" title="${message(code: 'schoolsData.district.label', default: 'District')}" />
					
						<g:sortableColumn property="districtMunicipality" title="${message(code: 'schoolsData.districtMunicipality.label', default: 'District Municipality')}" />
					
						<g:sortableColumn property="educator_Numbers_2007" title="${message(code: 'schoolsData.educator_Numbers_2007.label', default: 'Educator Numbers2007')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${schoolsDataInstanceList}" status="i" var="schoolsDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${schoolsDataInstance.id}">${fieldValue(bean: schoolsDataInstance, field: "boardingSchool")}</g:link></td>
					
						<td>${fieldValue(bean: schoolsDataInstance, field: "cellNo")}</td>
					
						<td>${fieldValue(bean: schoolsDataInstance, field: "contactPerson")}</td>
					
						<td>${fieldValue(bean: schoolsDataInstance, field: "district")}</td>
					
						<td>${fieldValue(bean: schoolsDataInstance, field: "districtMunicipality")}</td>
					
						<td>${fieldValue(bean: schoolsDataInstance, field: "educator_Numbers_2007")}</td>
					
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
