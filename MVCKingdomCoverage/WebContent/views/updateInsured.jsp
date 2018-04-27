<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>Update your information</h1>
		<!-- navbar, page headers will go here -->
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		<form action="insured.do">
			First Name: <input type="text" name="fName" value="${Insured.fName}">
			Last Name: <input type="text" name="lName" value="${Insured.lName}">
			Age: <input type="number" name="age" step="1" value="${Insured.age}">
			Gender: <select name="gender">
				<option value="M">
				<option value="F">
			</select>
			Occupation: <select name="occupation">
				<c:forEach var="o" items="${Occupation}">
					<${o.name}>
					<br>
				</c:forEach>
			</select>
			
			<input type="submit" class="btn btn-success" value="Update Profile">
		</form>
		<!-- a form to update an existing user will be here -->
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>