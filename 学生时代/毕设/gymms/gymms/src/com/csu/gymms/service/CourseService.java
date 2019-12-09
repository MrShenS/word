package com.csu.gymms.service;

import java.util.ArrayList;

import com.csu.gymms.dao.impl.DaoFactory;

public class CourseService {
	
	public static ArrayList getCourse(String coursename){
		return new DaoFactory().createCourse().searchCourse(coursename);
	}
	
	public static ArrayList getCourseName(){
		return new DaoFactory().createCourse().searchCourseName();
	}
	
	public static void addCourse(Object obj){
		new DaoFactory().createCourse().insertCourse(obj);
	}

}
