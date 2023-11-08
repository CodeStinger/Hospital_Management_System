<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Edit</title>
<%@include file="component/allCSS.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.4)
}
</style>
</head>
<body>
	<%@include file="component/NavBar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					
					<c:if test="${ not empty sucMsg}">
						<p class="text-center text-success fs-5">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>
					<c:if test="${ not empty errorMsg}">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<%
						User user = (User) session.getAttribute("UserObj");
						%>
						<form action="changePassword" method="post">
						<input type="hidden" value="<%=user.getId()%>" name="id">
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>