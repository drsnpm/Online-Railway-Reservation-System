package com.passenger.servlet;

import java.io.IOException;
import com.dao.PassengerDao;
import com.db.DBConnect;
import com.entity.Passenger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/passLogin")
public class PassLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		PassengerDao dao = new PassengerDao(DBConnect.getConn());
		Passenger pass = dao.login(email, password);

		if (pass != null) {
			session.setAttribute("passObj", pass);
			resp.sendRedirect("passenger/passHome.jsp"); 
		} else {
			session.setAttribute("errorMsg", "Invalid email & password");
			resp.sendRedirect("passenger/pass_login.jsp");
		}
	}
}
