<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminLogin.jsp");
	    return;
	}
%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
	</style>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <c:if test="${empty adminObj}">
        <c:redirect url="adminLogin.jsp"/>
    </c:if>
    <%@ include file="../component/navbar.jsp" %>
    <%@ include file="profileSidebar.jsp" %>
  
    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="col-md-8 offset-md-2">
                <div class="card paint-card">
                    <p class="text-center fs-3" style="font-size: 2rem;">Edit Profile</p>
                    
                    <!-- Display success message -->
                    <c:if test="${not empty succMsgd}">
                        <p class="text-center text-success fs-3">${succMsgd}</p>
                        <c:remove var="succMsgd" scope="session"/>
                    </c:if>

                    <!-- Display error message -->
                    <c:if test="${not empty errorMsgd}">
                        <p class="text-center text-danger fs-5">${errorMsgd}</p>
                        <c:remove var="errorMsgd" scope="session"/>
                    </c:if>
                    
                    <div class="card-body">
                        <form action="../adminUpdateProfile" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="${adminObj.name}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" required name="address" class="form-control" value="${adminObj.address}">
                            </div>
                            <div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Date of Birth</label>
							        <input name="dob" id="dob" type="date" class="form-control" value="${adminObj.dob}" required>
							    </div>
							    <div class="col-6">
								    <label class="form-label">Gender</label>
								    <select class="form-control" name="gender" required>
								        <option value="Male" ${adminObj.gender == 'Male' ? 'selected' : ''}>Male</option>
								        <option value="Female" ${adminObj.gender == 'Female' ? 'selected' : ''}>Female</option>
								    </select>
								</div>

							</div>
							
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" required name="email" class="form-control" value="${adminObj.email}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile Number</label>
                                <input type="text" required name="phNo" class="form-control" pattern="\d{10}" maxlength="10" title="Mobile number must be exactly 10 digits" value="${adminObj.phNo}">
                            </div>
                            
                            <input type="hidden" name="id" value="${adminObj.id}">
                            <button type="submit" class="btn btn-secondary col-md-12">Update</button>
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
