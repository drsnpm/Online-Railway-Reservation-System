package com.admin.servlet;

import java.io.IOException;

import com.dao.PassengerDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletePassenger")
public class AdminDeletePassenger extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		PassengerDao dao = new PassengerDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deletePassenger(id)) {
			session.setAttribute("succMsg", "Passenger Delete Sucessfully..");
			resp.sendRedirect("admin/managePassenger.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/managePassenger.jsp");
		}
		

	}

}