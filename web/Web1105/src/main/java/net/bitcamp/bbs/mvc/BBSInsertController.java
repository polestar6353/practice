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


@WebServlet("/bbsInsert.bit")
public class BBSInsertController extends HttpServlet {  
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); //�������
		response.setContentType("text/html;charset=UTF-8"); //�����������Ѱ�
		PrintWriter out = response.getWriter();
		
		BBSDAO dao = new BBSDAO();
		BBSDTO dto = new BBSDTO();
		try {
		dto.setSabun(Integer.parseInt(request.getParameter("sabun")));
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setPay(Integer.parseInt(request.getParameter("pay")));
		dto.setEmail(request.getParameter("email"));
		
		dao.dbInsert(dto);
		
		out.println("<script>");
		out.println("alert('���������� ��ϵǾ����ϴ�.')");
		out.println("setTimeout(\"location.href='bbsList.jsp'\",3000)");
		out.println("</script>");
		
		
		} catch(Exception e){
			out.println("<script>");
			out.println("alert('�߸����Է��� �ֽ��ϴ� �ٽ��ѹ� Ȯ�����ּ���')");
			out.println("location.href='bbsWrite.jsp'");
			out.println("</script>");
		}
		
		
		
		
		//HttpSession session = request.getSession();
		//RequestDispatcher  dis = null ;
		//response.sendRedirect( )
		//dis.forward(request,response)
	}//end
}//class END




