<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>create plan route test</h1>
		<!-- navbar, page headers will go here -->
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
	
		<!-- a form to create a new plan will go here -->
		
		<!-- action will need to be changed to actual route, remove this comment once that has been done -->
		<form action="addInsuredToDatabase.do" method="POST">
		
			<!-- some of the values will need to be altered and matched later, remove this comment once this has been done -->
			<label for="userName">Please enter the username you would like for your account:</label>
			<input type="text" name="userName" placeholder="bobdobbs"/>
			
			<label for="password">Please enter a password:</label>
			<input type="text" name="password" placeholder="Wombat1"/>
			
			<label for="firstName">Please enter your first name:</label>
			<input type="text" name="firstName" placeholder="Bob"/>
			
			<label for="lastName">Please enter your last name:</label>
			<input type="text" name="lastName" placeholder="Dobbs"/>
			
			<label for="age">Please enter your age:</label>
			<input type="number" name="age"/>
			
			<label for="species">Please select your species:</label>
				<select name="species">
				<option name="hobbit" value="1">Hobbit</option>
				<option name="human" value="2">Human</option>
				<!-- insert all the species options here, remove this comment once this has been done -->
			</select>
			
			<label for="occupation">Please select your occupation:</label>
				<select name="occupation">
				<option name="adventurer" value="1">Adventurer</option>
				<option name="wizard" value="2">Wizard</option>
				<!-- insert all the occupation options here, remove this comment once this has been done -->
			</select>
			
			<label for="street">Please enter your street address:</label>
			<input type="text" name="street"/>
			
			<label for="city">Please enter your city:</label>
			<input type="text" name="street"/>
			
			<label for="realm">Please enter your realm:</label>
			<input type="text" name="realm"/>
			  
			<input type="submit" value="Submit"/>
		
		</form>
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>