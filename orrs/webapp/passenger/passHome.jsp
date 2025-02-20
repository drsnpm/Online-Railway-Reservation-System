<%@page import="com.entity.Train"%>
<%@page import="com.dao.TrainDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("passObj") == null) {
	    response.sendRedirect("pass_login.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Train</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>
    <div class="container-fluid p-3" style="background-color: #f0f1f2;">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form action="passHome.jsp" method="post">
				    <div class="input-group">
				        <input placeholder="Enter train departure station" type="text" class="form-control" name="departure" required>
				        <input placeholder="Enter train arrival station" type="text" class="form-control" name="arrival" required>
				        <input type="date" class="form-control" name="departure_date" id="departure_date" required>
				        <button class="btn bg-secondary ms-2 text-white">Search</button>
				    </div>
				</form>
			</div>
		</div>
	</div>
	<div class="container p-3 mx-auto">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Train number</th>
                    <th>Train Name</th>
                    <th>Train Departure</th>
                    <th>Train Arrival</th>
                    <th>Departure Date</th>
                    <th>Departure Time</th>
                    <th>Available Seat</th>
                    <th>Amount</th>
                    <th>Book</th>
                </tr>    
            </thead>
				<%
				    String departure = request.getParameter("departure");
				    String arrival = request.getParameter("arrival");
				    String departureDate = request.getParameter("departure_date");
				
				    TrainDao dao = new TrainDao(DBConnect.getConn());
				    List<Train> list;
				
				    if (departure == null || arrival == null || departureDate == null || departure.trim().isEmpty() || arrival.trim().isEmpty() || departureDate.trim().isEmpty()) {
				        list = dao.getAvailableTrain();
				    } else {
				        list = dao.searchTrain(departure, arrival, departureDate);
				    }
				
				    if (list != null && list.size() > 0) {
				        for (Train t : list) {
				%>
				<tbody>
				    <tr>
				        <td><%=t.getNumber() %></td>
				        <td><%=t.getName()%></td>
				        <td><%=t.getDeparture() %></td>
				        <td><%=t.getArrival() %></td>
				        <td><%=t.getDepDate() %></td>
				        <td><%=t.getDepTime() %></td>
				        <td>
				        	<% if (t.getSeats() == 0) { %>
				                <span class="text-danger fw-bold">Sold Out</span>
				            <% } else { %>
				                <%= t.getSeats() %>
				            <% } %>
						</td>
				        <td><%=t.getAmount() %></td>
				        <td>
				            <% if (t.getSeats() == 0) { %>
				                <button class="btn btn-sm btn-secondary" disabled>Sold Out</button>
				            <% } else { %>
				                <a href="passPayment.jsp?id=<%= t.getId() %>" class="btn btn-sm btn-success">Book</a>
				            <% } %>  
				        </td>
				    </tr>
				</tbody>
				<%
				        }
				    } else {
				%>
				    <tr>
				        <td colspan="8" class="text-center text-danger">No trains available for the selected route and date</td>
				    </tr>
				<%
				    }
				%>

            </tbody>
        </table>
    </div>
    <script>
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0');
	    var yyyy = today.getFullYear();
	    today = yyyy + '-' + mm + '-' + dd;
	    document.getElementById('departure_date').setAttribute('min', today);
	</script>
</body>
</html>
