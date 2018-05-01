"WebContent/views/insuredInfo.jsp"<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		<h1>${insured.fName} ${insured.lName}'s Policies</h1>
		
	</div>

	<div class="container">
	<form action = "agent.jsp" method = "POST">
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
				<input type="checkbox" name="plan" value = "${p.name}"><li>${p.name}</li>
		</c:forEach>
			</ul>
		<!-- a more detailed view of a single insured will go here, including all 
		their plans and info, there will be options to edit the plans, add a new one
		or delete the plan -->
	
	<!-- closing body container div -->
		<input type="submit" class ="btn btn-warning" value = "Remove policies">
	</form>
	
	
	</div>
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>