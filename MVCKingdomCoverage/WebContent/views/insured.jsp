<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	<c:if test="${updateMessage not empty}">
		<h3>${updateMessage}</h3>
	</c:if>
	
		<h1>Your Profile</h1>
		<!-- navbar, page headers will go here -->
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		
	
		<!--a list of all the insured's plans will be here, as well as information about their agent, maybe an 
		option to view or edit their insured field values(age, gender, etc.), plans they have been approved for 
		that are awaiting them clicking an activate button -->
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>