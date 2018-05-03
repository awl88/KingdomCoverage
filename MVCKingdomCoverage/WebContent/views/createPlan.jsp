<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>
	<!-- navbar, page headers will go here -->
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	<div class="blended_grid">
		<div class="topBanner">
			<br>
			<div class="fancyBox">
				<h1 class="companyName">Kingdom Coverage</h1>
				<h4 class="script">
					<em>Kingdom has the coverage if you have the coin...</em>
				</h4>
			</div>
		</div>
	</div>

	<div class="feedHost col">
		<div class="feed">
			<br><h4>Please select the coverage you would like add: </h4>
		<form action="insuredWithMessage.do" method = "POST">
			<br>
			<select name="message">
				<c:forEach var = "coverage" items="${allPlans}">
					<option value="${coverage.name}">${coverage.name}</option>
				</c:forEach>			
			</select> 
			<br>
			<br>
			<input type="submit" class="pressed btn btn-primary" value="Request Coverage" style="margin-bottom: 3px;">
		</form>
		</div>
	</div>

	<!-- opening header div -->
	<div>
	
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
	
		<!-- a form to create a new plan will go here -->
		
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>