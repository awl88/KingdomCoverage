<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>
<body>
	<div id="pleaseWork" class="container-fluid">
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
					<div class="feed">
						<h1>Your Quote:</h1>
					</div>
					<div class="feed">
						<h3>${userQuote}</h3>
					</div>
				</div>
				<div class="formTextLight rightColumn col-md-2">
				<h1>Login</h1>
					<form action="login.do" method="POST">
						Username: <input type="text" name="name" style="border-radius: 5px; margin-bottom: 2px;"> 
						<br>
						Password: <input type="password" name="password" style="border-radius: 5px; margin-bottom: 2px;"> 
						<br> 
						<input type="submit" class="gimmeRoom btn btn-primary" value="Login">
					</form><br>
					<form action="loginAgentPage.do", method="GET">
						<input type="submit" class="gimmeRoom btn btn-primary" value = "Login As Agent">
					</form><br>
					<form action="create.do" method="GET">
						<input type="submit" class="gimmeRoom btn btn-primary" value="Create an Account">
					</form>
					<p></p>
				</div>
			</div>
		</div>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</div>
</body>
</html>