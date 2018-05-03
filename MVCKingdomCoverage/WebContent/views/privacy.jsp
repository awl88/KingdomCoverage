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
					<h1>Kingdom Coverage Privacy Statement</h1>
					<h3>Short Version</h3>
					<p>Kingdom Coverage collects ALL of your data. We have extensive records of everything you do on this site, all of your information, and we even
					will gladly give up your password for a pretty silver piece. Furthermore, we do sell your data to third-parties. We make a lot of money off of your 
					information, and frankly, we do not want to give up that income. 
					</p>
					<h3>What information Kingdom Coverage collects and why</h3>
					<h5>Browser information</h5>
					<p>We like to know which browser you are using. Which language you prefer, referring sites, and dates and times you accessed our site. We need this so
					that we can make the user experience worse for you.
					</p>
					<h5>User information</h5>
					<p>We collect all the information that you input when creating your profile. This includes, but is not limited to, your species, occupation, and name.
					If you have any issue with us collecting this information, well then too bad. For some reason, some people pay a lot for this information, and we cannot 
					just give up such a huge amount of our income.
					</p>
					<h5>What information Kingdom Coverage does not collect</h5>
					<p>There is no information that we do not collect. We literally know everything about you, even if you didn't input it on this site. We are all knowing
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