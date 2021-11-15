package net.bitcamp.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/guestInsert.do") //가짜이름
public class GuestInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서블릿문서를 실행하면 기본스타트 실행 문서는 doGet(1,2)방식
		doUser(request, response);
		System.out.println("GuestInser doGet방식");
	}//end


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
		System.out.println("GuestInser doPost방식");
	}//end
	
	
	//서블릿 익셉션, io익셉션은 무조건 있어야 한다.
	//public void doUser(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException -> 거의 기본형
	public void doUser(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

		response.setContentType("text/html;charset=UTF-8");
		//이걸 넣어줘야 한글이 깨지지 않는다.
		
		//out이라는 객체를 만든것이라 그냥 out.println만 쓰면 한글이 깨진다.
		PrintWriter out = response.getWriter();
		
		out.println("<h2>GuestInsert.java</h2>");//자바문장에 html태그기술
		out.println("<img src='images/aaa.gif'></img>");
		out.println("<img src='images/aaa.gif'></img>");
		out.println("<img src='images/aaa.gif'></img> <br>");
	}//end
	
	//<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
}//GuestInsert END
