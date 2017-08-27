package com.scme.pojo;

public class Club {
	//部门管理
	public String id;  //ID
	public String position; //职位
	public String club_name; //部门名称
	public String creat_date; //创建时间
	public String club_numbers;//部门人数
	public String club_remarks;//部门备注
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getCreat_date() {
		return creat_date;
	}
	public void setCreat_date(String creat_date) {
		this.creat_date = creat_date;
	}
	public String getClub_numbers() {
		return club_numbers;
	}
	public void setClub_numbers(String club_numbers) {
		this.club_numbers = club_numbers;
	}
	public String getClub_remarks() {
		return club_remarks;
	}
	public void setClub_remarks(String club_remarks) {
		this.club_remarks = club_remarks;
	}
	
}
