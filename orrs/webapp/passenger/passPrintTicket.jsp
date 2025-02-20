<%@page import="com.entity.Ticket"%>
<%@page import="com.dao.TicketDao"%>
<%@page import="com.db.DBConnect"%>
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
<title>Payment</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>
    <div class="container-fluid p-3 row">
        <div class="col-lg-6 mx-auto">
            <div class="jumbotron container p-4" id="printReceipt">
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                TicketDao dao2 = new TicketDao(DBConnect.getConn());
                Ticket t = dao2.getTicketById(id);
                request.setAttribute("ticket", t);
            %>
                <h1 class="display-8">Ticket Details</h1>
                <hr class="my-2">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Passenger Name: <%= t.getPass_name() %></p>
                	</div>
                	<div class="col-6">
                		<p>Passenger Ph No: <%= t.getPass_phno() %></p>
                	</div>
                </div>
                <hr class="my-2">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Train Number: <%= t.getTrain_number() %></p>
                	</div>
                	<div class="col-6">
                		<p>Train Name: <%= t.getTrain_name() %></p>
                	</div>
                </div>
                <hr class="my-2">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Train Departure: <%= t.getTrain_departure() %></p>
                	</div>
                	<div class="col-6">
                		<p>Train Arrival: <%= t.getTrain_arrival() %></p>
                	</div>
                </div>
                <hr class="my-2">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Departure Date: <%= t.getTrain_depDate() %></p>
                	</div>
                	<div class="col-6">
                		<p>Arrival Date: <%= t.getTrain_arrDate() %></p>
                	</div>
                </div>
                <hr class="my-2">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Departure Time: <%= t.getTrain_depTime() %></p>
                	</div>
                	<div class="col-6">
                		<p>Arrival Time: <%= t.getTrain_arrTime() %></p>
                	</div>
                </div>
      			<hr class="my-2">
      			<div class="mb-3 row">
					<div class="col-6">
                		 <p>Train amount: <%= t.getAmount() %></p>
                	</div>
                	<div class="col-6">
                		<p>Payment id: <%= t.getPayment_code() %></p>
                	</div>
                </div>
                <hr class="my-2">
               <p>Ticket Status: <%= t.getConfirmation() %></p>
            </div>
            <button id="print" onclick="printContent('printReceipt');" class="btn btn-primary btn-lg btn-block">Print</button>
        </div>
    </div>
    
    
    <script>
      function printContent(el){
        var restorepage = $('body').html();
        var printcontent = $('#' + el).clone();
        $('body').empty().html(printcontent);
        window.print();
        $('body').html(restorepage);
        }
     </script>
</body>
</html>
