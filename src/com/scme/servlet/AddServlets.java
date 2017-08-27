package com.scme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.scme.db.DBConnection;


public class AddServlets extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
  		request.setCharacterEncoding("utf-8");
  		response.setCharacterEncoding("utf-8");

  		PrintWriter pw=response.getWriter();
  		
  		String table=request.getParameter("table");
  		if(table.equals("club")){
  			String sql="insert into club(club_name,creat_date,position,club_remarks) values(?,?,?,?)";
  		 	ArrayList list2=new ArrayList();
  		 	String name=request.getParameter("club_name");
  		 	String date=request.getParameter("creat_date"); 
  		 	if(date.contains("-")){
  		 		String position=request.getParameter("position");
  	  		 	String remarks=request.getParameter("club_remarks");
  	  		 	list2.add(name);
  	  		 	list2.add(date);
  	  		 	list2.add(position);
  	  		 	list2.add(remarks);
  	  		 	
  	  	 		int result=DBConnection.update(sql,list2.toArray());
  	  	 		System.out.println(result);
  	  	 		if(result>0){
  	  	 			request.getRequestDispatcher("club_query.jsp").forward(request, response); 	
  	  	 		}else{
  	  	 			System.out.println("插入失败");
  	  	 		}
  		 	}else{
  				pw.println("<script type='text/javascript'>alert('日期格式不正确，请重新输入！');history.back();</script>");
  		 		
  		 	}
  		 	
  			
  			
  		}else if(table.equals("members")){
  			//向员工表加入一条数据
  			String sql="insert into members(name,sex,age,birthday,idCard,nation,marital_status,political_status,native_place,telphone,address,school,major,degree,posts_time,club_name,position,registrant,regist_time,remarks,biography)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
  		 	
  		 	if(birthday.contains("-")&&posts_time.contains("-")){

  	  	 		int result=DBConnection.update(sql,list2.toArray());
  	  	 		System.out.println(result);
  	  	 		if(result>0){
  	  	 			//修改部门表示人数
  	  	  			String sql1="update club set club_numbers=club_numbers+1 where club_name=?";
  	  	  		 	ArrayList list3=new ArrayList();
  	  	  		 	list3.add(club_name);
  	  	  	 		int result2=DBConnection.update(sql1,list3.toArray());
  	  	  	 		System.out.println(result2);
  	  	  	 		if(result2>0){
  	  	  	 			request.getRequestDispatcher("Members_query.jsp").forward(request, response); 	
  	  	  	 		}else{
  	  	  	 			System.out.println("修改部门人数失败");
  	  	  	 		}	
  	  	  	 		 	
  	  	 		}else{
  	  	 			System.out.println("插入失败");
  	  	 		}	
  		 		
  		 	}else{
  				pw.println("<script type='text/javascript'>alert('日期格式不正确，请重新输入！');history.back();</script>");
  		 		
  		 	}
  		 	
  		}else if(table.equals("employee")){
  			String sql="insert into employee(name,sex,age,birthday,position,major,work_experience,degree,telphone,school,address,regist_time,biography)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
  		 	ArrayList list2=new ArrayList();
  			String name=request.getParameter("name");
  			String sex=request.getParameter("sex");
  			String age=request.getParameter("age");
  			String birthday=request.getParameter("birthday");
  			String position=request.getParameter("position");
  			String major=request.getParameter("major");
  			String work_experience=request.getParameter("work_experience");
  			String degree=request.getParameter("degree");
  			String telphone=request.getParameter("telphone");
  			String school=request.getParameter("school");
  			String province=request.getParameter("province");
  			String city=request.getParameter("city");
  			String address=province+"省"+city+"市(区)";
  			String regist_time=request.getParameter("regist_time");
  			String biography=request.getParameter("biography");
  		 	
  		 	list2.add(name);
  		 	list2.add(sex);
  		 	list2.add(age);
  		 	list2.add(birthday);
  		 	list2.add(position);
  		 	list2.add(major);
  		 	list2.add(work_experience);
  		 	list2.add(degree);
  		 	list2.add(telphone);
  		 	list2.add(school);
  		 	list2.add(address);
  		 	list2.add(regist_time);
  		 	list2.add(biography);
  		 	
  		 	if(birthday.contains("-")){
  		 		int result=DBConnection.update(sql,list2.toArray());
  	  	 		System.out.println(result);
  	  	 		if(result>0){
  	  	 			//界面跳转
  	  	 			request.getRequestDispatcher("Employees_query.jsp").forward(request, response); 	
  	  	 		}else{
  	  	 			System.out.println("插入失败");
  	  	 		}
  		 		
  		 	}else{
  				pw.println("<script type='text/javascript'>alert('日期格式不正确，请重新输入！');history.back();</script>");
  		 		
  		 	}
  		 	
  	 		
  	 		//
  		}else if(table.equals("train")){
  			String sql="insert into train(trainer,train_theme,train_aim,train_time,train_address,attendee,train_remarks)values(?,?,?,?,?,?,?)";
  		 	ArrayList list2=new ArrayList();
  			String trainer=request.getParameter("trainer");
  			String train_theme=request.getParameter("train_theme");
  			String train_aim=request.getParameter("train_aim");
  			String train_time=request.getParameter("train_time");
  			String train_address=request.getParameter("train_address");
  			String attendee=request.getParameter("attendee");
  			String train_remarks=request.getParameter("biography");

  		 	list2.add(trainer);
  		 	list2.add(train_theme);
  		 	list2.add(train_aim);
  		 	list2.add(train_time);
  		 	list2.add(train_address);
  		 	list2.add(attendee);
  		 	list2.add(train_remarks);
  		 	
  		 	if(train_time.contains("-")){
  		 		int result=DBConnection.update(sql,list2.toArray());
  	  	 		System.out.println(result);
  	  	 		if(result>0){
  	  	 			request.getRequestDispatcher("trains_query.jsp").forward(request, response); 	
  	  	 		}else{
  	  	 			System.out.println("插入失败");
  	  	 		}
  		 	}else{
  				pw.println("<script type='text/javascript'>alert('日期格式不正确，请重新输入！');history.back();</script>");
  		 	}
  	 			
  		}else if(table.equals("eward_punish")){
  			String sql="insert into eward_punish(theme,type,sum,date,reason)values(?,?,?,?,?)";
  		 	ArrayList list2=new ArrayList();
  			
  			String theme=request.getParameter("theme");
  			String type=request.getParameter("type");
  			String sum=request.getParameter("sum");
  			String date=request.getParameter("date");
  			String reason=request.getParameter("reason");
  	
  		 	list2.add(theme);
  		 	list2.add(type);
  		 	list2.add(sum);
  		 	list2.add(date);
  		 	list2.add(reason);
  	 		int result=DBConnection.update(sql,list2.toArray());
  	 		System.out.println(result);
  	 		if(result>0){
  	 				response.sendRedirect("jc_query.jsp");
  	 		}else{
  	 			System.out.println("插入失败");
  	 		}	
  		}else if(table.equals("money")){
  		 	ArrayList list2=new ArrayList();
  		  String name=request.getParameter("name");
  		  String nameStr[]= name.split(",");
  		  String no=nameStr[0];
  		  name=nameStr[1];

  		  String month=request.getParameter("month");
  			Integer jiben=Integer.parseInt(request.getParameter("basic_wage"));//基本工资 
  			String over_pay=request.getParameter("over_pay");//加班次数
		    Integer jiaban=(Integer.parseInt(request.getParameter("over_pay"))*20);//加班费
		    System.out.println("加班费："+jiaban);
			Integer gonglin=Integer.parseInt(request.getParameter("work_pay"));//工龄
			Integer gonglinfei=(Integer.parseInt(request.getParameter("work_pay"))*100);//工龄费
			Integer kaoqing=Integer.parseInt(request.getParameter("attendance_pay"));//考勤费
			Integer kuanggong=Integer.parseInt(request.getParameter("absenteeism_pay"));//旷工费 
		    Integer baoxian=Integer.parseInt(request.getParameter("premium"));//保险费
		    Integer shifa=jiben+jiaban+gonglinfei+kaoqing-kuanggong-baoxian;//实发工资
  				
  		    String sql="insert into  money(no,name,month,basic_wage,over_pay,overtime_pay,work_pay,work_age_pay,attendance_pay,absenteeism_pay,premium,net_pay) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
  	
  		 	list2.add(no);
  		 	list2.add(name);
  		 	list2.add(month);
  		 	list2.add(jiben);
  		 	list2.add(over_pay);
  		 	list2.add(jiaban);
  		 	list2.add(gonglin);
  		 	list2.add(gonglinfei);
  		 	list2.add(kaoqing);
  		 	list2.add(kuanggong);
  		 	list2.add(baoxian);
  		 	list2.add(shifa);

  		 	
  	 		int result=DBConnection.update(sql,list2.toArray());
  	 		System.out.println(result);
  	 		if(result>0){
  	 			request.getRequestDispatcher("money_query.jsp").forward(request, response); 	
  	 		}else{
  	 			System.out.println("插入失败");
  	 		}	
  		}else if(table.equals("user")){
  		  ArrayList list2=new ArrayList();
  		 String name=null;
  		 String password1=null;
  		 String password2=null;
  		 String rank=null;
  		 String safeCode=null;
  		 
  		 HttpSession session=request.getSession();
  		 String code=(String)session.getAttribute("safecode");

  		 if(request.getParameter("safecode")!=null){
  			 String code2=request.getParameter("safecode");
  			 if(code.equals(code2)){

  		  		  if(request.getParameter("account1")!=null&&request.getParameter("password1")!=null&&request.getParameter("rank")!=null){
  		  			   name=request.getParameter("account1");
  		  	  		   password1=request.getParameter("password1"); 
  		  	  		   password2=request.getParameter("password2"); 
  		  	  		   rank=request.getParameter("rank");
  		  		  }
  		  		 
  		  				
  		  		  if(password1.equals(password2)){
  		    		    String sql="insert into  user(account,password,rank) values(?,?,?)";
  		    		    list2.add(name);
  		      		 	list2.add(password2);
  		      		 	list2.add(rank);
  		      	 		int result=DBConnection.update(sql,list2.toArray());
  		      	 		System.out.println(result);
  		      	 		if(result>0){
  		      	 			request.getRequestDispatcher("user_query.jsp").forward(request, response); 	
  		      	 		}else{
  		      	 			System.out.println("插入失败");
  		      	 		}	
  		  		  }else{
  		  			pw.println("<script type='text/javascript'>alert('两次密码不一致');history.back();</script>");
  		  		  }
  				 
  			 }else {
  				 pw.println("<script type='text/javascript'>alert('验证码不正确');history.back();</script>");
  			 }
  		 }
  		 
  		 	
  	 		
  		}
  
	}
}
