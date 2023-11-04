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
 * Servlet implementation class updateDoctor
 */
@WebServlet("/updateDoctor")
public class updateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDoctor() {
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
		d.setId(Integer.parseInt(request.getParameter("id")));
		
		doctorDAO dao = new doctorDAO(DBConnect.getConn());
		
	boolean b = dao.updateDoctor(d);
		
		HttpSession session = request.getSession();
		if(b) {
			session.setAttribute("sucMsg", "Doctor Updated Successfully");
			response.sendRedirect("admin/viewDoctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Changes");
			response.sendRedirect("admin/viewDoctor.jsp");
		}
	}

}
