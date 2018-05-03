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
					<h1>Agent ${agent.fName}'s Profile</h1>
				</div>
				<div class="feed">
					<br>
					<h3>Clients: </h3>
						<c:choose>
							<c:when test="${empty agent.clients}">
								<h3>No clients to display at this time. Get selling!!</h3>
							</c:when>
							<c:otherwise>
								<c:forEach var="c" items="${agent.clients}">
									<a href="getClient.do?id=${c.id}">${c.fName} ${c.lName}</a>
									<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<br>
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
						<td>
							<c:choose>
									<c:when test="${!empty messages}">
										<c:forEach var="m" items="${messages}">
									
									Message Id: ${m.id}<br>
											<c:choose>
												<c:when test="${m.toString() == 'y'}">
													To: ${m.agent.fName} ${m.agent.lName}<br>
													From: ${m.insured.fName} ${m.insured.lName}<br>
												</c:when>
												<c:otherwise>
													To: ${m.insured.fName} ${m.insured.lName}<br>
													From: ${m.agent.fName} ${m.agent.lName}<br>
												</c:otherwise>
											</c:choose>
									Message: ${m.messageBody}<br>
											<br>

										</c:forEach>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row"></div>
	</div>

<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>