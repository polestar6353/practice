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
public class BBSDetailController extends HttpServlet {  
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
		
		int Gsabun=Integer.parseInt(request.getParameter("idx"));
		
		BBSDAO dao = new BBSDAO();
		BBSDTO dto = new BBSDTO();
		
		BBSDTO detail = dao.dbDetail(Gsabun);
		dao.dbCountPlus(Gsabun);
		
		request.setAttribute("detail", detail);
		RequestDispatcher dis = request.getRequestDispatcher("bbsDetail.jsp");
		dis.forward(request, response) ;
		
		
		//HttpSession session = request.getSession();
		//RequestDispatcher  dis = null ;
		//response.sendRedirect( )
		//dis.forward(request,response)
	}//end
}//class END



