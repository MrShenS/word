package com.briup.Hospital.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.briup.Hospital.bean.Category;
import com.briup.Hospital.bean.Drug;
import com.briup.Hospital.bean.extend.DrugVM;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;

@Service
public interface DrugManageService {
	public List<Category> findCategories();
	public PageInfo<Category>findAllCategory(int curPage,int size);
	public Category findCategoryById(Integer id);
	public void deleteCategory(Integer id);
	public void saveOrUpdate(Category category);
	
	
	public PageInfo<DrugVM> findAllDrugWithCategory(int curPage,int size);
	DrugVM findDrugWithCategoryById(Integer id);
	public List<Drug> findAllDrugs();
	public void saveOrUpdateDrug(Drug drug);
	public void deleteDrug(Integer id);
	public Drug FindDrugById(Integer id);
	
	
	public void medicineGettingAndStorge(Integer id,int num,String operation)throws ServiceException;
}
