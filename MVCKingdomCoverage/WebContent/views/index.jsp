<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="partials/head.jsp"></jsp:include>

<body>

	<!-- opening header div -->
	<div>
	
		<!-- navbar, page headers will go here -->
<jsp:include page="partials/navbar.jsp"></jsp:include>
		<h1>Kingdom has coverage if you have coin..</h1>
		<!-- option to login or create a user will go here as well --> 
		
	<!-- closing header div -->
	</div>

	<!-- opening body container div -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
		<form action="login.do" method="GET">
			Username: <input type="text" name="name">
			<br>
			Password: <input type="text" name="password">
			<br>
			<input type="hidden" value="${insured.name}">
			<input type="hidden" value="${insured.password}">
			<input type="submit" class="btn btn-primary" value="Login As User">
		</form>
		<br>
		<form action="create.do" method="GET">
			<input type="submit" class="btn btn-info" value="Create Account">
		</form>
		<!--forEach list of types of insurance for sale will go here, maybe a blurb about the company -->
			</div>
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
		<form action="login.do" method="GET">
			Username: <input type="text" name="name">
			<br>
			Password: <input type="text" name="password">
			<br>
			<input type="hidden" value="${Insured.id}">
			<input type="submit" class="btn btn-primary" value="Login As Agent">
		</form>
	
		</div>
		</div>
	</div>
	<!-- closing body container div -->
	
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>