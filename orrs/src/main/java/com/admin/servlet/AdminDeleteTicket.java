package com.admin.servlet;

import java.io.IOException;

import com.dao.TicketDao;
import com.dao.TrainDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteTicket")
public class AdminDeleteTicket extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		TicketDao dao = new TicketDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.cancelTicket(id)) {
			session.setAttribute("succMsg", "Ticket Delete Sucessfully..");
			resp.sendRedirect("admin/manageTickets.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/manageTickets.jsp");
		}
		

	}

}