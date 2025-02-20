package com.admin.servlet;

import java.io.IOException;

import com.dao.PassengerDao;
import com.dao.TrainDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteTrain")
public class AdminDeleteTrain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		TrainDao dao = new TrainDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteTrain(id)) {
			session.setAttribute("succMsg", "Train Delete Sucessfully..");
			resp.sendRedirect("admin/manageTrain.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/manageTrain.jsp");
		}
		

	}

}