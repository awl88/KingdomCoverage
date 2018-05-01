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

						</tbody>
					</table>
				</div>
				<div class="feed">

					<table>
						<tbody>
							<tr>
								<td>Plans:</td>
								<td>-------------------------------</td>
								<td>
								<c:choose>
									<c:when test="${empty coverages}">
										<h3>No plans to display at this time. Contact your agent</h3>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${insured.plans}">
											${p.totalCostOfPlan}
											<c:forEach items="${p.coverages}" var="c">
												<input type="checkbox" name="plan" value="${c.id}">
											${c.name}<br>
												<input type="hidden" name="iid" value="${insured.id}">
											</c:forEach>
										</c:forEach>
										<!-- Trigger the modal with a button -->
										<button type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#myModal">Remove
											Policies</button>
					
										<!-- Modal -->
										<div id="myModal" class="modal fade" role="dialog">
											<div class="modal-dialog">
					
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title">Remove Policies</h4>
													</div>
													<div class="modal-body">
														<p>Are you sure you would like to delete this policy from
															the plan?</p>
														<input type="submit" class="btn btn-warning" value="Yes">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Back</button>
													</div>
												</div>
					
											</div>
										</div>
										<!-- closing body container div -->
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-6">
							<form action="update.do" method="get">
								<input type="submit" class="btn btn-primary" value="Edit Plans">
							</form>
						</div>
						<div class="col-md-6">
							<form action="createPlan.do" method="get">
								<input type="hidden" value="${insured.id}"> <input
									type="submit" class="btn btn-default" value="Add a Plan">
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="formTextLight rightColumn col-md-4">
				<table>
					<thead>
						<tr>
							<td>Messages:</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:if test="${!empty insured.messages}">
									<c:forEach var="m" items="${insured.messages}">
									Message Id: ${m.id}<br>
									From: ${m.insured.fName} ${m.insured.lName}<br>
									To: ${m.agent.fName} ${m.agent.lName}<br>
									Message: ${m.messageBody}<br>
										<br>
									</c:forEach>
								</c:if></td>
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