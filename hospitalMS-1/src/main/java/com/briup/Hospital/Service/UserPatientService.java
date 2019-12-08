package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.extend.UserPatientVM;

@Service
public interface UserPatientService {
	public List<UserPatientVM> findAllUserPatientVM();
	public UserPatientVM findUserPatientVMById(Integer id);
	public void deleteUserPatient(Integer id);
	public void saveOrUpdateUserPatient(UserPatient userPatient);
	public void saveUserPatient_ChargeMan(UserPatient userPatient);
	public void updateUserPatient_Technician(UserPatient userPatient);
	public String rechargeAndBackFee(Integer id,double price,String operation);
	public UserPatientVM findUserPatientByPatientId(Integer patientId);
	public UserPatientVM findUserPatientByPatientId_1(Integer patientId);
	public List<UserPatientVM> findUndealdPatient(Integer id);
	public List<UserPatientVM> finddealdPatient(Integer id);
	public void updatePatientStatus(int id);
	/***
	 * c处理病人
	 */
	public void updateUndealdPatient(Integer id);
}
