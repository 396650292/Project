package com.scme.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.scme.db.DBConnection;

public class DeleteServlets extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String table=request.getParameter("table");
		
		System.out.println(table);
		
    	Connection conn=DBConnection.getconn();
    	String sql=null;
    	String id=null;
    	String no=null;
    	int result=0;
    	if(table.equals("club")){
    		id=request.getParameter("id");
	    	sql="delete  from club where id=?";
			try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, id);
		    	result=ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	}else if(table.equals("members")){
    		no=request.getParameter("no");
    		String club_name=request.getParameter("club_name");

	    	sql="delete  from members where no=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, no);
		    	result=ps.executeUpdate();
		    	if(result>0){
		    		//修改部门表示人数
	  	  			String sql1="update club set club_numbers=club_numbers-1 where club_name=?";
	  	  		 	ArrayList list3=new ArrayList();
	  	  		 	list3.add(club_name);
	  	  	 		int result2=DBConnection.update(sql1,list3.toArray());
	  	  	 		
	  	  	 		if(result2>0){
	  	  	 			request.getRequestDispatcher("Members_query.jsp").forward(request, response); 	
	  	  	 		}else{
	  	  	 			System.out.println("修改部门人数失败");
	  	  	 		}	
		    		
		    	}
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}else if(table.equals("employee")){
    		no=request.getParameter("no");
	    	sql="delete  from employee where id=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, no);
		    	result=ps.executeUpdate();
		    	
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}else if(table.equals("train")){
    		id=request.getParameter("id");
	    	sql="delete  from train where id=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, id);
		    	result=ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}else if(table.equals("eward_punish")){
    		no=request.getParameter("id");
	    	sql="delete  from eward_punish where id=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, no);
		    	result=ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}else if(table.equals("money")){
    		no=request.getParameter("no");
    		String month=request.getParameter("month");
    		System.out.println(month);
	    	sql="delete  from money where no=? and month=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, no);
				ps.setString(2, month);
		    	result=ps.executeUpdate();
		    	System.out.println(ps.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}else if(table.equals("user")){
    		no=request.getParameter("id");
	    	sql="delete  from user where id=?";
	    	try {
		    	PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, no);
		    	result=ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

    	}
    	
    	System.out.println(result);
    
    	if(table.equals("club")&&result>0){
	    		response.sendRedirect("club_query.jsp");	
	    }else if(table.equals("employee")&&result>0){
    		response.sendRedirect("Employees_query.jsp");	
	    }else if(table.equals("train")&&result>0){
    		response.sendRedirect("trains_query.jsp");	
	    }else if(table.equals("eward_punish")&&result>0){
    		response.sendRedirect("jc_query.jsp");	
	    }else if(table.equals("money")&&result>0){
    		response.sendRedirect("money_query.jsp");	
	    }else if(table.equals("user")&&result>0){
    		response.sendRedirect("user_query.jsp");	
	    }
}
	


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}
}
