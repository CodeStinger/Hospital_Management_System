<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.appointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.doctorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view patient</title>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.4)
}
</style>

<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fuid p-3">

		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>

						<c:if test="${ not empty sucMsg}">
							<p class="text-center text-success fs-5">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${ not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
							
							<%appointmentDAO dao = new appointmentDAO(DBConnect.getConn()); 
							List<Appointment> list = dao.getAllAppointments();
							
							for(Appointment ap : list){
								doctorDAO daod = new doctorDAO(DBConnect.getConn());
								Doctor d = daod.getDoctorById(ap.getDoctorid());
							
							%>
								<tr>
									<td><%=ap.getFullname() %></td>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getEmail() %></td>
									<td><%=ap.getPhone() %></td>
									<td><%=ap.getDisease() %></td>
									<td><%=d.getFullname() %></td>
									<td><%=ap.getAddress() %></td>
									<td>
									<%if(ap.getStatus().equals("Pending")){
									%>
									<a href="#" class="btn btn-5m btn-warning">Pending</a>
									<%}else{ %>
									<%=ap.getStatus() %>
									<%} %>
									</td>
								</tr>
								<%
							}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>