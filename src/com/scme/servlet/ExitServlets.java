package com.scme.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExitServlets extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset='utf-8'");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();

		pw.println("<script type='text/javascript'>alert('退出成功');</script>");
		response.sendRedirect("login.jsp");
		
		
	}

	
}
