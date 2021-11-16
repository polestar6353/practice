package net.bitcamp.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitcamp.guest.GuestDAO;
import net.bitcamp.guest.GuestDTO;


@WebServlet("/guestInsert.do") //��¥�̸�
public class GuestInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���������� �����ϸ� �⺻��ŸƮ ���� ������ doGet(1,2)���
		doUser(request, response);
		System.out.println("GuestInser doGet���");
	}//end


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
		System.out.println("GuestInser doPost���");
	}//end
	
	
	//���� �ͼ���, io�ͼ����� ������ �־�� �Ѵ�.
	//public void doUser(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException -> ���� �⺻��
	public void doUser(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

		response.setContentType("text/html;charset=UTF-8");
		//�̰� �־���� �ѱ��� ������ �ʴ´�
		
		//out�̶�� ��ü�� ������̶� �׳� out.println�� ���� �ѱ��� ������.
		PrintWriter out = response.getWriter();
		
		out.println("<h2>GuestInsert.java�������� �ǽ� </h2>");  
		out.println("<img src='images/a1.png'></img> <br>");
	
		int dcode =  Integer.parseInt(request.getParameter("code"));
		String dtitle =  request.getParameter("title");
		int dpay =  Integer.parseInt(request.getParameter("pay"));
		String demail =  request.getParameter("email");
		System.out.println(dcode +" " + dtitle +" " + dpay + " " + demail);
		
		GuestDTO dto = new GuestDTO();
		GuestDAO dao = new GuestDAO();
		
		dao.dbInsert(dcode, dtitle, dpay, demail);
		System.out.println("GuestInsert��Ʈ�� guest���̺� ���强���߽��ϴ� ");
		
		response.sendRedirect("guestList");//���强���� �������� ���� 
	}//end
	
	//<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
}//GuestInsert END
