<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="partials/head.jsp"></jsp:include>
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
}

body {
	background-image: url(' bi-background-hexagon.png ');
	background-attachment: fixed;
	background-size: 100% auto;
}

.blended_grid {
	display: block;
	width: auto;
	overflow: hidden;
	margin: 0px auto 0 auto;
	text-align: center;
}

.topBanner {
	background-color: #191A18;
	float: center;
	clear: none;
	height: 200px;
	width: 100%;
}

.leftColumn {
	background-color: rgba(0, 0, 255, 0.5);
	float: left;
	clear: none;
	height: 600px;
	width: 200px;
}

.feedHost {
	float: center;
	clear: none;
	min-width: 80px;
	min-height: 80px;
}

.feed {
	background-color: rgba(255, 0, 0, 0.5);
	float: none;
	clear: both;
	height: 100px;
	width: auto;
	color: red;
}

.rightColumn {
	background-color: rgba(0, 0, 255, 0.5);
	float: right;
	clear: none;
	height: 600px;
	width: 200px;
}
.script {
	font-family: cursive;
	color: #D4D8AC;
}
.companyName {
	font-family: fantasy;
	font-size: 3em;
	font-weight: bolder;
	color: #D4D8AC;
}
</style>
</head>
<body>
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	<div class="blended_grid">
		<!-- navbar, page headers will go here -->
		<div class="topBanner">
			<br>
			<h1 class="companyName">Kingdom Coverage</h1>
			<h4 class="script">
				<em>Kingdom has the coverage if you have the coin..</em>
			</h4>
		</div>
		<div class="row">
			<div class="leftColumn col-md-3">
				<form action="login.do" method="POST">
					Username: <input type="text" name="name"> <br>
					Password: <input type="text" name="password"> <br> <input
						type="submit" class="btn btn-primary" value="Login As User">
				</form>
				<br>
				<form action="create.do" method="POST">
					<input type="submit" class="btn btn-info" value="Create Account">
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
			<div class="rightColumn col-md-3">
				<form action="loginAgent.do" method="POST">
					Username: <input type="text" name="name"> <br>
					Password: <input type="text" name="password"> <br> <input
						type="submit" class="btn btn-primary" value="Login As Agent">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>
