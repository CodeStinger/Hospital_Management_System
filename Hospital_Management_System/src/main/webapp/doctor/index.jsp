<%@page import="com.dao.appointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.doctorDAO"%>
<%@page import="com.entity.Doctor"%>
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
<title>Doctor DashBoard</title>
<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty DoctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<p class="text-center fs-3">Doctor Dashboard</p>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Doctor<br>
						<%doctorDAO dao = new doctorDAO(DBConnect.getConn()); 
							%><%=dao.getDoctorCount() %>
						
						</p>
						
					</div>
				</div>
			</div>

			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Total Appointment<br>
						<%appointmentDAO dao1 = new appointmentDAO(DBConnect.getConn()); 
						Doctor d = (Doctor)session.getAttribute("DoctorObj");
						%>
						<%=dao1.getAppointmentCountForSpecificDoctor(d.getId()) %>
						</p>
						
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>