<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
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
    <title>Admin Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <%@ include file="../component/navbar.jsp" %>
    <%@ include file="profileSidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">My Profile</h1>
                <hr class="my-4">
                <p>Name: ${adminObj.name}</p>
                <hr class="my-4">
                <p>Address: ${adminObj.address}</p>
                <hr class="my-4">
                <p>DOB: ${adminObj.dob}</p>
                <hr class="my-4">
                <p>Gender: ${adminObj.gender}</p>
                <hr class="my-4">
                <p>Email: ${adminObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${adminObj.phNo}</p>
            </div>
        </div> 
    </div>
</body>
</html>
