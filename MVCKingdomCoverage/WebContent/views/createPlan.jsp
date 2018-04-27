<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>Choose A Plan!</h1>
		<!-- navbar, page headers will go here -->
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		<form action="insured.do">
			Get your Plan
			<br>
			<select name="coverages">
				<c:forEach var = "c" items="${InsurancePlan.coverages}">
					<${c.name}>
					<br>
				</c:forEach>			
			</select> 
			
		</form>
	
		<!-- a form to create a new plan will go here -->
		
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>