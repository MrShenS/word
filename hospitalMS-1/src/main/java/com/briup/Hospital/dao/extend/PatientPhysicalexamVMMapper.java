package com.briup.Hospital.dao.extend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.briup.Hospital.bean.extend.PatientPhysicalexamVM;

@Mapper
public interface PatientPhysicalexamVMMapper {
	public List<PatientPhysicalexamVM>  selectPatientPhysicalexamByPatientId(Integer patientId);
}
