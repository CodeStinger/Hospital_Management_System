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
import com.entity.User;

/**
 * Servlet implementation class UserRegister
 */

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			User u = new User(fullname, email, password);

			userDAO dao = new userDAO(DBConnect.getConn());
			
			HttpSession session = request.getSession();
			
			boolean f = dao.UserRegistration(u);
			if (f) {
				session.setAttribute("sucMsg", "Registration Successfull");
				response.sendRedirect("signup.jsp");
				/* System.out.print(""); */
			} else {
				session.setAttribute("errorMsg", "Something Went Wrong On Server! Try Again!");
				response.sendRedirect("signup.jsp");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
