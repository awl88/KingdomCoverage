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
					<em>Kingdom has you covered if you have the coin..</em>
				</h4>
			</div>
		</div>
		<div class="row">
			<form action="INSERT PATH HERE" method="POST">
				<div class="feed">
					<label for="insuredSpeciesId">Please select your species:</label> 
					<select name="insuredSpeciesId" style="margin-top: 1.5px;">
						<c:forEach var="species" items="${allSpecies}">
							<c:if test="${species == insured.species}">
								<option selected name="${species.name}" value="${species.id}">${species.name}</option>
							</c:if>
							<c:if test="${species != insured.species}">
								<option name="${species.name}" value="${species.id}">${species.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="feed">
					<label for="insuredOccupationId">Please select your occupation:</label> 
					<select name="insuredOccupationId" style="margin-top: 1.5px;">
						<c:forEach var="job" items="${jobs}">
							<c:if test="${job == insured.occupation}">
								<option selected name="${job.name}" value="${job.id}">${job.name}</option>
							</c:if>
							<c:if test="${job != insured.occupation}">
								<option name="${job.name}" value="${job.id}">${job.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div> type="submit" class="gimmeRoom btn btn-primary" value="Get Quote">
			</form>
			<br>
		</div>
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>