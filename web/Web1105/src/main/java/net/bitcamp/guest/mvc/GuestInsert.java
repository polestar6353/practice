package net.bitcamp.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		//�̰� �־���� �ѱ��� ������ �ʴ´�.
		
		//out�̶�� ��ü�� ������̶� �׳� out.println�� ���� �ѱ��� ������.
		PrintWriter out = response.getWriter();
		
		out.println("<h2>GuestInsert.java</h2>");//�ڹٹ��忡 html�±ױ��
		out.println("<img src='images/aaa.gif'></img>");
		out.println("<img src='images/aaa.gif'></img>");
		out.println("<img src='images/aaa.gif'></img> <br>");
	}//end
	
	//<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
}//GuestInsert END
