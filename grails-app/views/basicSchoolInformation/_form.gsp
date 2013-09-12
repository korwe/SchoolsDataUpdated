<%@ page import="schoolsdata.BasicSchoolInformation" %>


<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'boardingSchool', 'error')} ">
	<label for="boardingSchool">
		<g:message code="aaa.boardingSchool.label" default="Boarding School" />
		
	</label>
	<g:textField name="boardingSchool" value="${basicSchoolInformationInstance?.boardingSchool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'cellNo', 'error')} ">
	<label for="cellNo">
		<g:message code="aaa.cellNo.label" default="Cell No" />
		
	</label>
	<g:textField name="cellNo" value="${basicSchoolInformationInstance?.cellNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'contactPerson', 'error')} ">
	<label for="contactPerson">
		<g:message code="aaa.contactPerson.label" default="Contact Person" />
		
	</label>
	<g:textField name="contactPerson" value="${basicSchoolInformationInstance?.contactPerson}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'district', 'error')} ">
	<label for="district">
		<g:message code="aaa.district.label" default="District" />
		
	</label>
	<g:textField name="district" value="${basicSchoolInformationInstance?.district}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'districtMunicipality', 'error')} ">
	<label for="districtMunicipality">
		<g:message code="aaa.districtMunicipality.label" default="District Municipality" />
		
	</label>
	<g:textField name="districtMunicipality" value="${basicSchoolInformationInstance?.districtMunicipality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2007', 'error')} required">
	<label for="educator_Numbers_2007">
		<g:message code="aaa.educator_Numbers_2007.label" default="Educator Numbers2007" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2007" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2007}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2008', 'error')} required">
	<label for="educator_Numbers_2008">
		<g:message code="aaa.educator_Numbers_2008.label" default="Educator Numbers2008" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2008" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2008}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2009', 'error')} required">
	<label for="educator_Numbers_2009">
		<g:message code="aaa.educator_Numbers_2009.label" default="Educator Numbers2009" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2009" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2009}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2010', 'error')} required">
	<label for="educator_Numbers_2010">
		<g:message code="aaa.educator_Numbers_2010.label" default="Educator Numbers2010" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2010" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2010}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2011', 'error')} required">
	<label for="educator_Numbers_2011">
		<g:message code="aaa.educator_Numbers_2011.label" default="Educator Numbers2011" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2011" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2011}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2012', 'error')} required">
	<label for="educator_Numbers_2012">
		<g:message code="aaa.educator_Numbers_2012.label" default="Educator Numbers2012" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2012" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2012}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'educator_Numbers_2013', 'error')} required">
	<label for="educator_Numbers_2013">
		<g:message code="aaa.educator_Numbers_2013.label" default="Educator Numbers2013" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="educator_Numbers_2013" type="number" value="${basicSchoolInformationInstance.educator_Numbers_2013}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="aaa.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: basicSchoolInformationInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'localMunicipality', 'error')} ">
	<label for="localMunicipality">
		<g:message code="aaa.localMunicipality.label" default="Local Municipality" />
		
	</label>
	<g:textField name="localMunicipality" value="${basicSchoolInformationInstance?.localMunicipality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="aaa.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: basicSchoolInformationInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'noFeeSchool', 'error')} ">
	<label for="noFeeSchool">
		<g:message code="aaa.noFeeSchool.label" default="No Fee School" />
		
	</label>
	<g:textField name="noFeeSchool" value="${basicSchoolInformationInstance?.noFeeSchool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'phase', 'error')} ">
	<label for="phase">
		<g:message code="aaa.phase.label" default="Phase" />
		
	</label>
	<g:textField name="phase" value="${basicSchoolInformationInstance?.phase}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'postalAddress', 'error')} ">
	<label for="postalAddress">
		<g:message code="aaa.postalAddress.label" default="Postal Address" />
		
	</label>
	<g:textField name="postalAddress" value="${basicSchoolInformationInstance?.postalAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="aaa.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${basicSchoolInformationInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'quintile', 'error')} ">
	<label for="quintile">
		<g:message code="aaa.quintile.label" default="Quintile" />
		
	</label>
	<g:textField name="quintile" value="${basicSchoolInformationInstance?.quintile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'registration_Date', 'error')} ">
	<label for="registration_Date">
		<g:message code="aaa.registration_Date.label" default="Registration Date" />
		
	</label>
	<g:textField name="registration_Date" value="${basicSchoolInformationInstance?.registration_Date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'schoolName', 'error')} ">
	<label for="schoolName">
		<g:message code="aaa.schoolName.label" default="School Name" />
		
	</label>
	<g:textField name="schoolName" value="${basicSchoolInformationInstance?.schoolName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'section21', 'error')} ">
	<label for="section21">
		<g:message code="aaa.section21.label" default="Section21" />
		
	</label>
	<g:textField name="section21" value="${basicSchoolInformationInstance?.section21}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'sector', 'error')} ">
	<label for="sector">
		<g:message code="aaa.sector.label" default="Sector" />
		
	</label>
	<g:textField name="sector" value="${basicSchoolInformationInstance?.sector}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2007', 'error')} required">
	<label for="snap_Learners_2007">
		<g:message code="aaa.snap_Learners_2007.label" default="Snap Learners2007" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2007" type="number" value="${basicSchoolInformationInstance.snap_Learners_2007}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2008', 'error')} required">
	<label for="snap_Learners_2008">
		<g:message code="aaa.snap_Learners_2008.label" default="Snap Learners2008" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2008" type="number" value="${basicSchoolInformationInstance.snap_Learners_2008}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2009', 'error')} required">
	<label for="snap_Learners_2009">
		<g:message code="aaa.snap_Learners_2009.label" default="Snap Learners2009" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2009" type="number" value="${basicSchoolInformationInstance.snap_Learners_2009}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2010', 'error')} required">
	<label for="snap_Learners_2010">
		<g:message code="aaa.snap_Learners_2010.label" default="Snap Learners2010" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2010" type="number" value="${basicSchoolInformationInstance.snap_Learners_2010}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2011', 'error')} required">
	<label for="snap_Learners_2011">
		<g:message code="aaa.snap_Learners_2011.label" default="Snap Learners2011" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2011" type="number" value="${basicSchoolInformationInstance.snap_Learners_2011}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2012', 'error')} required">
	<label for="snap_Learners_2012">
		<g:message code="aaa.snap_Learners_2012.label" default="Snap Learners2012" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2012" type="number" value="${basicSchoolInformationInstance.snap_Learners_2012}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'snap_Learners_2013', 'error')} required">
	<label for="snap_Learners_2013">
		<g:message code="aaa.snap_Learners_2013.label" default="Snap Learners2013" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snap_Learners_2013" type="number" value="${basicSchoolInformationInstance.snap_Learners_2013}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'specialisation', 'error')} ">
	<label for="specialisation">
		<g:message code="aaa.specialisation.label" default="Specialisation" />
		
	</label>
	<g:textField name="specialisation" value="${basicSchoolInformationInstance?.specialisation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'streetAddress', 'error')} ">
	<label for="streetAddress">
		<g:message code="aaa.streetAddress.label" default="Street Address" />
		
	</label>
	<g:textField name="streetAddress" value="${basicSchoolInformationInstance?.streetAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'streetName', 'error')} ">
	<label for="streetName">
		<g:message code="aaa.streetName.label" default="Street Name" />
		
	</label>
	<g:textField name="streetName" value="${basicSchoolInformationInstance?.streetName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="aaa.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${basicSchoolInformationInstance?.telephone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'totalBoarders', 'error')} ">
	<label for="totalBoarders">
		<g:message code="aaa.totalBoarders.label" default="Total Boarders" />
		
	</label>
	<g:textField name="totalBoarders" value="${basicSchoolInformationInstance?.totalBoarders}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicSchoolInformationInstance, field: 'town_City', 'error')} ">
	<label for="town_City">
		<g:message code="aaa.town_City.label" default="Town City" />
		
	</label>
	<g:textField name="town_City" value="${basicSchoolInformationInstance?.town_City}"/>
</div>

