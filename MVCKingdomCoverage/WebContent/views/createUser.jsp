<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>create user route test</h1>
		<!-- navbar, page headers will go here -->
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
	
		<!-- a form to create a new user will go here -->
		
		<!-- action will need to be changed to actual route, remove this comment once that has been done -->
		<form action="created.do" method="POST">
		
			<!-- some of the values will need to be altered and matched later, remove this comment once this has been done -->
			<label for="userName">Please enter the username you would like for your account:</label>
			<input type="text" name="userName" placeholder="bobdobbs"/>
			
			<label for="userPassword">Please enter a password:</label>
			<input type="text" name="userPassword" placeholder="Wombat1"/>
			
			<label for="insuredFirstName">Please enter your first name:</label>
			<input type="text" name="insuredFirstName" placeholder="Bob"/>
			
			<label for="insuredLastName">Please enter your last name:</label>
			<input type="text" name="insuredLastName" placeholder="Dobbs"/>
			
			<label for="insuredAge">Please enter your age:</label>
			<input type="number" name="insuredAge"/>
		
			<label for="insuredSpeciesId">Please select your species:</label>
			<select name="insuredSpeciesId">
				<c:forEach var="species" items="${allSpecies}">
					<option name="${species.name}" value="${species.id}">${species.name}</option>
				</c:forEach>
			</select>
			
			<label for="insuredOccupationId">Please select your occupation:</label>
			<select name="insuredOccupationId">
				<c:forEach var="job" items="${jobs}">
					<option name="${job.name}" value="${job.id}">${job.name}</option>
				</c:forEach>
			</select>
		
			<label for="addressStreet">Please enter your street address:</label>
			<input type="text" name="addressStreet"/>
			
			<label for="addressCity">Please enter your city:</label>
			<input type="text" name="addressCity"/>
			
			<label for="addressRealm">Please enter your realm:</label>
			<input type="text" name="addressRealm"/>
			
			<input type="submit" value="Submit"/>
		
		</form>
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>