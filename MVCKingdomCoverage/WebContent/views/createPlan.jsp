<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<!-- opening header div -->
	<div>
	
		<!-- navbar, page headers will go here -->
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		
	<!-- closing header div -->
	</div>
		<h3>Please select the coverage you would like: </h3>
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		<form action="insuredWithMessage.do" method = "POST">
			<br>
			<select name="message">
				<c:forEach var = "coverage" items="${allPlans}">
					<option value="${coverage.name}">${coverage.name}</option>
				</c:forEach>			
			</select> 
			<br>
			<br>
			<input type="submit" class="btn btn-primary" value="Request Coverage">
		</form>
	
		<!-- a form to create a new plan will go here -->
		
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>