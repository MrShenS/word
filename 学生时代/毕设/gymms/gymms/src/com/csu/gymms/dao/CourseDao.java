package com.csu.gymms.dao;

import java.util.ArrayList;

public interface CourseDao {
	
	ArrayList searchCourse(String coursename);
	
	ArrayList searchCourseName();
	
	public void insertCourse(Object obj);

}
