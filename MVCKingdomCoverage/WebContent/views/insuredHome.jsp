<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1>Your Profile</h1>
				</div>
				<div class="insuredTable">
					<table>
						<tbody>
							<tr>
								<td>Name:</td>
								<td>               </td>
								<td>${insured.fName} ${insured.lName}</td>
							</tr>
							<tr>
								<td>Age:</td>
								<td>               </td>
								<td>${insured.age}</td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td>               </td>
								<td>${insured.gender}</td>
							</tr>
							<tr>
								<td>Address:</td>
								<td>               </td>
								<td>${insured.address.street}, ${insured.address.city}, 
									${insured.address.realm}</td>
							</tr>
							<tr>
								<td>Agent:</td>
								<td>               </td>
								<td><c:if test="${!empty agents}">
										<c:forEach var="a" items="${insured.agents}">
									${a.fName} ${a.lName}
								</c:forEach>
									</c:if></td>
							</tr>
							<tr>
								<td>Premium:</td>
								<td>&emsp;&emsp;</td>
								<td><c:if test="${empty plans}">
									Zero Pieces of Silver
								</c:if> <c:if test="${!empty plans}">
										<c:forEach var="p" items="${plans}">
										${p.totalCostOfPlan} Pieces of Silver
									</c:forEach>
									</c:if></td>
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
					<h3>Plans:</h3>
					<c:choose>
						<c:when test="${empty coverages}">
							<h3>No plans to display at this time. Contact your agent</h3>
						</c:when>
						<c:otherwise>
							<c:forEach items="${coverages}" var="c">
								<h5>${c.name}</h5>
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

			<div class="feed formTextLight rightColumn col-md-4">
				<table>
					<thead>
						<tr>
							<td><h3 class="companyName">Inbox:</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:choose>
									<c:when test="${!empty messages}">
										<c:forEach var="m" items="${messages}">
									
											<c:choose>
												<c:when test="${m.toString() == 'y'}">
											<!-- Can put this part into another div box for "sent" -->
											
											<%-- To: ${m.agent.fName} ${m.agent.lName}<br>
											From: ${m.insured.fName} ${m.insured.lName}<br> --%>
												</c:when>
												<c:otherwise>
												
											Message Id: ${m.id}<br>
											To: ${m.insured.fName} ${m.insured.lName}<br>
											From: ${m.agent.fName} ${m.agent.lName}<br>
											Message: ${m.messageBody}<br>
												</c:otherwise>
											</c:choose>
											<br>

										</c:forEach>
									</c:when>
								</c:choose></td>
						</tr>
						<tr>
							<td>
							<!-- Trigger the modal with a button -->
								<button type="button" class="btn btn-info btn-lg"
									data-toggle="modal" data-target="#myModalCompose" style="margin: 1em 1em 1em 1em;">&#9998  Compose Message</button>

								<!-- Modal -->
								<div id="myModalCompose" class="modal fade" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">Share a message with your agent:</h4>
											</div>
											<div class="modal-body">
												
												<textarea rows = "4" cols = "50" placeholder = "Type your message here..."></textarea>
												<input type="submit" class="btn btn-warning" value="Send &#x00A; &#x2709">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Back</button>
											</div>
										</div>

									</div>
								</div>
								<!-- closing body container div -->
							</td>
					</tbody>
				</table>
			</div>
			<div class="formTextLight rightColumn col-md-4">
				<table>
					<thead>
						<tr>
							<td><h3 class="companyName">Sent Mail:</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:choose>
									<c:when test="${!empty messages}">
										<c:forEach var="m" items="${messages}">
									
											<c:choose>
												<c:when test="${m.toString() == 'y'}">
											
											Message Id: ${m.id}<br>
											To: ${m.agent.fName} ${m.agent.lName}<br>
											From: ${m.insured.fName} ${m.insured.lName}<br>
											Message: ${m.messageBody}<br>
												</c:when>
												<c:otherwise>
												
											<%-- To: ${m.insured.fName} ${m.insured.lName}<br>
											From: ${m.agent.fName} ${m.agent.lName}<br> --%>
												</c:otherwise>
											</c:choose>
											<br>

										</c:forEach>
									</c:when>
								</c:choose></td>
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