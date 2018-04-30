<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	<c:if test="${! empty updateMessage}">
		<h3>${updateMessage}</h3>
	</c:if>
	
		<h1>Your Profile</h1>
		<!-- navbar, page headers will go here -->
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		Name: ${insured.fName} ${insured.lName}
		<br>
		Age: ${insured.age}
		<br>
		Gender: ${insured.gender}
		<br>
		Address: ${insured.address.street}, ${insured.address.city}, ${insured.address.realm}
		<br>
		Agent: 
		<c:forEach var="a" items="${insured.agents}">
			${a.fName} ${a.lName}
		</c:forEach>
		<br>
		Messages:<br>
		<c:forEach var="m" items="${insured.messages}">
			Message Id: ${m.id}<br>
		<!-- May change to an if conditional so that FROM displays the insured if the user is an agent -->
			From: ${m.agent.fName} ${m.agent.lName}<br>
			To: ${m.insured.fName} ${m.insured.lName}<br>
			Message: ${m.messageBody}<br>
		</c:forEach>
		Plans:
			<ul>
		<c:forEach var="p" items="${Insured.plans}">
				<li>${p.name}</li>
		</c:forEach>
			</ul>
		<form action="update.do" method="get">
			<input type="submit" class="btn btn-primary" value="Edit Plans">
		</form>
		
		<br>
		
		<form action="createPlan.do" method="get">
			<input type="submit" class="btn btn-default" value = "Add a Plan">
		</form>
	
		<!--a list of all the insured's plans will be here, as well as information about their agent, maybe an 
		option to view or edit their insured field values(age, gender, etc.), plans they have been approved for 
		that are awaiting them clicking an activate button -->
	
	<!-- closing body container div -->
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>