package net.bitcamp.bbs.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitcamp.bbs.BBSDAO;
import net.bitcamp.bbs.BBSDTO;


@WebServlet("/bbsDetail.bit")
public class BBSDetailControllerTTT extends HttpServlet {  
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); //직접기술
		response.setContentType("text/html;charset=UTF-8"); //기존꺼복사한거
		PrintWriter out = response.getWriter();
		
		BBSDAO dao = new BBSDAO();
		int data = Integer.parseInt(request.getParameter("idx"));
		BBSDTO daum = dao.dbDetail(data);
		
		request.setAttribute("daum", daum);
		RequestDispatcher  dis = request.getRequestDispatcher("bbsDetail.jsp");
		dis.forward(request,response);
	}//end
}//class END









