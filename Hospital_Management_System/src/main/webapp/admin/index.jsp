<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.4)
}
</style>
<meta charset="ISO-8859-1">
<title>Admin DashBaord</title>
<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
	<c:if test="${empty adminObj}">
	<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	
	
	<div class="container p-5">
		<p class="text-center fs-3">Admin DashBaord</p>
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="text-center fs-4">
							Doctor<br>5
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user fa-3x"></i><br>
						<p class="text-center fs-4">
							User<br>45
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							Appointment<br>50
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">

				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#examplemodal">

					<div class="card-body text-center text-success">
						<i class="fa-solid fa-stethoscope fa-3x"></i><br>
						<p class="text-center fs-4">
							Specialist<br>10
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>