<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>Agent ${Agent.lName}'s Profile</h1>
		<!-- navbar, page headers will go here -->
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
	Clients:
		<c:forEach var="c" items="${Agent.clients}">
			<a href="insured.jsp">${c.fName} ${c.lName}</a>
			<br>
		</c:forEach>
		<br>
	Messages:
		<c:forEach var="m" items="${Agent.messages}">
			Message Id: ${m.id}
			From: ${m.insured.fName} ${m.insured.lName}
			To: ${m.insured}
			Message: ${m.messageBody}
		</c:forEach>
		<!--a list of all of the insured that the agent has as clients will be here, 
		each being a clickable link to a more detailed view of them-->
	
	<!-- closing body container div -->
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>