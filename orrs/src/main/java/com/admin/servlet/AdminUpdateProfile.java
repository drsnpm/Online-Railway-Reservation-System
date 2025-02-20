package com.admin.servlet;

import java.io.IOException;

import com.dao.AdminDao;
import com.db.DBConnect;
import com.entity.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminUpdateProfile")
public class AdminUpdateProfile extends HttpServlet {

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

            Admin a = new Admin(id, fullName, address, dob, gender, phNo, email, "");

            AdminDao dao = new AdminDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists.");
                resp.sendRedirect("passenger/adminUpdateProfile.jsp");
            } else {
                if (dao.updateAdminProfile(a)) {
                    Admin updatedAdmin = dao.getAdminById(id);
                    session.setAttribute("succMsgd", "Profile updated successfully.");
                    session.setAttribute("adminObj", updatedAdmin);
                    resp.sendRedirect("admin/profile.jsp");
                } else {
                    session.setAttribute("errorMsgd", "Profile update failed. Please try again.");
                    resp.sendRedirect("admin/adminUpdateProfile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("admin/adminUpdateProfile.jsp");
        }
    }
}
