<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminLogin.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Passenger</title>
    <%@ include file="../component/allcss.jsp"%>
    <style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
	</style>
</head>
<body>
    <%@ include file="../component/navbar.jsp"%>

	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
                        <p class="fs-4 text-center" style="font-size: 2.5rem;">Add Passenger</p>

                        <!-- Success message display -->
                        <c:if test="${not empty sucMsg}">
                            <p class="text-center text-success fs-3">${sucMsg}</p>
                            <c:remove var="sucMsg" scope="session" />
                        </c:if>

                        <!-- Error message display -->
                        <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger fs-3">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <!-- Registration Form -->
                        <form action="${pageContext.request.contextPath}/addPassenger" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input name="full_name" type="text" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input name="address" type="text" class="form-control" required>
                            </div>
                            <div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Date of Birth</label>
							        <input name="dob" id="dob" type="date" class="form-control" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Gender</label>
							        <select class="form-control" name="gender" required>
							            <option value="Male">Male</option>
							            <option value="Female">Female</option>
							        </select>
							    </div>
							</div>
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Mobile Number</label>
	                                <input type="text" name="phno" class="form-control" pattern="\d{10}" maxlength="10" title="Mobile number must be exactly 10 digits" required>
	                                </div>
                            	<div class="col-6">
	                                <label class="form-label">Email Address</label>
	                                <input name="email" type="email" class="form-control" required>
                            	</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input name="pass" type="password" class="form-control" required>
                            </div>

                            <button type="submit" class="btn bg-secondary text-white col-md-12">Add Passenger</button>
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
