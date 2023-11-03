package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.specialistDAO;
import com.db.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class addSpecialist
 */
@WebServlet("/addSpecialist")

public class addSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSpecialist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		specialistDAO dao = new specialistDAO(DBConnect.getConn());
		boolean f = dao.addSpecialist(name);
		
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("sucMsg", "Specialist Added Successfully");
			response.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Specialist");
			response.sendRedirect("admin/index.jsp");
		}
		
	}

}
