<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.doctorDAO"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.*"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.specialistDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add doctor</title>

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

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<c:if test="${ not empty sucMsg}">
							<p class="text-center text-success fs-5">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${ not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						doctorDAO dao2 = new doctorDAO(DBConnect.getConn());
						Doctor doc = dao2.getDoctorById(id);
						%>


						<form action="../updateDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									name="fullname" required class="form-control"
									value=<%=doc.getFullname()%>>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date"
									name="dob" required class="form-control"
									value=<%=doc.getDob()%>>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" name="qualification" required class="form-control"
									value=<%=doc.getQualification()%>>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option><%=doc.getSpecialist()%></option>

									<%
									specialistDAO dao = new specialistDAO(DBConnect.getConn());
									List<Specialist> list = dao.getSpecialists();
									for (int i = 0; i < list.size(); i++) {
									%>
									<option>
										<%=list.get(i).getSpecialistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="email"
									name="email" required class="form-control"
									value=<%=doc.getEmail()%>>
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No.</label><input type="text"
									name="mob" required class="form-control"
									value=<%=doc.getMob()%>>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="password"
									name="password" required class="form-control"
									value=<%=doc.getPassword()%>>
							</div>
							<input type="hidden" name="id" value="<%=doc.getId()%>">
							<button type="submit" class="btn btn-primary offset-md-4">Update
								Doctor</button>
						</form>

					</div>
				</div>
			</div>




		</div>

	</div>
</body>
</html>