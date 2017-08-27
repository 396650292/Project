package com.scme.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scme.dao.PageDaos;
import com.scme.db.DBConnection;
import com.scme.pojo.Employee;

public class lyServlets extends HttpServlet {
	
	PageDaos pagedao=new PageDaos();
	/**
	 *  
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}

	/**
	 * 
	 *
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=null;
		String flag=null;
		if(request.getParameter("flag")!=null){
			flag=request.getParameter("flag");
			if(flag.equals("update")){
				String sql="update employee set luyong='已录用'  where id=?";
				
				ArrayList list=new ArrayList();
				id=request.getParameter("id");
				list.add(id);
				DBConnection db=new DBConnection();
				int result=DBConnection.update(sql,list.toArray());		
					if(result>0){	
						//获取个人信息
						String sql1="select * from employee where id=?";
						ArrayList list1=new ArrayList();
						list1.add(id);
						ResultSet rs=db.query(sql1, list1.toArray());
						List<Employee> list2=new ArrayList<Employee>();
						try {
							while(rs.next()){
								Employee e=new Employee();
								e.setId(rs.getString(1));
								e.setName(rs.getString(2));
								e.setSex(rs.getString(3));
								e.setAge(rs.getString(4));
								e.setBirthday(rs.getString(5));
								e.setPosition(rs.getString(6));
								e.setMajor(rs.getString(7));
								e.setWork_experience(rs.getString(8));
								e.setDegree(rs.getString(9));
								e.setTelephone(rs.getString(10));
								e.setSchool(rs.getString(11));
								e.setAddress(rs.getString(12));
								e.setRegist_time(rs.getString(13));
								e.setBiography(rs.getString(14));
								e.setLuyong(rs.getString(15));
								list2.add(e);
							}
							request.setAttribute("list", list2);
							request.getRequestDispatcher("Members_add.jsp").forward(request, response);		  	 

						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}else{
		  	 			System.out.println("录用失败");
		  	 		}
	
			} 
			
		}
				
	}

	/**
	 * 
	 */

}
