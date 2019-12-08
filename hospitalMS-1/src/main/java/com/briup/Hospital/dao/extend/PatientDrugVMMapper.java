package com.briup.Hospital.dao.extend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.briup.Hospital.bean.PatientDrug;
import com.briup.Hospital.bean.extend.PatientDrugVM;

@Repository
public interface PatientDrugVMMapper {
	public List<PatientDrugVM> selectPatientDrugByPatientId(Integer patientId);
}
