package com.briup.Hospital.bean.extend;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.briup.Hospital.Web.converter.DateJsonSerializer;
import com.briup.Hospital.bean.Department;
import com.briup.Hospital.bean.Role;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class UserVm {
	 
   private Integer id;

   private String name;

   private String gender;
   
   @DateTimeFormat(pattern="yyyy-MM-dd")
   private Date birth;

   private String phone;

   private String address;

   private String card;

   private String education;

   private String position;

   private String professional;

   private String username;

   private String password;
   
   private Department department;
   
   private Role role;
   
   public UserVm() {}

public UserVm(Integer id, String name, String gender, Date birth, String phone, String address, String card,
		String education, String position, String professional, String username, String password) {
	super();
	this.id = id;
	this.name = name;
	this.gender = gender;
	this.birth = birth;
	this.phone = phone;
	this.address = address;
	this.card = card;
	this.education = education;
	this.position = position;
	this.professional = professional;
	this.username = username;
	this.password = password;
}


public Role getRole() {
	return role;
}

public void setRole(Role role) {
	this.role = role;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}
@JsonSerialize(using=DateJsonSerializer.class)
public Date getBirth() {
	return birth;
}

public void setBirth(Date birth) {
	this.birth = birth;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getCard() {
	return card;
}

public void setCard(String card) {
	this.card = card;
}

public String getEducation() {
	return education;
}

public void setEducation(String education) {
	this.education = education;
}

public String getPosition() {
	return position;
}

public void setPosition(String position) {
	this.position = position;
}

public String getProfessional() {
	return professional;
}

public void setProfessional(String professional) {
	this.professional = professional;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Department getDepartment() {
	return department;
}

public void setDepartment(Department department) {
	this.department = department;
}
   
   
}
