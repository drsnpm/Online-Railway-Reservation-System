<%@page import="com.entity.Train"%>
<%@page import="com.dao.TrainDao"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = (String) session.getAttribute("errorMsg");
    if (errorMessage != null) {
%>
    <script>
        alert("<%= errorMessage %>");
    </script>
<%
        session.removeAttribute("errorMsg");
    }
    if (session.getAttribute("passObj") == null) {
        response.sendRedirect("pass_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
</style>
<meta charset="UTF-8">
<title>Payment</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>
    <div class="container-fluid p-3 row">
        <div class="col-lg-6 mx-auto">
            <div class="jumbotron container">
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                TrainDao dao2 = new TrainDao(DBConnect.getConn());
                Train t = dao2.getTrainById(id);
                request.setAttribute("train", t);
            %>
                <h1 class="display-4">Train Details</h1>
                <hr class="my-4">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Train Number: <%= t.getNumber() %></p>
                	</div>
                	<div class="col-6">
                		<p>Train Name: <%= t.getName() %></p>
                	</div>
                </div>
                <hr class="my-4">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Train Departure: <%= t.getDeparture() %></p>
                	</div>
                	<div class="col-6">
                		<p>Train Arrival: <%= t.getArrival() %></p>
                	</div>
                </div>
                <hr class="my-4">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Departure Date: <%= t.getDepDate() %></p>
                	</div>
                	<div class="col-6">
                		<p>Arrival Date: <%= t.getArrDate() %></p>
                	</div>
                </div>
                <hr class="my-4">
                <div class="mb-3 row">
					<div class="col-6">
                		<p>Departure Time: <%= t.getDepTime() %></p>
                	</div>
                	<div class="col-6">
                		<p>Arrival Time: <%= t.getArrTime() %></p>
                	</div>
                </div>
      			<hr class="my-4">
                <p>Train amount: <%= t.getAmount() %></p>
            </div>
        </div> 

        <div class="p-4 m-2 col-lg-4 w-75 mx-auto">
        <center><i>This is a FAKE PAYMENT. Just for demo purposes</i></center><br><br><br>
            <h3>Payment: <%= t.getAmount() %></h3>
            <div class="p-4 border rounded paint-card">
            <form action="${pageContext.request.contextPath}/passPayment" method="post">
                <div class="form-group">
                    <label>CARD NUMBER</label>
                    <input name="cardNumber" type="text" class="form-control" placeholder="xxxx xxxx xxxx xxxx" maxlength="16" required />
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label>MONTH</label>
                        <input type="text" class="form-control" name="expityMonth" placeholder="MM" maxlength="2" required />
                    </div>
                    <div class="form-group col-md-4">
                        <label>EXP YEAR</label>
                        <input type="text" class="form-control" name="expityYear" placeholder="YY" maxlength="2" required />
                    </div>
                    <div class="form-group col-md-4">
                        <label>CV CODE</label>
                        <input type="password" class="form-control" name="cvCode" placeholder="XXX" maxlength="3" required />
                    </div>
                </div>
				<input type="hidden" name="passId" value="${passObj.id}">
                <input type="hidden" name="passName" value="${passObj.name}">
                <input type="hidden" name="passPhNo" value="${passObj.phNo}">
                <input type="hidden" name="trainId" value="<%= t.getId() %>">
                <input type="hidden" name="tNo" value="<%= t.getNumber() %>">
                <input type="hidden" name="name" value="<%= t.getName() %>">
                <input type="hidden" name="departure" value="<%= t.getDeparture() %>">
                <input type="hidden" name="arrival" value="<%= t.getArrival() %>">
                <input type="hidden" name="depDate" value="<%= t.getDepDate() %>">
                <input type="hidden" name="arrDate" value="<%= t.getArrDate() %>">
                <input type="hidden" name="depTime" value="<%= t.getDepTime() %>">
                <input type="hidden" name="arrTime" value="<%= t.getArrTime() %>">
                <input type="hidden" name="amount" value="<%= t.getAmount() %>">

                <button type="submit" class="btn btn-primary btn-lg btn-block">Pay</button>
            </form>
            </div>
        </div>
    </div>
</body>
</html>
