<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<c:if test="${ not empty sucMsg}">
			<p class="text-center text-success fs-5">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session" />
		</c:if>
		<c:if test="${ not empty errorMsg}">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

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

			<div class="col-md-4 mt-2" data-bs-toggle="modal"
				data-bs-target="#exampleModal">

				<div class="card paint-card">

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



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../addSpecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="name" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>