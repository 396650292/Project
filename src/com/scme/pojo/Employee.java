package com.scme.pojo;

/**
 * @author Think
 *应聘表实体类
 */
public class Employee {
	
	
	public Employee() {
		super();
	}
	String id;
	
	String name;
	String sex;
	String age;
	String birthday;
	String position;
	String telephone;
	String major;
	String work_experience;	
	String degree;//学历
	String school;
	String address;
	String regist_time;//登记时间
	String biography;//个人简介
	String luyong;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getWork_experience() {
		return work_experience;
	}
	public void setWork_experience(String work_experience) {
		this.work_experience = work_experience;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getLuyong() {
		return luyong;
	}
	public void setLuyong(String luyong) {
		this.luyong = luyong;
	}
	public Employee(String id, String name, String sex, String age,
			String birthday, String position, String telephone, String major,
			String work_experience, String degree, String school,
			String address, String regist_time, String biography, String luyong) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.birthday = birthday;
		this.position = position;
		this.telephone = telephone;
		this.major = major;
		this.work_experience = work_experience;
		this.degree = degree;
		this.school = school;
		this.address = address;
		this.regist_time = regist_time;
		this.biography = biography;
		this.luyong = luyong;
	}
}
