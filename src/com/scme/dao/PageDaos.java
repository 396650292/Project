package com.scme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.scme.db.DBConnection;
import com.scme.pojo.Club;
import com.scme.pojo.Employee;
import com.scme.pojo.Eward_punish;
import com.scme.pojo.Member;
import com.scme.pojo.Money;
import com.scme.pojo.Train;
import com.scme.pojo.User;

public class PageDaos {
	/*
	 *部门查询开始 
	 */
	//查询数据总数
	public int queryCount(){
		String sql="select count(*) from club";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	
	//分页查询
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Club> queryByPage(int startCount,int Count){
		String sql="select * from club limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Club> list=new ArrayList<Club>();

		try {
			while(rs.next()){
				Club club=new Club();
				club.setId(rs.getString("id"));
				club.setClub_name(rs.getString("club_name"));
				club.setClub_numbers(rs.getString("club_numbers"));
				club.setCreat_date(rs.getString("creat_date"));
				club.setClub_remarks(rs.getString("club_remarks"));
				list.add(club);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	
	
	
	

	/*
	 *员工管理
	 */
	//查询数据总数
	public int queryCount1(){
		String sql="select count(*) from members";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	
	//分页查询
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Member> queryByPage1(int startCount,int Count){
		String sql="select * from members limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Member> list=new ArrayList<Member>();

		try {
			while(rs.next()){
				Member member=new Member();
				member.setNo(rs.getString("no"));
				member.setName(rs.getString("name"));
				member.setSex(rs.getString("sex"));
				member.setAge(rs.getString("age"));
				member.setBirthday(rs.getString("birthday"));
				member.setIdCard(rs.getString("idCard"));
				member.setNation(rs.getString("nation"));
				member.setMarital_status(rs.getString("marital_status"));
				member.setPolitical_status(rs.getString("political_status"));
				member.setNative_place(rs.getString("native_place"));
				member.setTelphone(rs.getString("telphone"));
				member.setAddress(rs.getString("address"));
				member.setSchool(rs.getString("school"));
				member.setMajor(rs.getString("major"));
				member.setDegree(rs.getString("degree"));
				member.setPosts_time(rs.getString("posts_time"));
				member.setClub_name(rs.getString("club_name"));
				member.setPosition(rs.getString("position"));
				member.setRegistrant(rs.getString("registrant"));
				member.setRegist_time(rs.getString("regist_time"));
				member.setRemarks(rs.getString("remarks"));
				member.setBiography(rs.getString("biography"));		
				
				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
		//按部门查询
		public int queryCountByClub(String club_name){
			String sql="select count(*) from members where club_name=?";
			DBConnection db=new DBConnection();
			ArrayList list=new ArrayList();
			list.add(club_name);
			ResultSet rs=db.query(sql,list.toArray());
			try {
				if(rs.next()){
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close(null, rs, null);
				
			}
			
			return -1;
		}
		//按部门查询
		public ArrayList<Member> queryByPageByClub(int startCount,int Count,String club){
			String sql="select * from members where club_name=? limit ?,?";
			DBConnection db=new DBConnection();
			ArrayList paraList=new ArrayList();
			paraList.add(club);
			paraList.add(startCount);
			paraList.add(Count);

			ResultSet rs=db.query(sql, paraList.toArray());
			ArrayList<Member> list=new ArrayList<Member>();

			try {
				while(rs.next()){
					Member member=new Member();
					member.setNo(rs.getString("no"));
					member.setName(rs.getString("name"));
					member.setSex(rs.getString("sex"));
					member.setAge(rs.getString("age"));
					member.setBirthday(rs.getString("birthday"));
					member.setIdCard(rs.getString("idCard"));
					member.setNation(rs.getString("nation"));
					member.setMarital_status(rs.getString("marital_status"));
					member.setPolitical_status(rs.getString("political_status"));
					member.setNative_place(rs.getString("native_place"));
					member.setTelphone(rs.getString("telphone"));
					member.setAddress(rs.getString("address"));
					member.setSchool(rs.getString("school"));
					member.setMajor(rs.getString("major"));
					member.setDegree(rs.getString("degree"));
					member.setPosts_time(rs.getString("posts_time"));
					member.setClub_name(rs.getString("club_name"));
					member.setPosition(rs.getString("position"));
					member.setRegistrant(rs.getString("registrant"));
					member.setRegist_time(rs.getString("regist_time"));
					member.setRemarks(rs.getString("remarks"));
					member.setBiography(rs.getString("biography"));		
					
					list.add(member);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close(null, rs, null);
				
			}
			return list;
		}
		public ArrayList<Member> queryAllMember(String no){
			String sql="select * from members where no=?";
			DBConnection db=new DBConnection();
			List list1=new ArrayList();
			list1.add(no);
			ResultSet rs=db.query(sql, list1.toArray());
			ArrayList<Member> list=new ArrayList<Member>();

			try {
				if(rs.next()){
					Member member=new Member();
					member.setNo(rs.getString("no"));
					member.setName(rs.getString("name"));
					member.setSex(rs.getString("sex"));
					member.setAge(rs.getString("age"));
					member.setBirthday(rs.getString("birthday"));
					member.setIdCard(rs.getString("idCard"));
					member.setNation(rs.getString("nation"));
					member.setMarital_status(rs.getString("marital_status"));
					member.setPolitical_status(rs.getString("political_status"));
					member.setNative_place(rs.getString("native_place"));
					member.setTelphone(rs.getString("telphone"));
					member.setAddress(rs.getString("address"));
					member.setSchool(rs.getString("school"));
					member.setMajor(rs.getString("major"));
					member.setDegree(rs.getString("degree"));
					member.setPosts_time(rs.getString("posts_time"));
					member.setClub_name(rs.getString("club_name"));
					member.setPosition(rs.getString("position"));
					member.setRegistrant(rs.getString("registrant"));
					member.setRegist_time(rs.getString("regist_time"));
					member.setRemarks(rs.getString("remarks"));
					member.setBiography(rs.getString("biography"));		
					
					list.add(member);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close(null, rs, null);
				
			}
			return list;
		}
	//招聘管理
	//分页查询
	public int queryCount2(){
		String sql="select count(*) from employee";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	public int queryCount2Byly(String ly){
		String sql="select count(*) from employee where luyong=?";
		DBConnection db=new DBConnection();
		List list =new ArrayList();
		list.add(ly);
		ResultSet rs=db.query(sql,list.toArray());
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	
	//分页查询     招聘管理
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Employee> queryByPage2(int startCount,int Count){
		String sql="select * from employee limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Employee> list=new ArrayList<Employee>();

		try {
			while(rs.next()){
				Employee employee=new Employee();
				employee.setId(rs.getString("id"));
				employee.setName(rs.getString("name"));
				employee.setSex(rs.getString("sex"));
				employee.setAge(rs.getString("age"));				
				employee.setBirthday(rs.getString("birthday"));				
				employee.setPosition(rs.getString("position"));				
				employee.setMajor(rs.getString("major"));				
				employee.setWork_experience(rs.getString("work_experience"));
				employee.setDegree(rs.getString("degree"));
				employee.setSchool(rs.getString("school"));
				employee.setAddress(rs.getString("address"));
				employee.setRegist_time(rs.getString("regist_time"));
				employee.setBiography(rs.getString("biography"));
				employee.setLuyong(rs.getString("luyong"));
				list.add(employee);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	
	public ArrayList<Employee> queryByly(String ly,int startCount,int Count){
		String sql="select * from employee where luyong=? limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(ly);
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Employee> list=new ArrayList<Employee>();

		try {
			while(rs.next()){
				Employee employee=new Employee();
				employee.setId(rs.getString("id"));
				employee.setName(rs.getString("name"));
				employee.setSex(rs.getString("sex"));
				employee.setAge(rs.getString("age"));				
				employee.setBirthday(rs.getString("birthday"));				
				employee.setPosition(rs.getString("position"));				
				employee.setMajor(rs.getString("major"));				
				employee.setWork_experience(rs.getString("work_experience"));
				employee.setDegree(rs.getString("degree"));
				employee.setSchool(rs.getString("school"));
				employee.setAddress(rs.getString("address"));
				employee.setRegist_time(rs.getString("regist_time"));
				employee.setBiography(rs.getString("biography"));
				employee.setLuyong(rs.getString("luyong"));
				list.add(employee);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	/*
	 *培训管理
	 */
	//查询数据总数
	public int queryCount3(){
		String sql="select count(*) from train";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	
	//分页查询   培训管理
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Train> queryByPage3(int startCount,int Count){
		String sql="select * from train limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Train> list=new ArrayList<Train>();

		try {
			while(rs.next()){
				Train train=new Train();
				train.setId(rs.getString("id"));
				train.setTrainer(rs.getString("trainer"));
				train.setTrain_theme(rs.getString("train_theme"));
				train.setTrain_aim(rs.getString("train_aim"));
				train.setTrain_time(rs.getString("train_time"));
				train.setTrain_address(rs.getString("train_address"));
				train.setAttendee(rs.getString("attendee"));
				train.setTrain_remarks(rs.getString("train_remarks"));
				list.add(train);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	
	/*
	 *奖惩管理
	 */
	//查询数据总数
	public int queryCount4(){
		String sql="select count(*) from eward_punish";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	public int queryCount4Byjc(String type){
		String sql="select count(*) from eward_punish where type=?";
		DBConnection db=new DBConnection();
		List list=new ArrayList();
		list.add(type);
		ResultSet rs=db.query(sql,list.toArray());
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	//分页查询奖惩管理
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Eward_punish> queryByPage4(int startCount,int Count){
		String sql="select * from eward_punish limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Eward_punish> list=new ArrayList<Eward_punish>();

		try {
			while(rs.next()){
				Eward_punish cj=new Eward_punish();
				cj.setId(rs.getString("id"));
				cj.setTheme(rs.getString("theme"));
				cj.setType(rs.getString("type"));
				cj.setSum(rs.getString("sum"));
				cj.setDate(rs.getString("date"));
				cj.setReason(rs.getString("reason"));
			
				list.add(cj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	
	public ArrayList<Eward_punish> queryByPage4Byjc(String type,int startCount,int Count){
		String sql="select * from eward_punish where type=? limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(type);
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Eward_punish> list=new ArrayList<Eward_punish>();

		try {
			while(rs.next()){
				Eward_punish cj=new Eward_punish();
				cj.setId(rs.getString("id"));
				cj.setTheme(rs.getString("theme"));
				cj.setType(rs.getString("type"));
				cj.setSum(rs.getString("sum"));
				cj.setDate(rs.getString("date"));
				cj.setReason(rs.getString("reason"));
			
				list.add(cj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		return list;
	}
	
	
	/*
	 *薪资管理
	 */
	//查询数据总数
	public int queryCount5(){
		String sql="select count(*) from money ";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	public int queryCount5BynameOrMonth(String name,String month){
		String sql="select count(*) from money where name ='"+name+"' and month='"+month+"';";
		DBConnection db=new DBConnection();
		System.out.println("name"+name);
		System.out.println("month"+month);
		try {
			Connection conn=DBConnection.getconn();
			PreparedStatement ps=conn.prepareStatement(sql);
			System.out.println(sql);
			System.out.println(ps.toString());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close(null, rs, null);
			
		}
		
		return -1;
	}
	
	//分页查询   薪资管理
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<Money> queryByPage5(int startCount,int Count){
		String sql="select * from money limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Money> list=new ArrayList<Money>();

		try {
			while(rs.next()){
				Money m=new Money();
				m.setNo(rs.getString("no"));
				m.setName(rs.getString("name"));
				m.setMonth(rs.getString("month"));
				m.setBasic_wage(rs.getString("basic_wage"));
				m.setOvertime_pay(rs.getString("overtime_pay"));
				m.setWork_Age_pay(rs.getString("work_Age_pay"));
				m.setAttendance_pay(rs.getString("attendance_pay"));
				m.setAbsenteeism_pay(rs.getString("absenteeism_pay"));
				m.setPremium(rs.getString("premium"));
				m.setNet_pay(rs.getString("net_pay"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Money> queryByPageBy5(String name,String month,int startCount,int Count){
		String sql="select * from money where name ='"+name+"' and month='"+month+"' limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
	
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<Money> list=new ArrayList<Money>();

		try {
			while(rs.next()){
				Money m=new Money();
				m.setNo(rs.getString("no"));
				m.setName(rs.getString("name"));
				m.setMonth(rs.getString("month"));
				m.setBasic_wage(rs.getString("basic_wage"));
				m.setOvertime_pay(rs.getString("overtime_pay"));
				m.setWork_Age_pay(rs.getString("work_Age_pay"));
				m.setAttendance_pay(rs.getString("attendance_pay"));
				m.setAbsenteeism_pay(rs.getString("absenteeism_pay"));
				m.setPremium(rs.getString("premium"));
				m.setNet_pay(rs.getString("net_pay"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Money> queryAllMoney(){
		String sql="select * from money";
		DBConnection db=new DBConnection();

		ResultSet rs=db.query(sql, null);
		ArrayList<Money> list=new ArrayList<Money>();

		try {
			while(rs.next()){
				Money m=new Money();
				m.setNo(rs.getString("no"));
				m.setName(rs.getString("name"));
				m.setMonth(rs.getString("month"));
				m.setBasic_wage(rs.getString("basic_wage"));
				m.setOvertime_pay(rs.getString("overtime_pay"));
				m.setWork_Age_pay(rs.getString("work_Age_pay"));
				m.setAttendance_pay(rs.getString("attendance_pay"));
				m.setAbsenteeism_pay(rs.getString("absenteeism_pay"));
				m.setPremium(rs.getString("premium"));
				m.setNet_pay(rs.getString("net_pay"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//系统管理
	//分页查询
	public int queryCount6(){
		String sql="select count(*) from User";
		DBConnection db=new DBConnection();
		ResultSet rs=db.query(sql,null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	//分页查询
	//参数1：起始页面   参数2：每个页面数据行数
	public ArrayList<User> queryByPage6(int startCount,int Count){
		String sql="select * from User limit ?,?";
		DBConnection db=new DBConnection();
		ArrayList paraList=new ArrayList();
		paraList.add(startCount);
		paraList.add(Count);

		ResultSet rs=db.query(sql, paraList.toArray());
		ArrayList<User> list=new ArrayList<User>();

		try {
			while(rs.next()){
				User user=new User();
				user.setId(rs.getString("id"));
				user.setAccount(rs.getString("account"));
				
			
				list.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
