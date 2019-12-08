package com.briup.Hospital.Service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.UserPatientService;
import com.briup.Hospital.bean.UserPatient;
import com.briup.Hospital.bean.UserPatientExample;
import com.briup.Hospital.bean.UserPatientExample.Criteria;
import com.briup.Hospital.bean.extend.UserPatientVM;
import com.briup.Hospital.dao.UserMapper;
import com.briup.Hospital.dao.UserPatientMapper;
import com.briup.Hospital.dao.extend.UserPatientVMMapper;

@Service
public class UserPatientServiceImpl implements UserPatientService {
 
	@Autowired 
	public UserPatientVMMapper userPatientVMMapper;
	@Autowired 
	public UserPatientMapper userPatientMapper;
	@Autowired 
	public UserMapper userMapper;
	
	@Override
	public List<UserPatientVM> findAllUserPatientVM() {
		// TODO Auto-generated method stub
		return userPatientVMMapper.selectUserpatientWithUserAndPatient();
	}

	@Override
	public UserPatientVM findUserPatientVMById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUserPatient(Integer id) {
		// TODO Auto-generated method stub
		userPatientMapper.deleteByPrimaryKey(id);		
	}

	@Override
	public void saveOrUpdateUserPatient(UserPatient userPatient) {
		// TODO Auto-generated method stub
    //userPatient.setStatus("已处理");
		UserPatient patient = userPatientMapper.selectByPrimaryKey(userPatient.getId());
		if(patient==null) {
			userPatientMapper.insertSelective(userPatient);
		}else {
			userPatientMapper.updateByPrimaryKeySelective(userPatient);
		}
		}

	@Override
	public String rechargeAndBackFee(Integer id, double price, String operation) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserPatientVM findUserPatientByPatientId(Integer patientId) {
		// TODO Auto-generated method stub
		List<UserPatientVM> list = userPatientVMMapper.select(patientId);
		return list.get(0);
	}

	@Override
	public List<UserPatientVM> findUndealdPatient(Integer id) {
		// TODO Auto-generated method stub
//		List<UserPatientVM> list = userPatientVMMapper.selectUndealdPatient(name);

	  List<UserPatientVM> vm = userPatientVMMapper.select(id);
	 System.out.println(vm);
		return vm;
	}

	@Override
	public List<UserPatientVM> finddealdPatient(Integer id) {
		// TODO Auto-generated method stub
		  List<UserPatientVM> vm = userPatientVMMapper.selectdealdPatient(id);
		  System.out.println(vm);
		  return vm;
	}

	@Override
	public void updatePatientStatus(int id) {
		// TODO Auto-generated method stub
	}

	@Override
	public UserPatientVM findUserPatientByPatientId_1(Integer patientId) {
		// TODO Auto-generated method stub
		System.out.println("service:"+patientId); 
		List<UserPatientVM> list = userPatientVMMapper.selectByPatientId(patientId);
		return list.get(0);
	}

	@Override
	public void saveUserPatient_ChargeMan(UserPatient userPatient) {
         userPatient.setDate(new Date());
         System.out.println(userPatient.getPatientId());
         UserPatientExample userPatientExample = new UserPatientExample();
         userPatientExample.createCriteria().andPatientIdEqualTo(userPatient.getPatientId());
         List<UserPatient> list = userPatientMapper.selectByExample(userPatientExample);
//         UserPatient key = list.get(0);
         //         UserPatient key = userPatientMapper.selectByPrimaryKey(userPatient.getId());
         System.out.println(list.size());
         if(list.size()==0) {
        	 userPatientMapper.insertSelective(userPatient);
         }else {
        	 userPatientMapper.updateByPrimaryKeySelective(userPatient);
         }
	}

	@Override
	public void updateUserPatient_Technician(UserPatient userPatient) {
		// TODO Auto-generated method stub
		 userPatientMapper.insertSelective(userPatient);
		
	}

	@Override
	public void updateUndealdPatient(Integer id) {
		// TODO Auto-generated method stub
		UserPatient userPatient = userPatientMapper.selectByPrimaryKey(id);
		userPatient.setStatus("已处理");
		userPatientMapper.updateByPrimaryKeySelective(userPatient);
		
	}
}
