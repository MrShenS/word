package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.PatientDrug;
import com.briup.Hospital.bean.extend.PatientDrugVM;

@Service
public interface PatientDrugService {
	
	public void savePatientDrug(PatientDrug patientDrug);
	public List<PatientDrugVM> findPatientDrugVMByPatientId(Integer id);
}
