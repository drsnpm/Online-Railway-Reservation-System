<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
	  	<div class="carousel-item active">
	      <img class="d-block w-100" src="img/img44.jpg" height="670px">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/img1.avif" height="670px">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/sam1.jpg" height="670px">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="img/img3.avif" height="670px">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

	<div class="container p-5  style="height: 100vh;">
		<h2 class="text-center">Key Features of our System</h2>

		<div class="row"">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">User-Friendly interface</p>
								<p>An online railway reservation system enabling user registration, ticket booking, seat availability checks, and secure payment processing with real-time updates</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Committed to a clean, safe, and hygienic environment for a healthier, more comfortable, and stress-free hospital experience with enhanced care and well-being</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% secure</p>
								<p>Ensures secure user authentication, encrypted transactions, safe payment processing, data privacy, and real-time updates for seamless booking</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Real-time information </p>
								<p>Provides real-time information on seat availability, booking status, train schedules, fare updates, and ticket confirmation for a seamless user experience.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 p-5">
				<img style="width: 350px; height: 400px;" alt="" src="img/img11.jpg">
			</div>

		</div>
	</div>
<div class="container-fluid p-1 text-center text-white bg-dark">
	<p>Developed by <a class="text-white" href="https://drsnpm.github.io/portfolio/" style="text-decoration: none;">Darshan Parameshwar Moger</a></p>
</div>
</body>
</html>