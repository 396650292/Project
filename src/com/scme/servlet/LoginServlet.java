package com.scme.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scme.dao.UserDao;

public class LoginServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		dopost(request, response);
	}
	public void dopost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收表单提交的账号和密码
		request.setCharacterEncoding("UTF-8");
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String miandeng=request.getParameter("yu");
		System.out.println(miandeng);
		if(miandeng.equals("true")){
			//Cookie
			Cookie cookie1=new Cookie("account", account);
			Cookie cookie2=new Cookie("password", password);

			cookie1.setMaxAge(60);
			cookie2.setMaxAge(60);

			response.addCookie(cookie1);
			response.addCookie(cookie2);
			
			
		}
		
		UserDao dao=new UserDao();
		boolean isno=dao.login(account,password);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(!isno){
			out.println("<script type='text/javascript'>alert('对不起，账号和密码输入错误，请重新输入！');history.back();</script>");
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("account", account);
			response.sendRedirect("index.jsp");
		}
		
		
	}

	

}
