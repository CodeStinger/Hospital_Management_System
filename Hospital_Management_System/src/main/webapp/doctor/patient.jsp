<%@page import="com.dao.doctorDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.appointmentDAO"%>
<%@page import="com.entity.User"%>
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
<title>Patient Details</title>
<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty DoctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>



	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${ not empty sucMsg}">
							<p class="text-center text-success fs-5s">${sucMsg}</p>
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
									<th scope="col">Appoint Date</th>
									<th scope="col">E-mail</th>
									<th scope="col">Phone</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("DoctorObj");
								int id = d.getId();
								appointmentDAO dao = new appointmentDAO(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentsOfDoctor(id);

								for (Appointment ap : list) {
								%>
								<tr>
									<td><%=ap.getFullname()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getDate()%></td>

									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhone()%></td>
									<td><%=ap.getDisease()%></td>
									<td>
										<%
										if (ap.getStatus().equals("Pending")) {
										%> <a href="#" class="btn btn-5m btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%> <%
 }
 %>
									</td>
									<td><a href="#" class="btn btn-success btn-5m">Comment</a></td>

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