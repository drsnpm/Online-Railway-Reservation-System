<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PassengerDao"%>
<%@page import="com.dao.TrainDao"%>
<%@page import="com.dao.TicketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminLogin.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>

	<div class="container p-5">
		<%
		PassengerDao dao = new PassengerDao(DBConnect.getConn());
		TrainDao dao1 = new TrainDao(DBConnect.getConn());
		TicketDao dao2 = new TicketDao(DBConnect.getConn());
		%>
		<div class="row">
			<div class="col-md-4 p-3">
				<a href="manageTrain.jsp" style="text-decoration: none;">
					<div class="card paint-card">
						<div class="card-body text-center text-secondary">
							<i class="fa-solid fa-train-subway fa-3x"></i><br>
							<p class="fs-4 text-center">
								Total Train <br><%=dao1.countTrain()%>
							</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-3">
			<a href="managePassenger.jsp" style="text-decoration: none;">
				<div class="card paint-card">
					<div class="card-body text-center text-secondary">
						<i class="fa-solid fa-people-group fa-3x"></i><br>
						<p class="fs-4 text-center">
							Passenger <br><%=dao.countPassenger()%>
						</p>
					</div>
				</div></a>
			</div>
			<div class="col-md-4 p-3">
				<a href="manageTickets.jsp" style="text-decoration: none;">
					<div class="card paint-card">
						<div class="card-body text-center text-secondary">
							<i class="far fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">
								Total Reservation <br><%=dao2.countTickets()%>
							</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-3">
				<a href="approvedTickets.jsp" style="text-decoration: none;">
					<div class="card paint-card">
						<div class="card-body text-center text-secondary">
							<i class="fa-solid fa-person-circle-check fa-3x"></i><br>
							<p class="fs-4 text-center">
								Approved Tickets <br><%=dao2.countApprovedTicket()%>
							</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-3">
				<a href="pendingTickets.jsp" style="text-decoration: none;">
					<div class="card paint-card">
						<div class="card-body text-center text-secondary">
							<i class="fa-solid fa-spinner fa-3x"></i><br>
							<p class="fs-4 text-center">
								Pending Tickets <br><%=dao2.countPendingTicket()%>
							</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-3">
				<div class="card paint-card">
					<div class="card-body text-center text-secondary">
							<i class="fa-solid fa-indian-rupee-sign fa-3x"></i><br>
							<p class="fs-4 text-center">
								Accounting<br><i class="fa-solid fa-indian-rupee-sign fa-0.5x">&nbsp;&nbsp;</i><%=dao2.countTotalTicketAmount()%>
							</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>