<%@page import="com.entity.Train"%>
<%@page import="com.dao.TrainDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
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
<meta charset="UTF-8">
<title>Manage Train</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
	<h3 class="text-center">Manage Train</h3>
	<table class="table table-bordered" >
    	<thead>
        	<tr>
            	<th>Train No</th>
            	<th>Train Name</th>
            	<th>Train Departure</th>
            	<th>Train Arrival</th>
            	<th>Dep Date</th>
            	<th>Dep Time</th>
            	<th>Seats</th>
            	<th>Amount</th>
            	<th>Action</th>
            </tr>    
        </thead>
        <tbody>
        	<%
        		TrainDao dao2 = new TrainDao(DBConnect.getConn());
				List<Train> list = dao2.getAllTrain();
				if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="8" class="text-center text-danger">No Train found</td>
			</tr>
			<%
				} else {
					for (Train t : list) {
			%>
			<tr>
				<td><%=t.getNumber() %></td>
				<td><%=t.getName()%></td>
				<td><%=t.getDeparture() %></td>
				<td><%=t.getArrival() %></td>
				<td><%=t.getDepDate() %></td>
				<td><%=t.getDepTime() %></td>
				<td><%=t.getSeats() %></td>
				<td><%=t.getAmount() %></td>
				<td>
					<a href="adminUpdateTrain.jsp?id=<%=t.getId()%>" class="btn btn-sm btn-primary">Edit</a> 
					<a href="../deleteTrain?id=<%=t.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Train?');">Delete</a>
				</td>
			</tr>
			<%
				}
				}
			%>
        </tbody>
     </table>
     </div>
</body>
</html>