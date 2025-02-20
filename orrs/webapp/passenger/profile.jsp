<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
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
    <title>User Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <%@ include file="../component/navbar.jsp" %>
    <%@ include file="profile_sidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">My Profile</h1>
                <hr class="my-4">
                <p>Name: ${passObj.name}</p>
                <hr class="my-4">
                <p>Address: ${passObj.address}</p>
                <hr class="my-4">
                <p>DOB: ${passObj.dob}</p>
                <hr class="my-4">
                <p>Gender: ${passObj.gender}</p>
                <hr class="my-4">
                <p>Email: ${passObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${passObj.phNo}</p>
            </div>
        </div> 
    </div>
</body>
</html>
