<%@page import="com.entity.Passenger"%>
<%@page import="com.dao.PassengerDao"%>
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
	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center" style="font-size: 2rem;">Edit Passenger Details</p>

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
						PassengerDao dao2 = new PassengerDao(DBConnect.getConn());
						Passenger p = dao2.getPassengerById(id);
						%>

						<form action="../adminUpdatePassenger" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="<%=p.getName()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" required name="address" class="form-control" value="<%=p.getAddress()%>">
                            </div>
                            <div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Date of Birth</label>
							        <input id="dob" name="dob" type="date" class="form-control" value="<%=p.getDob()%>" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Gender</label>
							        <select class="form-control" name="gender" required>
							            <option value="Male" <%= p.getGender().equals("Male") ? "selected" : "" %>>Male</option>
							            <option value="Female" <%= p.getGender().equals("Female") ? "selected" : "" %>>Female</option>
							        </select>
							    </div>
							</div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" required name="email" class="form-control" value="<%=p.getEmail()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile Number</label>
                                <input type="text" required name="phNo" class="form-control" pattern="\d{10}" maxlength="10" title="Mobile number must be exactly 10 digits" value="<%=p.getPhNo()%>">
                            </div>
                            
                            <input type="hidden" name="id" value="<%=p.getId()%>">
                            <button type="submit" class="btn bg-secondary text-white col-md-12">Update</button>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    const today = new Date();
	    const todayString = today.getFullYear() + '-' + 
	                        String(today.getMonth() + 1).padStart(2, '0') + '-' + 
	                        String(today.getDate()).padStart(2, '0');
	    const dobInput = document.getElementById('dob');
	    dobInput.setAttribute('max', todayString);
	</script>
</body>
</html>
