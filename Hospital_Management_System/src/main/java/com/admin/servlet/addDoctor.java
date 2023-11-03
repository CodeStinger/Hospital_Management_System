package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.doctorDAO;
import com.db.DBConnect;
import com.entity.Doctor;

/**
 * Servlet implementation class addDoctor
 */
@WebServlet("/addDoctor")
public class addDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String dob = request.getParameter("dob");
		String qualification = request.getParameter("qualification");
		String specialization = request.getParameter("spec");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mob");
		String password = request.getParameter("password");
		
		Doctor d = new Doctor(fullname,dob,qualification,specialization,email,mobno,password);
		doctorDAO dao = new doctorDAO(DBConnect.getConn());
		
		boolean b = dao.registerDoctor(d);
		
		HttpSession session = request.getSession();
		if(b) {
			session.setAttribute("sucMsg", "Specialist Added Successfully");
			response.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Specialist");
			response.sendRedirect("admin/doctor.jsp");
		}
	}

}
