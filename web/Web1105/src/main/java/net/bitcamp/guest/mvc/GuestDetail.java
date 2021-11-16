package net.bitcamp.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher; //2시 13분에 임포트 추가함
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitcamp.guest.GuestDAO;
import net.bitcamp.guest.GuestDTO;


@WebServlet("/gDetail.camp")
public class GuestDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		doUser(request, response);
	}//end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		doUser(request, response);
	}//end

	public void doUser(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); //한글지원
		PrintWriter out = response.getWriter();
		
		int data = Integer.parseInt(request.getParameter("idx"));
		System.out.println("GuestDetail.java서블릿문서 data = " +data);  
				
		GuestDAO dao = new GuestDAO();
		GuestDTO LG = dao.dbDetail(data);
		request.setAttribute("LG", LG);
		RequestDispatcher dis = request.getRequestDispatcher("guestDetail.jsp");
		dis.forward(request, response);
	}//end
}//GuestInsert END









