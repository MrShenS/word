package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.PatientService;
import com.briup.Hospital.bean.Patient;
import com.briup.Hospital.bean.PatientExample;
import com.briup.Hospital.dao.PatientMapper;
import com.briup.Hospital.util.ServiceException;
@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientMapper  patientMapper;
	@Override
	public List<Patient> findAllPatients() {
		// TODO Auto-generated method stub
		return patientMapper.selectByExample(new PatientExample());
	}

	@Override
	public Patient findPatientById(Integer id) {
		// TODO Auto-generated method stub
		return patientMapper.selectByPrimaryKey(id);
	}

	@Override
	public void SaveOrUpdatePatient(Patient patient) throws ServiceException {
		// TODO Auto-generated method stub
		Patient key = patientMapper.selectByPrimaryKey(patient.getId());
		if(key==null) {
			patientMapper.insertSelective(patient);
		}else {
			patientMapper.updateByPrimaryKeySelective(patient);
		}
		
	}

	@Override
	public void deletePatient(Integer id) {
		// TODO Auto-generated method stub
		patientMapper.deleteByPrimaryKey(id);
		
	}

}
