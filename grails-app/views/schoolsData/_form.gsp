<%@ page import="schoolsdata.SchoolsData" %>



<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'boardingSchool', 'error')} ">
	<label for="boardingSchool">
		<g:message code="schoolsData.boardingSchool.label" default="Boarding School" />
		
	</label>
	<g:textField name="boardingSchool" value="${schoolsDataInstance?.boardingSchool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'cellNo', 'error')} ">
	<label for="cellNo">
		<g:message code="schoolsData.cellNo.label" default="Cell No" />
		
	</label>
	<g:textField name="cellNo" value="${schoolsDataInstance?.cellNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'contactPerson', 'error')} ">
	<label for="contactPerson">
		<g:message code="schoolsData.contactPerson.label" default="Contact Person" />
		
	</label>
	<g:textField name="contactPerson" value="${schoolsDataInstance?.contactPerson}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'district', 'error')} ">
	<label for="district">
		<g:message code="schoolsData.district.label" default="District" />
		
	</label>
	<g:textField name="district" value="${schoolsDataInstance?.district}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'districtMunicipality', 'error')} ">
	<label for="districtMunicipality">
		<g:message code="schoolsData.districtMunicipality.label" default="District Municipality" />
		
	</label>
	<g:textField name="districtMunicipality" value="${schoolsDataInstance?.districtMunicipality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2007', 'error')} required">
	<label for="educator_Numbers_2007">
		<g:message code="schoolsData.educator_Numbers_2007.label" default="Educator Numbers2007" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2007" type="number" value="${schoolsDataInstance.educator_Numbers_2007}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2008', 'error')} required">
	<label for="educator_Numbers_2008">
		<g:message code="schoolsData.educator_Numbers_2008.label" default="Educator Numbers2008" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2008" type="number" value="${schoolsDataInstance.educator_Numbers_2008}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2009', 'error')} required">
	<label for="educator_Numbers_2009">
		<g:message code="schoolsData.educator_Numbers_2009.label" default="Educator Numbers2009" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2009" type="number" value="${schoolsDataInstance.educator_Numbers_2009}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2010', 'error')} required">
	<label for="educator_Numbers_2010">
		<g:message code="schoolsData.educator_Numbers_2010.label" default="Educator Numbers2010" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2010" type="number" value="${schoolsDataInstance.educator_Numbers_2010}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2011', 'error')} required">
	<label for="educator_Numbers_2011">
		<g:message code="schoolsData.educator_Numbers_2011.label" default="Educator Numbers2011" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2011" type="number" value="${schoolsDataInstance.educator_Numbers_2011}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2012', 'error')} required">
	<label for="educator_Numbers_2012">
		<g:message code="schoolsData.educator_Numbers_2012.label" default="Educator Numbers2012" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2012" type="number" value="${schoolsDataInstance.educator_Numbers_2012}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'educator_Numbers_2013', 'error')} required">
	<label for="educator_Numbers_2013">
		<g:message code="schoolsData.educator_Numbers_2013.label" default="Educator Numbers2013" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2013" type="number" value="${schoolsDataInstance.educator_Numbers_2013}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="schoolsData.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: schoolsDataInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'localMunicipality', 'error')} ">
	<label for="localMunicipality">
		<g:message code="schoolsData.localMunicipality.label" default="Local Municipality" />
		
	</label>
	<g:textField name="localMunicipality" value="${schoolsDataInstance?.localMunicipality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="schoolsData.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: schoolsDataInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'noFeeSchool', 'error')} ">
	<label for="noFeeSchool">
		<g:message code="schoolsData.noFeeSchool.label" default="No Fee School" />
		
	</label>
	<g:textField name="noFeeSchool" value="${schoolsDataInstance?.noFeeSchool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'phase', 'error')} ">
	<label for="phase">
		<g:message code="schoolsData.phase.label" default="Phase" />
		
	</label>
	<g:textField name="phase" value="${schoolsDataInstance?.phase}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'postalAddress', 'error')} ">
	<label for="postalAddress">
		<g:message code="schoolsData.postalAddress.label" default="Postal Address" />
		
	</label>
	<g:textField name="postalAddress" value="${schoolsDataInstance?.postalAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="schoolsData.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${schoolsDataInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'quintile', 'error')} ">
	<label for="quintile">
		<g:message code="schoolsData.quintile.label" default="Quintile" />
		
	</label>
	<g:textField name="quintile" value="${schoolsDataInstance?.quintile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'registration_Date', 'error')} ">
	<label for="registration_Date">
		<g:message code="schoolsData.registration_Date.label" default="Registration Date" />
		
	</label>
	<g:textField name="registration_Date" value="${schoolsDataInstance?.registration_Date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'schoolName', 'error')} ">
	<label for="schoolName">
		<g:message code="schoolsData.schoolName.label" default="School Name" />
		
	</label>
	<g:textField name="schoolName" value="${schoolsDataInstance?.schoolName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'section21', 'error')} ">
	<label for="section21">
		<g:message code="schoolsData.section21.label" default="Section21" />
		
	</label>
	<g:textField name="section21" value="${schoolsDataInstance?.section21}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'sector', 'error')} ">
	<label for="sector">
		<g:message code="schoolsData.sector.label" default="Sector" />
		
	</label>
	<g:textField name="sector" value="${schoolsDataInstance?.sector}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2007', 'error')} required">
	<label for="snap_Learners_2007">
		<g:message code="schoolsData.snap_Learners_2007.label" default="Snap Learners2007" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2007" type="number" value="${schoolsDataInstance.snap_Learners_2007}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2008', 'error')} required">
	<label for="snap_Learners_2008">
		<g:message code="schoolsData.snap_Learners_2008.label" default="Snap Learners2008" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2008" type="number" value="${schoolsDataInstance.snap_Learners_2008}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2009', 'error')} required">
	<label for="snap_Learners_2009">
		<g:message code="schoolsData.snap_Learners_2009.label" default="Snap Learners2009" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2009" type="number" value="${schoolsDataInstance.snap_Learners_2009}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2010', 'error')} required">
	<label for="snap_Learners_2010">
		<g:message code="schoolsData.snap_Learners_2010.label" default="Snap Learners2010" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2010" type="number" value="${schoolsDataInstance.snap_Learners_2010}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2011', 'error')} required">
	<label for="snap_Learners_2011">
		<g:message code="schoolsData.snap_Learners_2011.label" default="Snap Learners2011" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2011" type="number" value="${schoolsDataInstance.snap_Learners_2011}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2012', 'error')} required">
	<label for="snap_Learners_2012">
		<g:message code="schoolsData.snap_Learners_2012.label" default="Snap Learners2012" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2012" type="number" value="${schoolsDataInstance.snap_Learners_2012}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'snap_Learners_2013', 'error')} required">
	<label for="snap_Learners_2013">
		<g:message code="schoolsData.snap_Learners_2013.label" default="Snap Learners2013" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2013" type="number" value="${schoolsDataInstance.snap_Learners_2013}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'specialisation', 'error')} ">
	<label for="specialisation">
		<g:message code="schoolsData.specialisation.label" default="Specialisation" />
		
	</label>
	<g:textField name="specialisation" value="${schoolsDataInstance?.specialisation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'streetAddress', 'error')} ">
	<label for="streetAddress">
		<g:message code="schoolsData.streetAddress.label" default="Street Address" />
		
	</label>
	<g:textField name="streetAddress" value="${schoolsDataInstance?.streetAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'streetName', 'error')} ">
	<label for="streetName">
		<g:message code="schoolsData.streetName.label" default="Street Name" />
		
	</label>
	<g:textField name="streetName" value="${schoolsDataInstance?.streetName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="schoolsData.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${schoolsDataInstance?.telephone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'totalBoarders', 'error')} ">
	<label for="totalBoarders">
		<g:message code="schoolsData.totalBoarders.label" default="Total Boarders" />
		
	</label>
	<g:textField name="totalBoarders" value="${schoolsDataInstance?.totalBoarders}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolsDataInstance, field: 'town_City', 'error')} ">
	<label for="town_City">
		<g:message code="schoolsData.town_City.label" default="Town City" />
		
	</label>
	<g:textField name="town_City" value="${schoolsDataInstance?.town_City}"/>
</div>

