<%@page import="com.entity.Passenger"%>
<%@page import="com.entity.Ticket"%>
<%@page import="com.dao.TicketDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%
	if (session.getAttribute("passObj") == null) {
	    response.sendRedirect("pass_login.jsp");
	    return;
	}

    String successMessage = (String) session.getAttribute("sucMsg");
    if (successMessage != null) {
%>
    <script>
        alert("<%= successMessage %>");
    </script>
<%
        session.removeAttribute("sucMsg");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    Date currentDateTime = new Date();
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
        <h3 class="text-center">Your Tickets</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Train Number</th>
                    <th>Train Name</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Departure Date</th>
                    <th>Departure Time</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Cancel Ticket</th>
                    <th>Print</th>
                </tr>    
            </thead>
            <tbody>
			    <%
			        Passenger p = (Passenger) session.getAttribute("passObj");
			        TicketDao dao = new TicketDao(DBConnect.getConn());
			        List<Ticket> list = dao.getAllTicketByLoginPassenger(p.getId());
			        if (list.isEmpty()) {
			    %>
		        <tr>
		            <td colspan="8" class="text-center text-danger">No tickets found</td>
		        </tr>
			    <%
			        } else {
			            for (Ticket t : list) {
			                String departureDateTimeStr = t.getTrain_depDate() + " " + t.getTrain_depTime();
			                Date departureDateTime = sdf.parse(departureDateTimeStr);
			                boolean isPastDeparture = currentDateTime.after(departureDateTime);
			    %>
                <tr>
                    <td><%= t.getTrain_number() %></td>
                    <td><%= t.getTrain_name() %></td>
                    <td><%= t.getTrain_departure() %></td>
                    <td><%= t.getTrain_arrival() %></td>
                    <td><%= t.getTrain_depDate() %></td>
                    <td><%= t.getTrain_depTime() %></td>
                    <td><%= t.getAmount() %></td>
                    <td>
                        <%
                        if ("Pending".equals(t.getConfirmation())) {
                        %>
                            <a href="#" class="btn btn-sm btn-warning">Pending</a>
                        <%
                        } else {
                        %>
                            <span class="text-success"><%= t.getConfirmation() %></span>
                        <%
                        }
                        %>
                    </td>
                    <td>
                        <%
                        if (isPastDeparture) {
                        %>
                            <button class="btn btn-sm btn-danger" disabled>Cancel</button>
                        <%
                        } else {
                        %>
                            <a href="../cancelTicket?id=<%= t.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to cancel this Ticket?');">Cancel</a>
                        <%
                        }
                        %>
                    </td>
                    <td>
                        <a href="passPrintTicket.jsp?id=<%=t.getId()%>" class="btn btn-sm btn-primary">Print</a>
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