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
				<div class="feed">
					<h1>Billing & Payment FAQs</h1>
					<button class="accordion">How do I make a payment?</button>
					<div class="panel">
						<p>Bring us the gold in a government certified pouch. You can
							drop it off at a designated Kingdom Coverage location.</p>
					</div>

					<button class="accordion">Are there alternative ways to
						pay?</button>
					<div class="panel">
						<p>No, we said how to make your payment above. Go read that.</p>
					</div>

					<button class="accordion">Can my owl or servant drop off
						the pouch?</button>
					<div class="panel">
						<p>Sure.</p>
					</div>

					<button class="accordion">Can I make my payment online?</button>
					<div class="panel">
						<p>No, how many times do we have to tell you, Government.
							Certified. Pouch.</p>
					</div>
				</div>
				<div class="feed">
					<h1>Claims FAQs</h1>
					<button class="accordion">How to place a claim?</button>
					<div class="panel">
						<p>Well as of right now you don't. We just take your money.
							Sorry.</p>
					</div>

					<button class="accordion">Are there any discounts
						available if I have no accidents?</button>
					<div class="panel">
						<p>No. We are greedy.</p>
					</div>
				</div>
				<div class="feed">
					<h1>General FAQs</h1>
					<button class="accordion">I forgot my user name/password.</button>
					<div class="panel">
						<p>Man, that really sucks. We legally cannot change, update,
							or provide that information to you. We will still gladly take
							your money, however.</p>
					</div>

					<button class="accordion">How do I create an account?</button>
					<div class="panel">
						<p>When you first get our website, there is a big button that
							says 'Create User', it's kind of hard to miss. Just enter your
							information and we can start taking your money.</p>
					</div>

					<button class="accordion">How do I cancel a policy?</button>
					<div class="panel">
						<p>First of all, we HIGHLY recommend against this. Having
							insurance is very important, and very necessary. However, if you
							absolutely MUST cancel a policy, please send a message to your
							agent and we will get back to you as soon as possible.</p>
					</div>

					<button class="accordion">Is there any fee for canceling a
						policy?</button>
					<div class="panel">
						<p>Obviously. There will be a 100 Gold piece fee due upon your
							next payment.</p>
					</div>

					<button class="accordion">Why did my payment increase?</button>
					<div class="panel">
						<p>
							Insurance isn't cheap, and we need to keep our employees fed. Our
							services are a steal compared to our competitors. <br>(also
							we are super greedy)
						</p>
					</div>
				</div>
			</div>
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