<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index page</title>
<%@include file="component/allCSS.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.4)
}
</style>
</head>
<body>
	<%@include file="component/NavBar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hospitalManagementImage1.jpeg" class="d-block w-100"
					alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hospitalManagementImage2.jpeg" class="d-block w-100"
					alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hospitalManagementImage3.jpeg" class="d-block w-100"
					alt="..." height="500px">
			</div>
			<!-- 	<div class="carousel-item">
				<img src="img/hospitalManagementImage4.jpeg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/hospitalManagementImage5.jpeg" class="d-block w-100" alt="...">
			</div> -->
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>




	<div class="container p-3">
		<p class="text-center fs-2">Key features of Our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem Our hosiptal is fully safe for any kind of patient</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem Our hosiptal is fully safe for any kind of patient</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem Our hosiptal is fully safe for any kind of patient</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem Our hosiptal is fully safe for any kind of patient</p>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<img alt="doctor image" src="img/doc5.jpeg" height="370px">
			</div>


		</div>
	</div>


	<hr>


	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="this is first doctor" src="img/doc1.jpeg" width="230px"
							height="300px">
						<p class="fw-bold fs-5">Mr. ABC DEF</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="this is first doctor" src="img/doc2.jpeg" width="230px"
							height="300px">
						<p class="fw-bold fs-5">Mr. DEF GHI</p>
						<p class="fs-7">(Chief Doc)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="this is first doctor" src="img/doc3.jpeg" width="230px"
							height="300px">
						<p class="fw-bold fs-5">Mr. GHI JKL</p>
						<p class="fs-7">(Compounder)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="this is first doctor" src="img/doc4.jpeg" width="230px"
							height="300px">
						<p class="fw-bold fs-5">Mr. JKL MNO</p>
						<p class="fs-7">(Compounder)</p>
					</div>
				</div>
			</div>
		</div>
	</div>


<%@include file="component/footer.jsp" %>
</body>
</html>