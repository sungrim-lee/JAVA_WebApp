package com.coderby.hr.model;

import java.sql.Date;

public class MemberVO {
	private String phoneNumber; // phone_number
	private String address; //address 
	private String name;
	private String grade; //basic silver gold
	private Date birthDay;
	private double point;
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	@Override
	public String toString() {
		return "MemberVO [point="+point+"phoneNumber=" + phoneNumber + ", address=" + address + ", name=" + name + ", grade=" + grade
				+ ", birthDay=" + birthDay + "]";
	}
	public double getPoint() {
		return point;
	}
	public void setPoint(double d) {
		this.point = d;
	}
	
}
