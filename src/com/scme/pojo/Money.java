package com.scme.pojo;

public class Money {
	String no;
	public Money() {
		super();
	}
	public Money(String no, String name, String month, String basic_wage,
			String overtime_pay, String work_Age_pay, String attendance_pay,
			String absenteeism_pay, String premium, String net_pay) {
		super();
		this.no = no;
		this.name = name;
		this.month = month;
		this.basic_wage = basic_wage;
		this.overtime_pay = overtime_pay;
		this.work_Age_pay = work_Age_pay;
		this.attendance_pay = attendance_pay;
		this.absenteeism_pay = absenteeism_pay;
		this.premium = premium;
		this.net_pay = net_pay;
	}
	String name;
	String month;
	String basic_wage;//基本工资 
	String overtime_pay;//加班费
	String work_Age_pay;//工龄费
	String attendance_pay;//考勤费
	String absenteeism_pay;//旷工费 
	String premium;//保险费
	String net_pay;//实发工资
	
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getBasic_wage() {
		return basic_wage;
	}
	public void setBasic_wage(String basic_wage) {
		this.basic_wage = basic_wage;
	}
	public String getOvertime_pay() {
		return overtime_pay;
	}
	public void setOvertime_pay(String overtime_pay) {
		this.overtime_pay = overtime_pay;
	}
	public String getWork_Age_pay() {
		return work_Age_pay;
	}
	public void setWork_Age_pay(String work_Age_pay) {
		this.work_Age_pay = work_Age_pay;
	}
	public String getAttendance_pay() {
		return attendance_pay;
	}
	public void setAttendance_pay(String attendance_pay) {
		this.attendance_pay = attendance_pay;
	}
	public String getAbsenteeism_pay() {
		return absenteeism_pay;
	}
	public void setAbsenteeism_pay(String absenteeism_pay) {
		this.absenteeism_pay = absenteeism_pay;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public String getNet_pay() {
		return net_pay;
	}
	public void setNet_pay(String net_pay) {
		this.net_pay = net_pay;
	}
	
}
