package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.appointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

/**
 * Servlet implementation class Appointment
 */
@WebServlet("/addAppointment")
public class AppointmentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 int userid = Integer.parseInt(request.getParameter("userid"));
		 String fullname=request.getParameter("fullname");
		 String gender = request.getParameter("gender");
		 int age = Integer.parseInt(request.getParameter("age"));
		 String date = request.getParameter("date");
		 String email = request.getParameter("email");
		 String phone = request.getParameter("phone");
		 String disease = request.getParameter("disease");
		 String address = request.getParameter("address");
		 int doctorid = Integer.parseInt(request.getParameter("doctor"));
		 
		 Appointment ap = new Appointment(userid, fullname, gender, age, date, email, phone, disease, address, "Pending", doctorid);
		 appointmentDAO dao = new appointmentDAO(DBConnect.getConn());
		 HttpSession session = request.getSession();
		boolean b = dao.addAppointment(ap);
		if(b) {
			session.setAttribute("sucMsg", "Appointment Booked!");
			response.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Went Wrong!!!");
			response.sendRedirect("user_appointment.jsp");
		}
	}

}
