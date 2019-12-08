package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.DrugManageService;
import com.briup.Hospital.Service.PatientDrugService;
import com.briup.Hospital.bean.Drug;
import com.briup.Hospital.bean.PatientDrug;
import com.briup.Hospital.bean.extend.PatientDrugVM;
import com.briup.Hospital.dao.PatientDrugMapper;
import com.briup.Hospital.dao.extend.PatientDrugVMMapper;

@Service
public class PatientDrugServiceImpl implements PatientDrugService {

	@Autowired
	private PatientDrugMapper patientDrugMapper;
	
	@Autowired
	private DrugManageService drugManageService;
	
	@Autowired
	private PatientDrugVMMapper patientDrugVMMapper;
	@Override
	public void savePatientDrug(PatientDrug patientDrug) {
		// TODO Auto-generated method stub
		Drug drug = drugManageService.FindDrugById(patientDrug.getDrugId());
		patientDrug.setCost(patientDrug.getNum()*drug.getPrice());
		patientDrugMapper.insertSelective(patientDrug);
	}

	@Override
	public List<PatientDrugVM> findPatientDrugVMByPatientId(Integer id) {
		// TODO Auto-generated method stub
		List<PatientDrugVM> list = patientDrugVMMapper.selectPatientDrugByPatientId(id);
		return list;
	}

}
