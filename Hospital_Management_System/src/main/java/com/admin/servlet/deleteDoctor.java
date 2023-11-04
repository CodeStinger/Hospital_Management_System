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

/**
 * Servlet implementation class deleteDoctor
 */
@WebServlet("/deleteDoctor")
public class deleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doctorDAO dao = new doctorDAO(DBConnect.getConn());
		
		boolean b = dao.deleteDoctor(Integer.parseInt(request.getParameter("id")));
		HttpSession session = request.getSession();
		if(b) {
			session.setAttribute("sucMsg", "Doctor Deleted Successfully");
			response.sendRedirect("admin/viewDoctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Changes");
			response.sendRedirect("admin/viewDoctor.jsp");
		}
	}

}
