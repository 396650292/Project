package com.scme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scme.db.DBConnection;

public class UpdateServlets extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
  		response.setContentType("html;charset=utf-8");
  		response.setCharacterEncoding("utf-8");
  		request.setCharacterEncoding("utf-8");
  		PrintWriter pw=response.getWriter();

  		String table=request.getParameter("table");


  		if(table.equals("club")){
  			String sql="update club set club_name=?,creat_date=?,club_numbers=?,club_remarks=? where id=?";
  		 	ArrayList list2=new ArrayList();
  		 	String name=request.getParameter("club_name");
  		 	String date=request.getParameter("creat_date");
  		 	String numbers=request.getParameter("club_numbers");
  		 	String remarks=request.getParameter("club_remarks");
  		 	String	id=request.getParameter("id");
  		 	
  		 	list2.add(name);
  		 	list2.add(date);
  		 	list2.add(numbers);
  		 	list2.add(remarks);
  		 	list2.add(id);		
  		 	
  	 		int result=DBConnection.update(sql,list2.toArray());
  	 		System.out.println(result);
  	 		if(result>0){
  	 			request.getRequestDispatcher("club_query.jsp").forward(request, response); 	
  	 		}else{
  	 			System.out.println("修改错误");
  	 		}
  			
  		}else if(table.equals("members")){
  			
  			String sql="update members set name=?,sex=?,age=?,birthday=?,idCard=?,nation=?,marital_status=?,political_status=?,native_place=?,telphone=?,address=?,school=?," +
  					"major=?,degree=?,posts_time=?,club_name=?,position=?,registrant=?,regist_time=?,remarks=?,biography=? where no=?";
  		 	ArrayList list2=new ArrayList();
  		 	String name=request.getParameter("name");
  		 	String sex=request.getParameter("sex");
  		 	String age=request.getParameter("age");
  		 	String birthday=request.getParameter("birthday");
  		 	String idCard=request.getParameter("idCard");
  		 	String nation=request.getParameter("nation");
  		 	String marital_status=request.getParameter("marital_status");
  		 	String political_status=request.getParameter("political_status");
  		 	String native_place=request.getParameter("native_place");
  		 	String telphone=request.getParameter("telphone");
  		 	String address=request.getParameter("address");
  		 	String school=request.getParameter("school");
  		 	String major=request.getParameter("major");
  		 	String degree=request.getParameter("degree");
  		 	String posts_time=request.getParameter("posts_time");
  		 	String club_name=request.getParameter("club_name");
  		 	String position=request.getParameter("position");
  		 	String registrant=request.getParameter("registrant");
  		 	String regist_time=request.getParameter("regist_time");
  		 	String remarks=request.getParameter("remarks");
  			String biography=request.getParameter("biography");
  		 	String	no=request.getParameter("no");
  		 	
  		 	list2.add(name);
  		 	list2.add(sex);
  		 	list2.add(age);
  		 	list2.add(birthday);
  		 	list2.add(idCard);	
  		 	list2.add(nation);
  		 	list2.add(marital_status);
  		 	list2.add(political_status);
  		 	list2.add(native_place);
  		 	list2.add(telphone);
  		 	list2.add(address);
  		 	list2.add(school);
  		 	list2.add(major);
  		 	list2.add(degree);
  		 	list2.add(posts_time);
  		 	list2.add(club_name);
  		 	list2.add(position);
  		 	list2.add(registrant);
  		 	list2.add(regist_time);
  		 	list2.add(remarks);
  		 	list2.add(biography);
  		 	list2.add(no);
  		 	
  	 		int result=DBConnection.update(sql,list2.toArray());
  	 		System.out.println(result);
  	 		if(result>0){
  	 			request.getRequestDispatcher("Members_query.jsp").forward(request, response); 	
  	 		}else{
  	 			System.out.println("修改错误");
  	 		}
  			
  		}else if(table.equals("user")){
  			ArrayList list2=new ArrayList();
    		  String name=request.getParameter("account");
    		  String password1=request.getParameter("password1"); 
    		  String password2=request.getParameter("password2"); 
    		  String rank=request.getParameter("rank");
    				
    		  if(password1.equals(password2)){
      		    String sql1="update user set password=?,rank=? where account=?";
        		 	list2.add(password2);
        		 	list2.add(rank);
      		    	list2.add(name);


        	 		int result=DBConnection.update(sql1,list2.toArray());
        	 		System.out.println(result);
        	 		if(result>0){
        	 			request.getRequestDispatcher("user_query.jsp").forward(request, response); 	
        	 		}else{
        	 			System.out.println("插入失败");
        	 			request.getRequestDispatcher("user_query.jsp").forward(request, response); 	
        	 		}	
    		  }else{
    			pw.println("<script type='text/javascript'>alert('两次密码不一致');history.back();</script>");
    			pw.close();


    		  }
    		 	
  		}
	}

}
