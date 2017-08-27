package com.scme.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/project?Unicode=true&characterEncoding=Utf-8";
	private static final String USER="root";
	private static final String PASSWORD="scme";
	
	//连接数据库
	public static Connection getconn(){
		Connection conn =null;
		
		try {
			Class.forName(DRIVER);		
			conn=DriverManager.getConnection(URL,USER,PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn; 
		}
	//查询
	public static ResultSet query(String sql,Object[] params){
		PreparedStatement ps=null;
		ResultSet rs=null;
		Connection conn=null;
		try {
			conn=getconn();
			ps=conn.prepareStatement(sql);
			if(params!=null){
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			rs=ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return rs;
	}
	
	//增删改
	public static int update(String sql,Object[] params){
		PreparedStatement ps=null;
		Connection conn=null;
		int insuccess=0;
		
		try {
			conn=getconn();
			ps=conn.prepareStatement(sql);
			if(params!=null){
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
				insuccess=ps.executeUpdate();			
			}
			System.out.println(ps.toString());
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		return insuccess;
	}
	
	//关闭数据库
	public static void close(PreparedStatement ps,ResultSet rs,Connection conn){
		try {
			if(ps!=null){
				ps.close();
			}
			if(rs!=null){
				rs.close();
			}
			if(conn!=null&&!conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
