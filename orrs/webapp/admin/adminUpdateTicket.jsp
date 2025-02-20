<%@page import="com.entity.Ticket"%>
<%@page import="com.dao.TicketDao"%>
<%@page import="com.db.DBConnect"%>
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
<title>Edit Passenger Profile</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center" style="font-size: 2.5rem;">PassengerTicket Details</p>

						<c:if test="${not empty errorMsgd}">
							<p class="fs-3 text-center text-danger">${errorMsgd}</p>
							<c:remove var="errorMsgd" scope="session" />
						</c:if>
						<c:if test="${not empty succMsgd}">
							<div class="fs-3 text-center text-success" role="alert">${succMsgd}</div>
							<c:remove var="succMsgd" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						TicketDao dao2 = new TicketDao(DBConnect.getConn());
						Ticket t = dao2.getTicketById(id);
						%>

						<form action="../adminUpdateTicket" method="post">
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Passenger Name</label>
	                                <input type="text" name="passName" class="form-control" value="<%=t.getPass_name()%>" readonly>
                            	</div>
                            	<div class="col-6">
	                                <label class="form-label">Passenger Mobile</label>
	                                <input type="text" name=passPhNo class="form-control" value="<%=t.getPass_phno()%>" readonly>
                            	</div>
                            </div>
                            <div class="mb-3 row">
							    <div class="col-3">
							        <label class="form-label">TRain Number</label>
							        <input name="tNo" type="text" class="form-control" value="<%=t.getTrain_number()%>" readonly>
							    </div>
							    <div class="col-3">
							        <label class="form-label">Train Name</label>							    
							        <input name="trainName" type="text" class="form-control" value="<%=t.getTrain_name()%>" readonly>							        
							    </div>
							    <div class="col-3">
							        <label class="form-label">Departure Date</label>
							        <input name="depDate" type="text" class="form-control" value="<%=t.getTrain_depDate()%>" readonly>
							    </div>
							    <div class="col-3">
							        <label class="form-label">Arrival Date</label>							    
							        <input name="arrDate" type="text" class="form-control" value="<%=t.getTrain_arrDate()%>" readonly>							        
							    </div>
							</div>
							<div class="mb-3 row">
								<div class="col-3">
							        <label class="form-label">Train Departure</label>
							        <input name="departure" type="text" class="form-control" value="<%=t.getTrain_departure()%>" readonly>
							    </div>
							    <div class="col-3">
							        <label class="form-label">Train Arrival</label>							    
							        <input name="arrival" type="text" class="form-control" value="<%=t.getTrain_arrival()%>" readonly>							        
							    </div>
							    <div class="col-3">
							        <label class="form-label">Departure Time</label>
							        <input name="depTime" type="text" class="form-control" value="<%=t.getTrain_depTime()%>" readonly>
							    </div>
							    <div class="col-3">
							        <label class="form-label">Arrival Time</label>							    
							        <input name="arrTime" type="text" class="form-control" value="<%=t.getTrain_arrTime()%>" readonly>							        
							    </div>
							</div>
							<div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Amount</label>
							        <input name="amount" type="text" class="form-control" value="<%=t.getAmount()%>" readonly>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Payment</label>							    
							        <input name="cardNumber" type="text" class="form-control" value="<%=t.getPayment_code()%>" readonly>							        
							    </div>
							</div>
                         	<div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Confirmation</label>
							        <select class="form-control" name="confirmation" required>
							            <option value="Confirmed" <%= t.getConfirmation().equals("Confirmed") ? "selected" : "" %>>Accepted</option>
							            <option value="Pending" <%= t.getConfirmation().equals("Pending") ? "selected" : "" %>>Rejected</option>
							        </select>
							    </div>
							 </div>
							 <input type="hidden" name="trainId" value="<%=t.getTrain_id()%>">
							<input type="hidden" name="passId" value="<%=t.getPass_id()%>">
                            <input type="hidden" name="id" value="<%=t.getId()%>">
                            <button type="submit" class="btn bg-secondary text-white col-md-12">Update</button>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
