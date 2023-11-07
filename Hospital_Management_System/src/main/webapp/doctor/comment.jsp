<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.appointmentDAO"%>
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

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url(hospital.jpg);
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<meta charset="ISO-8859-1">
<title>Comment</title>
<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<c:if test="${empty DoctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Comment Box</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						appointmentDAO dao = new appointmentDAO(DBConnect.getConn());
						Appointment ap = dao.getAppointmentById(id);
						%>
						<form action="comment" class="row" method="post">
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Patient Name</label> <input
									readonly value="<%=ap.getFullname() %>" name="fullname" type="text"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Age</label> <input
									readonly value="<%=ap.getAge() %>" name="age" type="text"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Phone</label> <input
									readonly value="<%=ap.getPhone() %>" name="phone" type="text"
									class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label" for="inputEmail4">Disease</label> <input
									readonly value="<%=ap.getDisease()%>" name="disease" type="text"
									class="form-control">
							</div>
							<div class="col-md-12">
								<label class="form-label">Description</label><br>
								<textarea required rows="3" cols="60" name="comment"></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorid()%>">
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Comment</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>