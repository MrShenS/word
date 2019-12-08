package com.briup.Hospital.dao.extend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.briup.Hospital.bean.extend.DrugVM;

@Mapper
public interface DrugMapperVM {
	List<DrugVM> findDrugWithCategory();
	DrugVM findDrugWithCategoryById(Integer id);
}
