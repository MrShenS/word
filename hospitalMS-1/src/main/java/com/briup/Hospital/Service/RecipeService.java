package com.briup.Hospital.Service;

import java.util.List;

import com.briup.Hospital.bean.PatientDrug;

public interface RecipeService {
	List<PatientDrug> findPatientDrugByPatientId(Integer patientId);
}
