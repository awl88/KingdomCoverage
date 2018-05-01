"WebContent/views/insuredInfo.jsp"<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>

		<jsp:include page="partials/navbar.jsp"></jsp:include>
		<h1>${insured.fName}${insured.lName}'s Policies</h1>

	</div>

	<div class="container">
		<form action="clientChanges.do" method="POST">
			Name: ${insured.fName} ${insured.lName} <br> Age: ${insured.age}
			<br> Gender: ${insured.gender} <br> Address:
			${insured.address.street}, ${insured.address.city},
			${insured.address.realm} <br> Agent:
			<c:if test="${!empty insured.agents}">
		        <c:forEach var="a" items="${insured.agents}">
		            ${a.fName} ${a.lName}
		        </c:forEach>
		    </c:if>
			<br> Messages:<br>
			<c:if test="${! empty insured.messages}">
				<c:forEach var="m" items="${insured.messages}">
					Message Id: ${m.id}<br>
					From: ${m.insured.fName} ${m.insured.lName}<br>
					To: ${m.agent.fName} ${m.agent.lName}<br>
					Message: ${m.messageBody}<br>
				</c:forEach>
			</c:if>
			Plans:<br>
			<c:forEach var="p" items="${insured.plans}">
				<c:forEach items="${p.coverages}" var="c">
					<input type="checkbox" name="plan" value="${c.id}">
					${c.name}<br>
				</c:forEach>
			</c:forEach>
			<!-- a more detailed view of a single insured will go here, including all 
		their plans and info, there will be options to edit the plans, add a new one
		or delete the plan -->


		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Remove Policies</button>

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Remove Policies</h4>
					</div>
					<div class="modal-body">
						<p>Are you sure you would like to delete this policy from the plan?</p>
						<input type="submit" class="btn btn-warning" value="Yes">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Back</button>
					</div>
				</div>

			</div>
		</div>
			<!-- closing body container div -->
		</form>
		
	</div>

	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>