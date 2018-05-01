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
					<em>Kingdom has the coverage if you have the coin..</em>
				</h4>
			</div>
		</div>
	</div>
	<div class="feedHost col">
		<!-- Verification of request for coverage being submitted -->
		<c:if test="${! empty updateMessage}">
			<div class="feed">
				<h3>${updateMessage}</h3>
			</div>
		</c:if>
		<div class="feed">
			<h1>Your Profile</h1>
		</div>
	</div>





	<!-- opening header div -->
	<div>
	
		
		
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
		<c:if test="${!empty insured.agents}">
		<c:forEach var="a" items="${insured.agents}">
			${a.fName} ${a.lName}
		</c:forEach>
		</c:if>
		<br>
		Messages:<br>
		<c:if test="${!empty insured.messages}">
		<c:forEach var="m" items="${insured.messages}">
			Message Id: ${m.id}<br>
			From: ${m.insured.fName} ${m.insured.lName}<br>
			To: ${m.agent.fName} ${m.agent.lName}<br>
			Message: ${m.messageBody}<br>
		</c:forEach>
		</c:if>
		Plans:
			<ul>
		<c:forEach var="p" items="${Insured.plans}">
				<li>${p.name}</li>
				<li>${p.totalCostOfPlan}</li>
		</c:forEach>
			</ul>
		<form action="update.do" method="get">
			<input type="submit" class="btn btn-primary" value="Edit Plans">
		</form>
		
		<br>
		
		<form action="createPlan.do" method="get">
			<input type="hidden" value="${insured.id}">
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