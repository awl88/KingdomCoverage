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
					<em>Kingdom has the coverage if you have the coin...</em>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="formTextLight leftColumn col-md-3 padding" id="invisible"></div>
			<div class="feedHost col-md-6">
				<div class="feed">
					<h1>Kingdom Coverage Terms of Service</h1>
					<p>Our terms are pretty straight forward and simple, we own everything and all things related, but not limited
					to you.
					</p>
					
				</div>
			</div>
			<div class="formTextLight rightColumn col-md-3" id="invisible"></div>
		</div>
	</div>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");

				/* Toggle between hiding and showing the active panel */
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>