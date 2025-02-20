package com.admin.servlet;

import java.io.IOException;

import com.dao.PassengerDao;
import com.dao.TrainDao;
import com.db.DBConnect;
import com.entity.Passenger;
import com.entity.Train;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminAddTrain")
public class AdminAddTrain extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
            String number = req.getParameter("tNo");
            String name = req.getParameter("name");
            String departure = req.getParameter("departure");
            String arrival = req.getParameter("arrival");
            String depDate = req.getParameter("depDate");
            String arrDate = req.getParameter("arrDate");
            String depTime = req.getParameter("depTime");
            String arrTime = req.getParameter("arrTime");
            int seats = Integer.parseInt(req.getParameter("seats"));
            double amount = Double.parseDouble(req.getParameter("amount"));
			
            Train t = new Train(number, name, departure, arrival, depDate, depTime, arrDate, arrTime, seats, amount);

            TrainDao dao = new TrainDao(DBConnect.getConn());
            HttpSession session = req.getSession();

			boolean f = dao.addTrain(t);

			if (f) {
				session.setAttribute("sucMsg", "Add Train Sucessfully");
				resp.sendRedirect("admin/adminAddTrain.jsp");

			} 

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}