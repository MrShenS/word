package com.briup.Hospital.dao.extend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.briup.Hospital.bean.User;
import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.extend.UserPatientVM;
import com.briup.Hospital.bean.extend.UserVm;
@Repository
public interface UserPatientVMMapper {
	public List<UserPatientVM> selectUserpatientWithUserAndPatient();
	public UserPatientVM selectUserpatientWithUserAndPatientById(int id);
	public UserPatientVM selectUserpatientWithUserAndPatientByPatientId(Integer patientId);
	public List<UserPatientVM> selectUndealdPatient(String name);
	public List<UserPatientVM> selectdealdPatient(Integer id);
	public List<UserPatientVM> selectByPatientId(Integer id);
	public void updatePatientStatus(int id);
//	public void insertUserPatient(UserPatientVM vm);
	public List<UserPatientVM> select(int id);
	
}
