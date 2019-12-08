package com.briup.Hospital.Service;

import java.util.List;

import com.briup.Hospital.bean.PatientPhysicalexam;
import com.briup.Hospital.bean.extend.PatientPhysicalexamVM;

public interface PatientPhysicalexamService {
	public List<PatientPhysicalexamVM> selectPatientPhysicalexamByPatientId(Integer patientId);
	public void savePatientPhysicalexam(PatientPhysicalexam pp);
}
