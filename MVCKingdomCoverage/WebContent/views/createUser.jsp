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
	<form action="created.do" method="POST">
		<div class="feedHost col">
			<div class="feed">
				<label for="userName">Please enter the username you would
					like for your account: </label> <input type="text" name="userName"
					placeholder="bobdobbs" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="userPassword">Please enter a password:</label> <input
					type="text" name="userPassword" placeholder="Wombat1"
					style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="insuredFirstName">Please enter your first name:</label>
				<input type="text" name="insuredFirstName" placeholder="Bob"
					style="margin-top: 1.5px;" /> <label for="insuredLastName">Please
					enter your last name:</label> <input type="text" name="insuredLastName"
					placeholder="Dobbs" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="insuredAge">Please enter your age:</label> <input
					type="number" min="0" max="100000" name="insuredAge" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="insuredGender">Please enter your gender:</label>
				<select name="insuredGender" style="margin-top: 1.5px;">
					<option name="male" value='m'>Male</option>
					<option name="female" value='f'>Female</option>
				</select>
			</div>
			<div class="feed">
				<label for="insuredSpeciesId">Please select your species:</label> <select
					name="insuredSpeciesId" style="margin-top: 1.5px;">
					<c:forEach var="species" items="${allSpecies}">
						<option name="${species.name}" value="${species.id}">${species.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="feed">
				<label for="insuredOccupationId">Please select your
					occupation:</label> <select name="insuredOccupationId"
					style="margin-top: 1.5px;">
					<c:forEach var="job" items="${jobs}">
						<option name="${job.name}" value="${job.id}">${job.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="feed">
				<label for="addressStreet">Please enter your street address:</label>
				<input type="text" name="addressStreet" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="addressCity">Please enter your city:</label> <input
					type="text" name="addressCity" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<label for="addressRealm">Please enter your realm:</label> <input
					type="text" name="addressRealm" style="margin-top: 1.5px;" />
			</div>
			<div class="feed">
				<input type="submit" value="Submit" class="gimmeRoom btn btn-primary" />
			</div>
		</div>
	</form>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>