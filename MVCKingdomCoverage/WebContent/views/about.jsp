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
			<div class="feedHost col-md-6 padding">
				<div class="feed">
					<h1>About Kingdom Coverage</h1>
					<p>Kingdom Coverage is the premier insurance company in all the lands. We proudly provide insurance for every being within the Five Realms, 
					including the royal families and their castles. With only five active agents, the employees are constantly busy providing you with the best
					coverage, no matter how dire a situation you may find yourself in. We offer coverage for horses, houses, working conditions, and now, we are
					the first company to provide coverage for your unicorn.
					</p>
					<p>
					Founded in 984 AD by Jake From State Farm, Kingdom Coverage quickly became the fastest growing corporation of all time. In 1052 AD we announced our
					monopoly over the insurance industry. 1058 AD was the year that we bribed the governments of the Five Realms to force all living beings to register
					with us. Starting in 1243 Kingdom Coverage helped squash the rebellion of the orcs by charging them extra for their coverage. Today, in 1323 AD
					Kingdom Coverage offers insurance to everyone, in fact, it is now law that we provide you with your insurance. What lies ahead is a mystery, but
					whatever it may be, we know that it will just make us more and more money, and we are fine with that.
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