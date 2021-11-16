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


@WebServlet("/guestList")
public class GuestList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		doUser(request, response);
	}//end

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		doUser(request, response);
	}//end

	public void doUser(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("<h2>GuestList.java서블릿문서 실습 </h2>");  
		
				
		GuestDAO dao = new GuestDAO();	
		ArrayList<GuestDTO> LG = dao.dbSelectAll(); //모든데이터가져오는 함수
		int Gtotal = dao.dbCountAll();
	
		request.setAttribute("LG", LG);
		request.setAttribute("Gtotal", Gtotal);
		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response) ;
		
		//response.sendRedirect("guestList.jsp"); //자원 LG, Gtotal자원 못갖고 이동함
	}//end
}//GuestInsert END









