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
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="feed formTextLight leftColumn col-md-4 padding">
				<table>
					<thead>
						<tr>
							<td><h3 class="companyName">Inbox:</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<form action="composedMessageFromInsured.do" method="POST">
									<button type="button" class="pressed btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModalCompose"
										style="margin: 1em 1em 1em 1em;">&#9998 Compose
										Message</button>

									<!-- Modal -->
									<div id="myModalCompose" class="modal fade" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Share a message with your
														agent:</h4>
												</div>
												<div class="modal-body">

													<textarea rows="4" cols="50" name="messageBody"
														placeholder="Type your message here..."></textarea>
													<input type="submit" class="pressed btn btn-warning"
														value="Send &#x00A; &#x2709">
												</div>
												<div class="modal-footer">
													<button type="button" class="pressed btn btn-default"
														data-dismiss="modal">Back</button>
												</div>
											</div>

										</div>
									</div>
								</form>
							</td>
						</tr>
						<tr>
							<td><c:choose>
									<c:when test="${!empty messages}">
										<c:forEach var="message" items="${messages}">
											<c:choose>
												<c:when test="${message.toString() == 'y'}">
													<!-- Can put this part into another div box for "sent" -->

													<%-- To: ${m.agent.fName} ${m.agent.lName}<br>
													From: ${m.insured.fName} ${m.insured.lName}<br> --%>
												</c:when>
												<c:otherwise>
															Message Id: ${message.id}<br>
															To: ${message.insured.fName} ${message.insured.lName}<br>
															From: ${message.agent.fName} ${message.agent.lName}<br>
															Message: ${message.messageBody}<br>
													<br>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feed formTextLight rightColumn col-md-4 padding">

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
										<c:forEach var="message" items="${messages}">
											<c:choose>
												<c:when test="${message.toString() == 'y'}">
													
													Message Id: ${message.id}<br>
													To: ${message.agent.fName} ${message.agent.lName}<br>
													From: ${message.insured.fName} ${message.insured.lName}<br>
													Message: ${message.messageBody}<br>
													<br>
												</c:when>
												<c:otherwise>

													<%-- To: ${m.insured.fName} ${m.insured.lName}<br>
													From: ${m.agent.fName} ${m.agent.lName}<br> --%>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="fancyButtonBox">
		<form action="insured.do" , method="GET">
			<input type="submit" class="gimmeRoom btn btn-" value="Back">
		</form>

	</div>
	<div class="row"></div>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>