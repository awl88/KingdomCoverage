<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	<div class="blended_grid">
		<div class="topBanner">
			<br>
			<div class="fancyBox">
				<h1 class="companyName">Kingdom Coverage</h1>
				<h4 class="script">
					<em>Kingdom has the coverage if you have the coin..</em>
				</h4>
			</div>
		</div>
	</div>
	<h1>Update your information</h1>
	<form action="insuredUpdated.do" method="POST">
		<div class="feedHost col">
			<label for="insuredFirstName">Please update your first name:</label>
			<input type="text" name="insuredFirstName" value="${insured.fName}" style="margin-top: 1.5px;" /> 
			<label for="insuredLastName">Please update your last name:</label> 
			<input type="text" name="insuredLastName" value="${insured.lName}" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="insuredAge">Please enter your age:</label> 
				<input type="number" min="0" max="100000" name="insuredAge" style="margin-top: 1.5px;" value="${insured.age}"/>
			</div>
			<div class="feed">
				<label for="insuredGender">Please enter your gender:</label>
				<select name="insuredGender" style="margin-top: 1.5px;">
					<c:if test="${insured.gender.toString() == 'm'}">
						<option selected name="male" value='m'>Male</option>
						<option name="female" value='f'>Female</option>
					</c:if>
					<c:if test="${insured.gender.toString() == 'f'}">
						<option name="male" value='m'>Male</option>
						<option selected name="female" value='f'>Female</option>
					</c:if>
				</select>
			</div>
			<div class="feed">
				<label for="insuredSpeciesId">Please select your species:</label> 
				<select name="insuredSpeciesId" style="margin-top: 1.5px;">
					<c:forEach var="species" items="${allSpecies}">
						<c:if test="${species == insured.species}">
							<option selected name="${species.name}" value="${species.id}">${species.name}</option>
						</c:if>
						<c:if test="${species != insured.species}">
							<option name="${species.name}" value="${species.id}">${species.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="feed">
				<label for="insuredOccupationId">Please select your occupation:</label> 
				<select name="insuredOccupationId" style="margin-top: 1.5px;">
					<c:forEach var="job" items="${jobs}">
						<c:if test="${job == insured.occupation}">
							<option selected name="${job.name}" value="${job.id}">${job.name}</option>
						</c:if>
						<c:if test="${job != insured.occupation}">
							<option name="${job.name}" value="${job.id}">${job.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="feed">
				<label for="addressStreet">Please enter your street address:</label>
				<input type="text" name="addressStreet" style="margin-top: 1.5px;" value="${address.street}"/>
			</div>
			<div class="feed">
				<label for="addressCity">Please enter your city:</label> 
				<input type="text" name="addressCity" style="margin-top: 1.5px;" value="${address.city}"/>
			</div>
			<div class="feed">
				<label for="addressRealm">Please enter your realm:</label> 
				<input type="text" name="addressRealm" style="margin-top: 1.5px;" value="${address.realm}"/>
			</div>
			<div class="feed">
				<input type="submit" value="Submit" class="gimmeRoom btn btn-primary" />
			</div>
		</div>
	</form>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>

