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
				<input type="text" name="name" style="border-radius: 5px; margin-bottom: 2px;"> 
				<br>
				<input type="password" name="password" style="border-radius: 5px; margin-bottom: 2px;"> 
				<br> 
				<input type="submit" class="gimmeRoom btn btn-primary" value="Login As User">
			</form>
			<br>
		</div>
	</div>
<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>