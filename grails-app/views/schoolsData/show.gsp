
<%@ page import="schoolsdata.SchoolsData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schoolsData.label', default: 'SchoolsData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schoolsData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schoolsData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schoolsData">
			
				<g:if test="${schoolsDataInstance?.boardingSchool}">
				<li class="fieldcontain">
					<span id="boardingSchool-label" class="property-label"><g:message code="schoolsData.boardingSchool.label" default="Boarding School" /></span>
					
						<span class="property-value" aria-labelledby="boardingSchool-label"><g:fieldValue bean="${schoolsDataInstance}" field="boardingSchool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.cellNo}">
				<li class="fieldcontain">
					<span id="cellNo-label" class="property-label"><g:message code="schoolsData.cellNo.label" default="Cell No" /></span>
					
						<span class="property-value" aria-labelledby="cellNo-label"><g:fieldValue bean="${schoolsDataInstance}" field="cellNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.contactPerson}">
				<li class="fieldcontain">
					<span id="contactPerson-label" class="property-label"><g:message code="schoolsData.contactPerson.label" default="Contact Person" /></span>
					
						<span class="property-value" aria-labelledby="contactPerson-label"><g:fieldValue bean="${schoolsDataInstance}" field="contactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="schoolsData.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:fieldValue bean="${schoolsDataInstance}" field="district"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.districtMunicipality}">
				<li class="fieldcontain">
					<span id="districtMunicipality-label" class="property-label"><g:message code="schoolsData.districtMunicipality.label" default="District Municipality" /></span>
					
						<span class="property-value" aria-labelledby="districtMunicipality-label"><g:fieldValue bean="${schoolsDataInstance}" field="districtMunicipality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2007}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2007-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2007.label" default="Educator Numbers2007" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2007-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2007"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2008}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2008-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2008.label" default="Educator Numbers2008" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2008-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2008"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2009}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2009-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2009.label" default="Educator Numbers2009" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2009-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2009"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2010}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2010-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2010.label" default="Educator Numbers2010" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2010-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2010"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2011}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2011-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2011.label" default="Educator Numbers2011" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2011-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2011"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2012}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2012-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2012.label" default="Educator Numbers2012" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2012-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2012"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.educator_Numbers_2013}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2013-label" class="property-label"><g:message code="schoolsData.educator_Numbers_2013.label" default="Educator Numbers2013" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2013-label"><g:fieldValue bean="${schoolsDataInstance}" field="educator_Numbers_2013"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="schoolsData.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${schoolsDataInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.localMunicipality}">
				<li class="fieldcontain">
					<span id="localMunicipality-label" class="property-label"><g:message code="schoolsData.localMunicipality.label" default="Local Municipality" /></span>
					
						<span class="property-value" aria-labelledby="localMunicipality-label"><g:fieldValue bean="${schoolsDataInstance}" field="localMunicipality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="schoolsData.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${schoolsDataInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.noFeeSchool}">
				<li class="fieldcontain">
					<span id="noFeeSchool-label" class="property-label"><g:message code="schoolsData.noFeeSchool.label" default="No Fee School" /></span>
					
						<span class="property-value" aria-labelledby="noFeeSchool-label"><g:fieldValue bean="${schoolsDataInstance}" field="noFeeSchool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.phase}">
				<li class="fieldcontain">
					<span id="phase-label" class="property-label"><g:message code="schoolsData.phase.label" default="Phase" /></span>
					
						<span class="property-value" aria-labelledby="phase-label"><g:fieldValue bean="${schoolsDataInstance}" field="phase"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.postalAddress}">
				<li class="fieldcontain">
					<span id="postalAddress-label" class="property-label"><g:message code="schoolsData.postalAddress.label" default="Postal Address" /></span>
					
						<span class="property-value" aria-labelledby="postalAddress-label"><g:fieldValue bean="${schoolsDataInstance}" field="postalAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.province}">
				<li class="fieldcontain">
					<span id="province-label" class="property-label"><g:message code="schoolsData.province.label" default="Province" /></span>
					
						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${schoolsDataInstance}" field="province"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.quintile}">
				<li class="fieldcontain">
					<span id="quintile-label" class="property-label"><g:message code="schoolsData.quintile.label" default="Quintile" /></span>
					
						<span class="property-value" aria-labelledby="quintile-label"><g:fieldValue bean="${schoolsDataInstance}" field="quintile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.registration_Date}">
				<li class="fieldcontain">
					<span id="registration_Date-label" class="property-label"><g:message code="schoolsData.registration_Date.label" default="Registration Date" /></span>
					
						<span class="property-value" aria-labelledby="registration_Date-label"><g:fieldValue bean="${schoolsDataInstance}" field="registration_Date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.schoolName}">
				<li class="fieldcontain">
					<span id="schoolName-label" class="property-label"><g:message code="schoolsData.schoolName.label" default="School Name" /></span>
					
						<span class="property-value" aria-labelledby="schoolName-label"><g:fieldValue bean="${schoolsDataInstance}" field="schoolName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.section21}">
				<li class="fieldcontain">
					<span id="section21-label" class="property-label"><g:message code="schoolsData.section21.label" default="Section21" /></span>
					
						<span class="property-value" aria-labelledby="section21-label"><g:fieldValue bean="${schoolsDataInstance}" field="section21"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.sector}">
				<li class="fieldcontain">
					<span id="sector-label" class="property-label"><g:message code="schoolsData.sector.label" default="Sector" /></span>
					
						<span class="property-value" aria-labelledby="sector-label"><g:fieldValue bean="${schoolsDataInstance}" field="sector"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2007}">
				<li class="fieldcontain">
					<span id="snap_Learners_2007-label" class="property-label"><g:message code="schoolsData.snap_Learners_2007.label" default="Snap Learners2007" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2007-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2007"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2008}">
				<li class="fieldcontain">
					<span id="snap_Learners_2008-label" class="property-label"><g:message code="schoolsData.snap_Learners_2008.label" default="Snap Learners2008" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2008-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2008"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2009}">
				<li class="fieldcontain">
					<span id="snap_Learners_2009-label" class="property-label"><g:message code="schoolsData.snap_Learners_2009.label" default="Snap Learners2009" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2009-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2009"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2010}">
				<li class="fieldcontain">
					<span id="snap_Learners_2010-label" class="property-label"><g:message code="schoolsData.snap_Learners_2010.label" default="Snap Learners2010" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2010-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2010"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2011}">
				<li class="fieldcontain">
					<span id="snap_Learners_2011-label" class="property-label"><g:message code="schoolsData.snap_Learners_2011.label" default="Snap Learners2011" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2011-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2011"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2012}">
				<li class="fieldcontain">
					<span id="snap_Learners_2012-label" class="property-label"><g:message code="schoolsData.snap_Learners_2012.label" default="Snap Learners2012" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2012-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2012"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.snap_Learners_2013}">
				<li class="fieldcontain">
					<span id="snap_Learners_2013-label" class="property-label"><g:message code="schoolsData.snap_Learners_2013.label" default="Snap Learners2013" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2013-label"><g:fieldValue bean="${schoolsDataInstance}" field="snap_Learners_2013"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.specialisation}">
				<li class="fieldcontain">
					<span id="specialisation-label" class="property-label"><g:message code="schoolsData.specialisation.label" default="Specialisation" /></span>
					
						<span class="property-value" aria-labelledby="specialisation-label"><g:fieldValue bean="${schoolsDataInstance}" field="specialisation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.streetAddress}">
				<li class="fieldcontain">
					<span id="streetAddress-label" class="property-label"><g:message code="schoolsData.streetAddress.label" default="Street Address" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress-label"><g:fieldValue bean="${schoolsDataInstance}" field="streetAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.streetName}">
				<li class="fieldcontain">
					<span id="streetName-label" class="property-label"><g:message code="schoolsData.streetName.label" default="Street Name" /></span>
					
						<span class="property-value" aria-labelledby="streetName-label"><g:fieldValue bean="${schoolsDataInstance}" field="streetName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="schoolsData.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${schoolsDataInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.totalBoarders}">
				<li class="fieldcontain">
					<span id="totalBoarders-label" class="property-label"><g:message code="schoolsData.totalBoarders.label" default="Total Boarders" /></span>
					
						<span class="property-value" aria-labelledby="totalBoarders-label"><g:fieldValue bean="${schoolsDataInstance}" field="totalBoarders"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolsDataInstance?.town_City}">
				<li class="fieldcontain">
					<span id="town_City-label" class="property-label"><g:message code="schoolsData.town_City.label" default="Town City" /></span>
					
						<span class="property-value" aria-labelledby="town_City-label"><g:fieldValue bean="${schoolsDataInstance}" field="town_City"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${schoolsDataInstance?.id}" />
					<g:link class="edit" action="edit" id="${schoolsDataInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
