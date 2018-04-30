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
			
			<label for="firstName">Please enter your first name:</label>
			<input type="text" name="firstName" placeholder="Bob"/>
			
			<label for="lastName">Please enter your last name:</label>
			<input type="text" name="lastName" placeholder="Dobbs"/>
			
			<label for="age">Please enter your age:</label>
			<input type="number" name="age"/>
		
			<label for="species">Please select your species:</label>
			<select name="species">
			<c:forEach var="species" items="${allSpecies}">
				<option name="${species.name}" value="${species.id}">${species.name}</option>
			</c:forEach>
			</select>
			
			<label for="occupation">Please select your occupation:</label>
			<select name="occupation">
			<c:forEach var="job" items="${jobs}">
				<option name="${job.name}" value="${job.id}">${job.name}</option>
			</c:forEach>
			</select>
		
			<label for="street">Please enter your street address:</label>
			<input type="text" name="street"/>
			
			<label for="city">Please enter your city:</label>
			<input type="text" name="city"/>
			
			<label for="realm">Please enter your realm:</label>
			<input type="text" name="realm"/>
			  
			<input type="submit" value="Submit"/>
		
		</form>
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>