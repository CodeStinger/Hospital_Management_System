package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.doctorDAO;
import com.dao.userDAO;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

/**
 * Servlet implementation class doctorLogin
 */
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			doctorDAO dao = new doctorDAO(DBConnect.getConn());
			Doctor doctor= dao.login(email, password);
			
			if(doctor != null) {
				session.setAttribute("UserObj", doctor);
				response.sendRedirect("doctor/index.jsp");
			}else {
				session.setAttribute("errorMsg", "Invalid Doctor");
				response.sendRedirect("doctor_login.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
