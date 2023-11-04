<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor DashBoard</title>
<%@include file="../component/allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty DoctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

</body>
</html>