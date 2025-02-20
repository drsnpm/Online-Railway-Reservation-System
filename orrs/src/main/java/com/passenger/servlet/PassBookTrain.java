package com.passenger.servlet;

import java.io.IOException;
import com.dao.TicketDao;
import com.db.DBConnect;
import com.entity.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/passPayment")
public class PassBookTrain extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
        	int trainId = Integer.parseInt(req.getParameter("trainId"));
            String trainNumber = req.getParameter("tNo");
            String trainName = req.getParameter("name");
            String trainDep = req.getParameter("departure");
            String trainArr = req.getParameter("arrival");
            String trainDepDate = req.getParameter("depDate");
            String trainArrDate = req.getParameter("arrDate");
            String trainDepTime = req.getParameter("depTime");
            String trainArrTime = req.getParameter("arrTime");
            double trainAmount = Double.parseDouble(req.getParameter("amount"));
            String cardNumber = req.getParameter("cardNumber");
            int passId = Integer.parseInt(req.getParameter("passId"));
            String passName = req.getParameter("passName");
            String passPhNo = req.getParameter("passPhNo");
            String confirmation = "Pending";
            Ticket ticket = new Ticket(passId, passName, passPhNo, trainId, trainNumber, trainName, trainDep, trainArr, 
                                       trainDepDate, trainDepTime, trainArrDate, trainArrTime, 
                                       trainAmount, cardNumber, confirmation);

            TicketDao dao = new TicketDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.addTicket(ticket)) {
                session.setAttribute("sucMsg", "Train Booked Successfully.");
                resp.sendRedirect("passenger/passCancelTicket.jsp");
            } else {
                session.setAttribute("errorMsg", "Booking failed. Please try again.");
                resp.sendRedirect("passenger/passPayment.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("passenger/passPayment.jsp");
        }
    }
}
