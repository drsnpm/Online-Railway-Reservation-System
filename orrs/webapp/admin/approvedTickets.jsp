<%@page import="com.entity.Ticket"%>
<%@page import="com.dao.TicketDao"%>
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
<title>Manage Ticket</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
	<h3 class="text-center">Approved Tickets</h3>
	<table class="table table-bordered">
    	<thead>
        	<tr>
                <th>Passenger Name</th>
                <th>Phone Number</th>
            	<th>Train Number</th>
            	<th>Train Name</th>
            	<th>Departure</th>
            	<th>Arrival</th>
            	<th>Departure Date</th>
            	<th>Departure Time</th>
            </tr>    
        </thead>
        <tbody>
        	<%
        		TicketDao dao2 = new TicketDao(DBConnect.getConn());
				List<Ticket> list = dao2.getAllApprovedTicket();
				if (list.isEmpty()) {
			%>
			<tr>
            	<td colspan="8" class="text-center text-danger">No tickets found</td>
            </tr>
            <%
                        } else {
                            for (Ticket t : list) {
                %>
			<tr>
				<td><%=t.getPass_name() %></td>
				<td><%=t.getPass_phno()%></td>
				<td><%=t.getTrain_number() %></td>
				<td><%=t.getTrain_name() %></td>
				<td><%=t.getTrain_departure() %></td>
				<td><%=t.getTrain_arrival() %></td>
				<td><%=t.getTrain_depDate() %></td>
				<td><%=t.getTrain_depTime() %></td>
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
