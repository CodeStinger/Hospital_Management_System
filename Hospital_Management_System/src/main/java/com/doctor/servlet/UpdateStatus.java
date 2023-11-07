package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.appointmentDAO;
import com.db.DBConnect;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatus() {
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
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int did = Integer.parseInt(request.getParameter("did"));
			String comment = request.getParameter("comment");
			
			appointmentDAO dao = new appointmentDAO(DBConnect.getConn());
			boolean b =dao.updateCommentStatus(id, did, comment);
			
			HttpSession session = request.getSession();
			
			if(b) {
				session.setAttribute("sucMsg", "Comment Updated");
				response.sendRedirect("doctor/patient.jsp");
			}else {
				session.setAttribute("errorMsg", "Ohh!! Something Went Wrong");
				response.sendRedirect("doctor/patient.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
