<%@page import="com.entity.Passenger"%>
<%@page import="com.dao.PassengerDao"%>
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
<title>Index Page</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
	<h3 class="text-center">Manage Passenger</h3>
	<table class="table table-bordered" >
    	<thead>
        	<tr>
            	<th>Passenger Name</th>
            	<th>Passenger Email</th>
            	<th>Mobile Number</th>
            	<th>Gender</th>
            	<th>Date Of Birth</th>
            	<th>Address</th>
            	<th>Action</th>
            </tr>    
        </thead>
        <tbody>
        	<%
	        	PassengerDao dao2 = new PassengerDao(DBConnect.getConn());
				List<Passenger> list = dao2.getAllPassenger();
				if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="8" class="text-center text-danger">No passenger found</td>
			</tr>
			<%
			     } else {
			        for (Passenger p : list) {
			%>
			<tr>
				<td><%=p.getName()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getPhNo()%></td>
				<td><%=p.getGender()%></td>
				<td><%=p.getDob()%></td>
				<td><%=p.getAddress()%></td>
				<td>
					<a href="adminUpdatePassenger.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-primary">Edit</a> 
					<a href="../deletePassenger?id=<%=p.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Passenger?');">Delete</a>
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