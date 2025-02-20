<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminLogin.jsp");
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<%@ include file="profileSidebar.jsp" %>
	<div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
			<div class="col-md-6 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3" style="font-size: 2rem">Change Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../adminChangePassword" method="post">
							<div class="mb-3">
								<label>Enter Old Password</label>
								<input type="text" name="oldPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter New Password</label> 
								<input type="text" name="newPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${adminObj.id }" name="pid">
							<button class="btn btn-secondary col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>