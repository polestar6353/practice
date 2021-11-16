package net.bitcamp.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitcamp.guest.GuestDAO;

/**
 * Servlet implementation class GuestDelete
 */
@WebServlet("/gDelete.camp")
public class GuestDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String ob = (String)session.getAttribute("naver");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		
		if(ob==null || ob=="" || ob.equals("")) {
			out.println("<script>");
			out.println("alert(\"삭제 권한이 없습니다. 로그인해주세요\");");
			out.println("setTimeout(location.href(\"login.jsp\"),2000);");
			out.println("</script>");
		}else {
		
		int code = Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();		
		dao.dbDelete(code);

		out.println("<script>");
		out.println("alert(\"성공적으로 삭제했습니다\");");
		out.println("location.href(\"guestList\");");
		out.println("</script>");

		}		
		//response.sendRedirect("guestList");
	}

}
