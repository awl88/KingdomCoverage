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
					<em>${insured.fName} ${insured.lName}'s Policies</em>
				</h4>
			</div>
		</div>
		<div class="row">
			<!-- <form action="agent.jsp" method="POST"> -->
			<form action="clientChanges.do" method="POST">
				<div class="feedHost col-md-8">

					<div class="feed">
						<table>
							<tbody>
								<tr>
									<td>Name:</td>
									<td>-------------------------------</td>
									<td>${insured.fName}${insured.lName}</td>
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
									<td>${insured.address.street},${insured.address.city},
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
						<h4>Plans:</h4>
						<c:choose>
							<c:when test="${empty coverages}">
								<h3>No plans to display at this time. Go sell more
									policies!!</h3>
							</c:when>
							<c:otherwise>
								<c:forEach var="p" items="${insured.plans}">
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
												<p>Are you sure you would like to delete this policy
													from the plan?</p>
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
					</div>
				</div>
			</form>
		</div>

		<div class="addPolicies">
			<form action="addPolicies.do" method="POST">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#addModal">Add Policies</button>

				<!-- Modal -->
				<div id="addModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Add Policies</h4>
							</div>
							<div class="modal-body">
								<select name="coverage">
									<c:forEach var="c" items="${allCoverages}">
										<option value="${c.name}">${c.name}</option>
									</c:forEach>
								</select>
								<p>Are you sure you want to add this policy?</p>
								<input type="hidden" name="iid" value="${insured.id}">
								<input type="submit" class="btn btn-warning" value="Yes">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Back</button>
							</div>
						</div>

					</div>
				</div>
			</form>
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