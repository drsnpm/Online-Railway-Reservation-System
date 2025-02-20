<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
    String basePath = request.getContextPath(); 
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= basePath %>/index.jsp">ORRS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mr-4 pr-4" style="font-size: 1.2rem;">
                <c:choose>
                    <c:when test="${empty passObj and empty adminObj}">
                        <!-- Common links when no user is logged in -->
                        <li class="nav-item">
                            <a class="nav-link active mr-4" aria-current="page" href="<%= basePath %>/index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active mr-4" aria-current="page" href="<%= basePath %>/admin/adminLogin.jsp">Admin</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="<%= basePath %>/passenger/pass_login.jsp">Passenger</a>
                        </li>
                    </c:when>

                    <c:when test="${not empty passObj}">
                        <!-- Links when a passenger is logged in -->
                        <li class="nav-item">
                            <a class="nav-link active mr-4" href="<%= basePath %>/passenger/passHome.jsp">Reserve Train</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active mr-4" href="<%= basePath %>/passenger/passCancelTicket.jsp">Ticket</a>
                        </li>
                        <li class="nav-item dropdown" style="padding-right: 50px;">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<%= basePath %>/passenger/profile.jsp">Profile</a>
                                <a class="dropdown-item" href="<%= basePath %>/passLogout">Logout</a>
                            </div>
                        </li>
                    </c:when>

                    <c:when test="${not empty adminObj}">
                        <!-- Links when an admin is logged in -->
                        <li class="nav-item mr-4">
                            <a class="nav-link active" href="<%= basePath %>/admin/adminHome.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item dropdown mr-4">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Trains</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<%= basePath %>/admin/adminAddTrain.jsp">Add Train</a>
                                <a class="dropdown-item" href="<%= basePath %>/admin/manageTrain.jsp">Manage Train</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown mr-4">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Passengers</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<%= basePath %>/admin/adminAddPassenger.jsp">Add Passenger</a>
                                <a class="dropdown-item" href="<%= basePath %>/admin/managePassenger.jsp">Manage Passenger</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown mr-4">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tickets</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<%= basePath %>/admin/manageTickets.jsp">Manage Tickets</a>
                                <a class="dropdown-item" href="<%= basePath %>/admin/approvedTickets.jsp">Approved Tickets</a>
                                <a class="dropdown-item" href="<%= basePath %>/admin/pendingTickets.jsp">Pending Tickets</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<%= basePath %>/admin/profile.jsp">Profile</a>
                                <a class="dropdown-item" href="<%= basePath %>/adminLogout">Logout</a>
                            </div>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
