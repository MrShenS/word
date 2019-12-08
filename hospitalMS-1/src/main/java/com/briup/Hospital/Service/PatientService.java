package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.Patient;
import com.briup.Hospital.util.ServiceException;
@Service
public interface PatientService {
	public List<Patient> findAllPatients();
	public Patient findPatientById(Integer id);
	public void SaveOrUpdatePatient(Patient patient)throws ServiceException;
	public void deletePatient(Integer id);
}
