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
			<div class="formTextLight leftColumn col-md-3">
				<form action="login.do" method="POST">
					Username: <input type="text" name="name" style="border-radius: 5px; margin-bottom: 2px;"> <br>
					Password: <input type="password" name="password" style="border-radius: 5px; margin-bottom: 2px;"> <br> <input
						type="submit" class="gimmeRoom btn btn-primary"
						value="Login As User">
				</form>
				<br>
				<form action="create.do" method="GET">
					<input type="submit" class="gimmeRoom btn btn-info"
						value="Create Account">
				</form>
			</div>
			<div class="feedHost col-md-6">
				<div class="feed">
					<h1>some stuff</h1>
				</div>
				<div class="feed">
					<h1>some stuff</h1>
				</div>
				<div class="feed">
					<h1>some stuff</h1>
				</div>
				<div class="feed">
					<h1>some stuff</h1>
				</div>
			</div>
			<div class="formTextLight rightColumn col-md-3">
				<form action="loginAgent.do" method="POST">
					Username: <input type="text" name="name" style="border-radius: 5px; margin-bottom: 2px;"> <br>
					Password: <input type="password" name="password" style="border-radius: 5px; margin-bottom: 2px;"> <br> <input
						type="submit" class="gimmeRoom btn btn-primary"
						value="Login As Agent">
				</form>
			</div>
		</div>
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>