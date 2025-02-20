package com.admin.servlet;

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

@WebServlet("/addPassenger")
public class AdminAddPassenger extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullName = req.getParameter("full_name");
			String address = req.getParameter("address");
			String dob = req.getParameter("dob");
			String gender = req.getParameter("gender");
			String phNo = req.getParameter("phno");
			String email = req.getParameter("email");
			String password = req.getParameter("pass");
			
			Passenger p = new Passenger(fullName, address, dob, gender, phNo, email, password);

			PassengerDao dao = new PassengerDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			boolean f = dao.register(p);

			if (f) {
				session.setAttribute("sucMsg", "Add Passenger Sucessfully");
				resp.sendRedirect("admin/adminAddPassenger.jsp");

			} else {
				session.setAttribute("errorMsg", "Email already exists!");
				resp.sendRedirect("admin/adminAddPassenger.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}