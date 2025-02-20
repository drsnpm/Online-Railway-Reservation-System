package com.admin.servlet;

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

@WebServlet("/adminUpdateTicket")
public class AdminUpdateTicket extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String confirmation = req.getParameter("confirmation");

            Ticket t = new Ticket(id, confirmation);

            TicketDao dao = new TicketDao(DBConnect.getConn());
            HttpSession session = req.getSession();
            
            if (dao.updateTicket(t)) {
                session.setAttribute("succMsgd", "Ticket updated successfully.");
                resp.sendRedirect("admin/adminUpdateTicket.jsp?id=" + id);
            } else {
                session.setAttribute("errorMsgd", "Ticket update failed. Please try again.");
                resp.sendRedirect("admin/adminUpdateTicket.jsp?id=" + id);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("admin/adminUpdateTicket.jsp");
        }
    }
}
