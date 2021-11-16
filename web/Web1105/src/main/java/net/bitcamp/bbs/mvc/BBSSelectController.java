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
import net.bitcamp.guest.GuestDTO;


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
		int pageCount, startpage, endpage , tmp ; 
		   
		//�˻����� 4�� ����
		String sqry="";
		String skey="", sval="";
		String returnpage;  
		
		skey = request.getParameter("keyfield"); //�˻�Ű=�ʵ�  name
		sval = request.getParameter("keyword");  //�˻���Ű����  b
		if(skey=="" || sval=="" || skey==null || sval==null){
			skey="title";
			sval="";
		 }
		returnpage="&keyfield="+skey+"&keyword="+sval;
		sqry = " where " + skey +" like '%"+sval+"%' ";

		
		BBSDAO dao = new BBSDAO();
		BBSDTO dto = new BBSDTO();
		
		
		int GGtotal=dao.dbCountAll();
		int Gtotal=dao.dbCountKeyVal(skey,sval);
		
		pnum = request.getParameter("pageNum");  //[����][21][22][25����] ~ [29][30][����]
		if(pnum==null || pnum==""){ pnum="1"; }   
		pageNUM = Integer.parseInt(pnum);  //����25�� ����25�� ��ȯ
		 
		startRow = (pageNUM-1)*10 + 1;  //25-1*10+1 ==> 241
		endRow  = pageNUM*10 ;   //25*10 ==> 250

		if(Gtotal%10==0){ pageCount = Gtotal/10; }
		else{ pageCount = (Gtotal/10)+ 1; }  //32pageCount = 316/10+1 
		 
		tmp = (pageNUM-1)%10;   //25-1%10 ==> 4
		startpage=pageNUM-tmp;  //25-4 ==> 21
		endpage=startpage+9;    //21+9 ==> 30 
		if(endpage>pageCount){ endpage=pageCount ; } //[����][31][32] ����� �� 
		
		ArrayList<BBSDTO> KVsearch = dao.dbSelectKeyVal(sqry,startRow,endRow);
		
		out.println("<div align='center'>");
		out.println("<h2>BBSSelectController����</h2>");
		out.println("<img src='images/tulips.png'>");
		out.println("</div>");
		//HttpSession session = request.getSession();
		//RequestDispatcher  dis = null ;
		//response.sendRedirect( )
		//dis.forward(request,response)
		
		
		
		ArrayList<String> slist = new ArrayList<String>();
		
 	  	//����ǥ�� startpage>10
 	    if(startpage>10){
 	    	slist.add("<a href=bbsSelect.bit?pageNum="+(startpage-10)+"&"+returnpage+">[����]</a>");
 	    }
 	  	
 	    // [1] ~ [10]	 
 	    for(int i=startpage; i<=endpage; i++){
 	    	if(i==pageNUM){
 	    	  slist.add("<font style='font-size:26pt; color:red'>["+i+"]</font>");	
 	    	}else{
 		      slist.add("<a href=bbsSelect.bit?pageNum="+(i+returnpage)+">["+i+"]</a>");
 	    	}
 	    }
		 //����ǥ�� endpage<32
		 if(endpage<pageCount){
			 slist.add("<a href=bbsSelect.bit?pageNum="+(startpage+10)+"&"+returnpage+">[����]</a>");
		 }
		
		
		request.setAttribute("GGtotal", GGtotal);
		request.setAttribute("Gtotal", Gtotal);
		request.setAttribute("KVsearch", KVsearch);
		request.setAttribute("slist",slist);
		RequestDispatcher dis = request.getRequestDispatcher("bbsList.jsp");
		dis.forward(request, response) ;
	}//end
}//class END



