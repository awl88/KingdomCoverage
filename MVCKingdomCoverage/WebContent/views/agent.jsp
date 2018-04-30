<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<h1>Agent ${agent.lName}'s Profile</h1>
		<!-- navbar, page headers will go here -->
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
	Clients:
		<c:forEach var="c" items="${agent.clients}">
			<a href="insuredInfo.jsp">${c.fName} ${c.lName}</a>
			<br>
		</c:forEach>
		<br>
	Messages:
		<c:forEach var="m" items="${agent.messages}">
			Message Id: ${m.id}<br>
			From: ${m.agent.fName} ${m.agent.lName}<br>
			To: ${m.insured.fName} ${m.insured.lName}<br>
			Message: ${m.messageBody}<br>
		</c:forEach>
		<!--a list of all of the insured that the agent has as clients will be here, 
		each being a clickable link to a more detailed view of them-->
	
	<!-- closing body container div -->
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>