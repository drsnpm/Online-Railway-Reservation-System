<%@page import="com.entity.Train"%>
<%@page import="com.dao.TrainDao"%>
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
<title>Update Train</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center" style="font-size: 2.5rem;">Update Train</p>

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
						TrainDao dao2 = new TrainDao(DBConnect.getConn());
						Train t = dao2.getTrainById(id);
						%>

						<form action="../adminUpdateTrain" method="post">
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Train Number</label>
	                                <input type="text" required name="tNo" class="form-control" value="<%=t.getNumber()%>">
                            	</div>
                            	<div class="col-6">
                            		<label class="form-label">Train Name</label>
                                	<input type="text" required name="name" class="form-control" value="<%=t.getName()%>">
                                </div>
                            </div>
                            
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Departure Station</label>
	                                <input type="text" required name="departure" class="form-control" value="<%=t.getDeparture()%>">
                            	</div>
                            	<div class="col-6">
	                                <label class="form-label">Arrival Station</label>
	                                <input type="text" required name="arrival" class="form-control" value="<%=t.getArrival()%>">
                               </div>
                            </div>
                            <div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Departure Date</label>
							        <input name="depDate" type="date" class="form-control" value="<%=t.getDepDate()%>" id="departure_date" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Departure Time</label>
							        <input name="depTime" type="time" class="form-control" value="<%=t.getDepTime()%>" required>
							    </div>
							</div>
							<div class="mb-3 row">
								<div class="col-6">
							        <label class="form-label">Arrival Date</label>
							        <input name="arrDate" type="date" class="form-control" value="<%=t.getArrDate()%>" id="arrival_date" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Arrival Time</label>
							        <input name="arrTime" type="time" class="form-control" value="<%=t.getArrTime()%>" required>
							    </div>
							</div>
                            
                            <div class="mb-3 row">
								<div class="col-6">
	                                <label class="form-label">Seats</label>
	                                <input type="number" value="<%=t.getSeats()%>" required name="seats" class="form-control" min="0" oninput="this.value = this.value < 0 ? Math.abs(this.value) : this.value;">
	                            </div>
                            	<div class="col-6">
	                                <label class="form-label">Amount</label>
	                                <input type="number" value="<%=t.getAmount()%>" required name="amount" class="form-control" min="0" oninput="this.value = this.value < 0 ? Math.abs(this.value) : this.value;">
                            	</div>
							</div>
                            <input type="hidden" name="id" value="<%=t.getId()%>">
                            <button type="submit" class="btn bg-secondary text-white col-md-12">Update Train</button>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
	    var yyyy = today.getFullYear();
	    today = yyyy + '-' + mm + '-' + dd;
	
	    document.getElementById('departure_date').setAttribute('min', today);
	    document.getElementById('arrival_date').setAttribute('min', today);
	</script>
</body>
</html>
