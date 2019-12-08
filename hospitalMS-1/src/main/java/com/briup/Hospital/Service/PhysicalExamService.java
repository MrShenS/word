package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.Physicalexam;

@Service
public interface PhysicalExamService {
	public List<Physicalexam> findAllPhysicalexam();
	public Physicalexam findPhysicalexamById(Integer id);
	public void deletePhysicalexam(Integer id);
	public void saveOrUpdatePhysicalexam(Physicalexam physicalexam);
}
