<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="partials/head.jsp"></jsp:include>
<body>
	<div class="container-fluid">
		<jsp:include page="partials/navbar.jsp"></jsp:include>
		<div class="blended_grid">
			<div class="topBanner">
				<br>
				<div class="fancyBox">
					<h1 class="companyName">Kingdom Coverage</h1>
					<h4 class="script">
						<em>Kingdom has you covered if you have the coin...</em>
					</h4>
				</div>
			</div>
			<div class="row">
				<div class="formTextLight leftColumn col-md-1" id="invisible"></div>
				<div class="feedHost col-md-8">
					<div class="feed indexQuote">
						<h1>Get a Quote</h1>
						<form action="getQuote.do" method="POST">
							<label for="coverageIdForQuote">Please select your
								desired coverage:</label> <select name="coverageIdForQuote"
								style="margin-top: 1.5px;">
								<c:forEach var="coverage" items="${coveragesList}">
									<option value="${coverage.id}">${coverage.name}</option>
								</c:forEach>
							</select> <br> <label for="speciesIdForQuote">Please select
								your species:</label> <select name="speciesIdForQuote"
								style="margin-top: 1.5px;">
								<c:forEach var="species" items="${allSpecies}">
									<option name="${species.name}" value="${species.id}">${species.name}</option>
								</c:forEach>
							</select> <br> <label for="occupationIdForQuote">Please
								select your occupation:</label> <select name="occupationIdForQuote"
								style="margin-top: 1.5px;">
								<c:forEach var="job" items="${jobs}">
									<option name="${job.name}" value="${job.id}">${job.name}</option>
								</c:forEach>
							</select> <br>
							
							<button type="submit" class="btn btn-info pressed">Get Quote</button>
						</form>
					</div>
				</div>
				<div class="feed formTextLight rightColumn col-md-2">
					<h1>Login</h1>
					<form action="login.do" method="POST">
						Username: <input type="text" name="name"
							style="border-radius: 5px; margin-bottom: 2px;"> <br>
						Password: <input type="password" name="password"
							style="border-radius: 5px; margin-bottom: 2px;"> <br>
						<input type="submit" class="pressed gimmeRoom btn btn-info"
							value="Login" >
					</form>
					<br>
					<form action="loginAgentPage.do" , method="GET">
						<input type="submit" class="pressed gimmeRoom btn btn-info"
							value="Login As Agent">
					</form>
					<form action="create.do" method="GET">
						<input type="submit" class="pressed gimmeRoom btn btn-info"
							value="Create an Account">
					</form>
					<p></p>
				</div>
			</div>
		</div>
		<jsp:include page="partials/foot.jsp"></jsp:include>
	</div>
</body>
</html>