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
		<div class="row">
			<div class="feedHost col-md-8">
				<!-- Verification of request for coverage being submitted -->
				<c:if test="${! empty updateMessage}">
					<div class="feed">
						<br>
						<h3>${updateMessage}</h3>
					</div>
				</c:if>
				<div class="feed">
					<br>
					<h1>Agent ${agent.lName}'s Profile</h1>
				</div>
				<div class="feed">
					<table>
						<tbody>
							<tr>
								<td>Name:</td>
								<td>-------------------------------</td>
								<td>${insured.fName} ${insured.lName}</td>
							</tr>
							<tr>
								<td>Age:</td>
								<td>-------------------------------</td>
								<td>${insured.age}</td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td>-------------------------------</td>
								<td>${insured.gender}</td>
							</tr>
							<tr>
								<td>Address:</td>
								<td>-------------------------------</td>
								<td>${insured.address.street}, ${insured.address.city},
									${insured.address.realm}</td>
							</tr>
							<tr>
								<td>Agent:</td>
								<td>-------------------------------</td>
								<td><c:if test="${!empty insured.agents}">
										<c:forEach var="a" items="${insured.agents}">
									${a.fName} ${a.lName}
								</c:forEach>
									</c:if></td>
							</tr>
							<tr>
								<td>Total Premiums: </td>
								<td>-------------------------------</td>
								<td>
									<c:forEach var="p" items="${insured.plans}">
										${p.totalCostOfPlan} Pieces of Silver
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
					<form action="updateInsured.do" method="GET">
								<input type="hidden" value="${insured.id}"> <input
									type="submit" class="btn btn-default" value="Update Profile">
					</form>
				</div>
				<div class="feed">
				<br>
					<h3>Plans: </h3>
					
								<c:choose>
									<c:when test="${empty coverages}">
										<h3>No plans to display at this time. Contact your agent</h3>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${insured.plans}">
											<c:forEach items="${p.coverages}" var="c">
												<h5>${c.name}</h5>
											</c:forEach>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<form action="createPlan.do" method="get">
								<input type="hidden" value="${insured.id}"> <input
									type="submit" class="btn btn-default" value="Add a Plan">
							</form>
						</div>
						<div class="col-md-3"></div>
					</div>
				</div>
			</div>

			<div class="formTextLight rightColumn col-md-4">
				<table>
					<thead>
						<tr>
							<td><h3 class="companyName">Messages:</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:if test="${!empty agent.messages}">
									<c:forEach var="m" items="${agent.messages}">
										Message Id: ${m.id}<br>
										From: ${m.insured.fName} ${m.insured.lName}<br>
										To: ${m.agent.fName} ${m.agent.lName}<br>
										Message: ${m.messageBody}<br>
									</c:forEach>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row"></div>
	</div>



	<!-- opening body container div -->
	<div class="container">
	Clients:<br>
		<c:forEach var="c" items="${agent.clients}">
			<a href="getClient.do?id=${c.id}">${c.fName} ${c.lName}</a>
			<br>
		</c:forEach>
		<br>
	Messages:
		
		<!--a list of all of the insured that the agent has as clients will be here, 
		each being a clickable link to a more detailed view of them-->
	
	<!-- closing body container div -->
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>