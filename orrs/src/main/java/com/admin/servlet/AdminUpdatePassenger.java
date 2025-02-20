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

@WebServlet("/adminUpdatePassenger")
public class AdminUpdatePassenger extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
            String fullName = req.getParameter("fullname");
            String address = req.getParameter("address");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            String email = req.getParameter("email");
            String phNo = req.getParameter("phNo");

            Passenger p = new Passenger(id, fullName, address, dob, gender, phNo, email, "");

            PassengerDao dao = new PassengerDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists.");
                resp.sendRedirect("admin/adminUpdatePassenger.jsp?id=" + id);
            } else {
                if (dao.updatePassengerProfile(p)) {
                    session.setAttribute("succMsgd", "Passenger updated successfully.");
                    resp.sendRedirect("admin/adminUpdatePassenger.jsp?id=" +id);
                } else {
                    session.setAttribute("errorMsgd", "Passenger update failed. Please try again.");
                    resp.sendRedirect("admin/adminUpdatePassenger.jsp?id=" + id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("admin/adminUpdatePassenger.jsp");
        }
	}
}
