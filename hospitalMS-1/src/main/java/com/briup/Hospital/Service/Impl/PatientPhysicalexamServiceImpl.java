package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.PatientPhysicalexamService;
import com.briup.Hospital.bean.PatientPhysicalexam;
import com.briup.Hospital.bean.extend.PatientPhysicalexamVM;
import com.briup.Hospital.dao.PatientPhysicalexamMapper;
import com.briup.Hospital.dao.PhysicalexamMapper;
import com.briup.Hospital.dao.extend.PatientPhysicalexamVMMapper;

@Service
public class PatientPhysicalexamServiceImpl implements PatientPhysicalexamService {
	@Autowired
	public PatientPhysicalexamMapper patientPhysicalexamMapper;
	@Autowired
	public PatientPhysicalexamVMMapper  patientPhysicalexamVMMapper;
	
	@Autowired
	public PhysicalexamMapper physicalexamMapper;

	@Override
	public List<PatientPhysicalexamVM> selectPatientPhysicalexamByPatientId(Integer patientId) {
		// TODO Auto-generated method stub
		return patientPhysicalexamVMMapper.selectPatientPhysicalexamByPatientId(patientId);
	}

	@Override
	public void savePatientPhysicalexam(PatientPhysicalexam pp) {
		// TODO Auto-generated method stub
		pp.setCost(physicalexamMapper.selectByPrimaryKey(pp.getPhysicalId()).getPrice());
        patientPhysicalexamMapper.insertSelective(pp);
	}

}
