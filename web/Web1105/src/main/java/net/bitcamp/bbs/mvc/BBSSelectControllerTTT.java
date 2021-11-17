package net.bitcamp.bbs.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitcamp.bbs.BBSDAO;
import net.bitcamp.bbs.BBSDTO;


@WebServlet("/bbsSelect.bit")
public class BBSSelectController extends HttpServlet {  
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

		int startRow,endRow;
		String pnum;
		int pageNUM; 
		int pageCount, startPage, endPage , tmp ; 
		   
		//�˻����� ����
		String skey="", sval="";
		String returnpage; //http://localhost:8080/Web1105/bbsSelect.bit?pageNum=2&keyfield=title&keyword=p
		skey = request.getParameter("keyfield"); //�˻�Ű=�ʵ�  name
		sval = request.getParameter("keyword");  //�˻���Ű����  b
		if(skey==null || sval==null || skey=="" || sval=="" || skey.equals("")) {
			skey="title";
			sval="";
		}
		
		returnpage = "&keyfield="+skey+"&keyword="+sval; 
		
		pnum = request.getParameter("pageNum"); //<a href="bbsSelect.bit?pageNum=${i}">[${i}]</a>
		if(pnum=="" || pnum==null || pnum.equals("")) { pnum="1"; }
		pageNUM = Integer.parseInt(pnum);
		
		startRow = ((pageNUM-1)*10) + 1 ; //241
		endRow = pageNUM*10; //250
		
		BBSDAO dao = new BBSDAO();
		BBSDTO dto = new BBSDTO();

		int GGtotal = dao.dbCountAll(); //��ü�����Ͱ���
		int GStotal = dao.dbCountAllSearch(skey, sval); //�˻��ʵ�, �˻���
		
		if(GStotal%10==0){ pageCount = GStotal/10; }
		else { pageCount = (GStotal/10)+1; }
		
		tmp = (pageNUM-1)%10 ;
		startPage = pageNUM - tmp;
		endPage = startPage + 9 ;
		if(endPage>pageCount) { endPage = pageCount ; }
		
		//ArrayList<BBSDTO>  LG = dao.dbSelectAll(startRow, endRow) ;
		ArrayList<BBSDTO>  LG = dao.dbSelectAll(startRow, endRow, skey, sval) ;
		request.setAttribute("LG", LG);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("GGtotal", GGtotal); //���Ǿ��� ��絥����
		request.setAttribute("GStotal", GStotal); //�˻��ʵ� Ű����
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("returnpage", returnpage) ;//�˻��� ����¡���� �ʿ�  
		
		RequestDispatcher dis = request.getRequestDispatcher("bbsList.jsp");
		dis.forward(request, response);
	}//end
}//class END













