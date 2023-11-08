package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.userDAO;
import com.db.DBConnect;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldPassword = request.getParameter("oldPassword");
		String newPassWord = request.getParameter("newPassword");
		int uid = Integer.parseInt(request.getParameter("id"));
		
		userDAO dao = new userDAO(DBConnect.getConn());
		HttpSession session = request.getSession();
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.updatePassword(uid, newPassWord)) {
				session.setAttribute("sucMsg", "Password updated successfully");
				response.sendRedirect("user_login.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				response.sendRedirect("edit_profile.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Password Doesnt Match");
			response.sendRedirect("edit_profile.jsp");
		}
		
	}

}
