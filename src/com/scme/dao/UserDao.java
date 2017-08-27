package com.scme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.Request;

import com.scme.db.DBConnection;
import com.scme.pojo.Club;
import com.scme.pojo.User;

public class UserDao {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;

	//登录
	public boolean login(String account,String password){
		try {
			Connection conn=DBConnection.getconn();
			String sql="select * from user where account='"+account+"' and password='"+password+"'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	//查询所有用户信息
	public ArrayList<User> queryUser(String accound,String password){
		String sql="select * from user where account=? and password=?";
		ArrayList<User> list1=new ArrayList<User>();
		ArrayList list=new ArrayList();
		list.add(accound);
		list.add(password);
		ResultSet rs=DBConnection.query(sql, list.toArray());
		
		try {
			while(rs.next()){
				User user=new User();
				user.setId(rs.getString("id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));

				list1.add(user);
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
