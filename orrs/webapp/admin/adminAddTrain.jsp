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
	<style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
	</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Passenger</title>
    <%@ include file="../component/allcss.jsp"%>
</head>
<body>
    <%@ include file="../component/navbar.jsp"%>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center" style="font-size: 2.5rem;">Add Train</p>

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
                        <form action="${pageContext.request.contextPath}/adminAddTrain" method="post">
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Train Number</label>
	                                <input type="text" name="tNo" class="form-control" required>
                            	</div>
                            	<div class="col-6">
                            		<label class="form-label">Train Name</label>
                                	<input type="text" name="name" class="form-control" required>
                             	</div>
                             </div>
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Departure Station</label>
	                                <input type="text" name="departure" class="form-control" required>
                            	</div>
                            	<div class="col-6">
                            		<label class="form-label">Arrival Station</label>
                                	<input type="text" name="arrival" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
							    <div class="col-6">
							        <label class="form-label">Departure Date</label>
							        <input name="depDate" type="date" class="form-control" id="departure_date" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Departure Time</label>
							        <input name="depTime" type="time" class="form-control" required>
							    </div>
							</div>
							<div class="mb-3 row">
								<div class="col-6">
							        <label class="form-label">Arrival Date</label>
							        <input name="arrDate" type="date" class="form-control" id="arrival_date" required>
							    </div>
							    <div class="col-6">
							        <label class="form-label">Arrival Time</label>
							        <input name="arrTime" type="time" class="form-control" required>
							    </div>
							</div>
                            
                            <div class="mb-3 row">
							    <div class="col-6">
	                                <label class="form-label">Seats</label>
	                                <input type="number" required name="seats" class="form-control" min="0" oninput="this.value = this.value < 0 ? Math.abs(this.value) : this.value;">
                            	</div>
                            	<div class="col-6">
                            		<label class="form-label">Amount</label>
                                	<input type="number" required name="amount" class="form-control" min="0" oninput="this.value = this.value < 0 ? Math.abs(this.value) : this.value;">
                                </div>
                            </div>
                            <button type="submit" class="btn bg-secondary text-white col-md-12">Add Train</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
	    var yyyy = today.getFullYear();
	    today = yyyy + '-' + mm + '-' + dd;
	
	    document.getElementById('departure_date').setAttribute('min', today);
	    document.getElementById('arrival_date').setAttribute('min', today);
	</script>
</body>
</html>
