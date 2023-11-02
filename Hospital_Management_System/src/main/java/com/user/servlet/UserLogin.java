package com.user.servlet;

import java.io.IOException;

import com.dao.userDAO;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			
			HttpSession session = req.getSession();
			userDAO dao = new userDAO(DBConnect.getConn());
			User user= dao.login(email, pass);
			
			if(user != null) {
				session.setAttribute("UserObj", user);
				resp.sendRedirect("Index.jsp");
			}else {
				session.setAttribute("errorMsg", "Invalid User");
				resp.sendRedirect("user_login.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
}
}
