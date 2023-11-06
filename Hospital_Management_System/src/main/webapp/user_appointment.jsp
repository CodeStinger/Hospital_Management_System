<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.doctorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allCSS.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.4)
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url(hospital.jpg);
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/NavBar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="ths is doctor" src="img/doc1.jpeg" height="500px">
			</div>
			<div class="col-md-6">

				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Appointment</p>

						<c:if test="${ not empty sucMsg}">
							<p class="text-center text-success fs-5s">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${ not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="addAppointment" method="post">
							<input type="hidden" name="userid" value="${UserObj.id}">
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Full Name</label> <input
									required name="fullname" type="text" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Gender</label> <select
									class="form-control" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Age</label> <input
									required name="age" type="number" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Appointment
									Date</label> <input required name="date" type="date"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Email</label> <input
									required name="email" type="email" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Phone Number</label>
								<input required name="phone" type="number" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Disease</label> <input
									required name="disease" type="text" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label" for="inputPassword4">Doctor</label> <select
									class="form-control" name="doctor" required>
									<option value="">--select--</option>
									<%
									doctorDAO dao2 = new doctorDAO(DBConnect.getConn());
									List<Doctor> list2 = dao2.getAllDoctor();

									for (Doctor d : list2) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullname()%>&nbsp;(<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>


								</select>
							</div>

							<div class="col-md-12">
								<label class="form-label">Full Address</label><br>
								<textarea required rows="3" cols="60" name="address"></textarea>
							</div>



							<c:if test="${empty UserObj }">
								<a href="user_login.jsp"
									class="btn bg-success text-white col-md-6 offset-md-3">Submit</a>
							</c:if>



							<c:if test="${not empty UserObj}">
								<button type="submit"
									class="btn bg-success text-white col-md-6 offset-md-3">Submit</button>


							</c:if>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>