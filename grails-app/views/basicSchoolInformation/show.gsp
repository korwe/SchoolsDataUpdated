
<%@ page import="schoolsdata.BasicSchoolInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basicSchoolInformation.label', default: 'BasicSchoolInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-basicSchoolInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-basicSchoolInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list basicSchoolInformation">
			
				<g:if test="${basicSchoolInformationInstance?.boardingSchool}">
				<li class="fieldcontain">
					<span id="boardingSchool-label" class="property-label"><g:message code="basicSchoolInformation.boardingSchool.label" default="Boarding School" /></span>
					
						<span class="property-value" aria-labelledby="boardingSchool-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="boardingSchool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.cellNo}">
				<li class="fieldcontain">
					<span id="cellNo-label" class="property-label"><g:message code="basicSchoolInformation.cellNo.label" default="Cell No" /></span>
					
						<span class="property-value" aria-labelledby="cellNo-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="cellNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.contactPerson}">
				<li class="fieldcontain">
					<span id="contactPerson-label" class="property-label"><g:message code="basicSchoolInformation.contactPerson.label" default="Contact Person" /></span>
					
						<span class="property-value" aria-labelledby="contactPerson-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="contactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="basicSchoolInformation.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="district"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.districtMunicipality}">
				<li class="fieldcontain">
					<span id="districtMunicipality-label" class="property-label"><g:message code="basicSchoolInformation.districtMunicipality.label" default="District Municipality" /></span>
					
						<span class="property-value" aria-labelledby="districtMunicipality-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="districtMunicipality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2007}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2007-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2007.label" default="Educator Numbers2007" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2007-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2007"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2008}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2008-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2008.label" default="Educator Numbers2008" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2008-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2008"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2009}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2009-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2009.label" default="Educator Numbers2009" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2009-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2009"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2010}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2010-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2010.label" default="Educator Numbers2010" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2010-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2010"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2011}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2011-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2011.label" default="Educator Numbers2011" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2011-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2011"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2012}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2012-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2012.label" default="Educator Numbers2012" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2012-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2012"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.educator_Numbers_2013}">
				<li class="fieldcontain">
					<span id="educator_Numbers_2013-label" class="property-label"><g:message code="basicSchoolInformation.educator_Numbers_2013.label" default="Educator Numbers2013" /></span>
					
						<span class="property-value" aria-labelledby="educator_Numbers_2013-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="educator_Numbers_2013"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="basicSchoolInformation.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.localMunicipality}">
				<li class="fieldcontain">
					<span id="localMunicipality-label" class="property-label"><g:message code="basicSchoolInformation.localMunicipality.label" default="Local Municipality" /></span>
					
						<span class="property-value" aria-labelledby="localMunicipality-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="localMunicipality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="basicSchoolInformation.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.noFeeSchool}">
				<li class="fieldcontain">
					<span id="noFeeSchool-label" class="property-label"><g:message code="basicSchoolInformation.noFeeSchool.label" default="No Fee School" /></span>
					
						<span class="property-value" aria-labelledby="noFeeSchool-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="noFeeSchool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.phase}">
				<li class="fieldcontain">
					<span id="phase-label" class="property-label"><g:message code="basicSchoolInformation.phase.label" default="Phase" /></span>
					
						<span class="property-value" aria-labelledby="phase-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="phase"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.postalAddress}">
				<li class="fieldcontain">
					<span id="postalAddress-label" class="property-label"><g:message code="basicSchoolInformation.postalAddress.label" default="Postal Address" /></span>
					
						<span class="property-value" aria-labelledby="postalAddress-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="postalAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.province}">
				<li class="fieldcontain">
					<span id="province-label" class="property-label"><g:message code="basicSchoolInformation.province.label" default="Province" /></span>
					
						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="province"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.quintile}">
				<li class="fieldcontain">
					<span id="quintile-label" class="property-label"><g:message code="basicSchoolInformation.quintile.label" default="Quintile" /></span>
					
						<span class="property-value" aria-labelledby="quintile-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="quintile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.registration_Date}">
				<li class="fieldcontain">
					<span id="registration_Date-label" class="property-label"><g:message code="basicSchoolInformation.registration_Date.label" default="Registration Date" /></span>
					
						<span class="property-value" aria-labelledby="registration_Date-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="registration_Date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.schoolName}">
				<li class="fieldcontain">
					<span id="schoolName-label" class="property-label"><g:message code="basicSchoolInformation.schoolName.label" default="School Name" /></span>
					
						<span class="property-value" aria-labelledby="schoolName-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="schoolName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.section21}">
				<li class="fieldcontain">
					<span id="section21-label" class="property-label"><g:message code="basicSchoolInformation.section21.label" default="Section21" /></span>
					
						<span class="property-value" aria-labelledby="section21-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="section21"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.sector}">
				<li class="fieldcontain">
					<span id="sector-label" class="property-label"><g:message code="basicSchoolInformation.sector.label" default="Sector" /></span>
					
						<span class="property-value" aria-labelledby="sector-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="sector"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2007}">
				<li class="fieldcontain">
					<span id="snap_Learners_2007-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2007.label" default="Snap Learners2007" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2007-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2007"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2008}">
				<li class="fieldcontain">
					<span id="snap_Learners_2008-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2008.label" default="Snap Learners2008" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2008-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2008"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2009}">
				<li class="fieldcontain">
					<span id="snap_Learners_2009-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2009.label" default="Snap Learners2009" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2009-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2009"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2010}">
				<li class="fieldcontain">
					<span id="snap_Learners_2010-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2010.label" default="Snap Learners2010" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2010-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2010"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2011}">
				<li class="fieldcontain">
					<span id="snap_Learners_2011-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2011.label" default="Snap Learners2011" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2011-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2011"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2012}">
				<li class="fieldcontain">
					<span id="snap_Learners_2012-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2012.label" default="Snap Learners2012" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2012-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2012"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.snap_Learners_2013}">
				<li class="fieldcontain">
					<span id="snap_Learners_2013-label" class="property-label"><g:message code="basicSchoolInformation.snap_Learners_2013.label" default="Snap Learners2013" /></span>
					
						<span class="property-value" aria-labelledby="snap_Learners_2013-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="snap_Learners_2013"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.specialisation}">
				<li class="fieldcontain">
					<span id="specialisation-label" class="property-label"><g:message code="basicSchoolInformation.specialisation.label" default="Specialisation" /></span>
					
						<span class="property-value" aria-labelledby="specialisation-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="specialisation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.streetAddress}">
				<li class="fieldcontain">
					<span id="streetAddress-label" class="property-label"><g:message code="basicSchoolInformation.streetAddress.label" default="Street Address" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="streetAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.streetName}">
				<li class="fieldcontain">
					<span id="streetName-label" class="property-label"><g:message code="basicSchoolInformation.streetName.label" default="Street Name" /></span>
					
						<span class="property-value" aria-labelledby="streetName-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="streetName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="basicSchoolInformation.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.totalBoarders}">
				<li class="fieldcontain">
					<span id="totalBoarders-label" class="property-label"><g:message code="basicSchoolInformation.totalBoarders.label" default="Total Boarders" /></span>
					
						<span class="property-value" aria-labelledby="totalBoarders-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="totalBoarders"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicSchoolInformationInstance?.town_City}">
				<li class="fieldcontain">
					<span id="town_City-label" class="property-label"><g:message code="basicSchoolInformation.town_City.label" default="Town City" /></span>
					
						<span class="property-value" aria-labelledby="town_City-label"><g:fieldValue bean="${basicSchoolInformationInstance}" field="town_City"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${basicSchoolInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${basicSchoolInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
