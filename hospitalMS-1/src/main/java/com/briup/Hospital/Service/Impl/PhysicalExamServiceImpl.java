package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.PhysicalExamService;
import com.briup.Hospital.bean.Physicalexam;
import com.briup.Hospital.bean.PhysicalexamExample;
import com.briup.Hospital.dao.PhysicalexamMapper;
@Service
public class PhysicalExamServiceImpl implements PhysicalExamService{

	
	@Autowired
	private PhysicalexamMapper physicalexamMapper;
	@Override
	public List<Physicalexam> findAllPhysicalexam() {
		// TODO Auto-generated method stub
		return physicalexamMapper.selectByExample(new PhysicalexamExample());
	}

	@Override
	public Physicalexam findPhysicalexamById(Integer id) {
		// TODO Auto-generated method stub
		
		return physicalexamMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deletePhysicalexam(Integer id) {
		// TODO Auto-generated method stub
		physicalexamMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void saveOrUpdatePhysicalexam(Physicalexam physicalexam) {
		Physicalexam key = physicalexamMapper.selectByPrimaryKey(physicalexam.getId());
		if(key==null) {
			physicalexamMapper.insertSelective(physicalexam);
		}else {
			physicalexamMapper.updateByPrimaryKeySelective(physicalexam);
		}
	}
   
	
	
}
