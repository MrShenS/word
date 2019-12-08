package com.briup.Hospital.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.Hospital.Service.DrugManageService;
import com.briup.Hospital.bean.Category;
import com.briup.Hospital.bean.CategoryExample;
import com.briup.Hospital.bean.Drug;
import com.briup.Hospital.bean.DrugExample;
import com.briup.Hospital.bean.extend.DrugVM;
import com.briup.Hospital.dao.CategoryMapper;
import com.briup.Hospital.dao.DrugMapper;
import com.briup.Hospital.dao.extend.DrugMapperVM;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DrugManageServiceImpl implements DrugManageService {

	@Autowired
	private DrugMapper drupMapper;
	@Autowired
	private DrugMapperVM drugMapperVM;
	@Autowired
	private CategoryMapper cate;
	@Override
	public List<Category> findCategories() {
		// TODO Auto-generated method stub
		return cate.selectByExample(new CategoryExample());
	}
	
	@Override
	public PageInfo<Category> findAllCategory(int curPage, int size) {
		// TODO Auto-generated method stub
		PageHelper.startPage(curPage, size);
		return new PageInfo<>(cate.selectByExample(new CategoryExample()));
	}

	@Override
	public Category findCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return cate.selectByPrimaryKey(id);
	}

	@Override
	public void deleteCategory(Integer id) {
		// TODO Auto-generated method stub
		cate.deleteByPrimaryKey(id);
	}

	@Override
	public void saveOrUpdate(Category category) {
		// TODO Auto-generated method stub
		Category key = cate.selectByPrimaryKey(category.getId());
		if(key==null) {
			cate.insertSelective(category);
		}else {
			cate.updateByPrimaryKeySelective(category);
		}
		
	}

	@Override
	public PageInfo<DrugVM> findAllDrugWithCategory(int curPage, int size) {
		// TODO Auto-generated method stub
		PageHelper.startPage(curPage,size);
		return new PageInfo<>(drugMapperVM.findDrugWithCategory());
	}

	@Override
	public DrugVM findDrugWithCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return drugMapperVM.findDrugWithCategoryById(id);
	}

	@Override
	public List<Drug> findAllDrugs() {
		// TODO Auto-generated method stub
		List<Drug> list = drupMapper.selectByExample(new DrugExample());
		return list;
	}

	@Override
	public void saveOrUpdateDrug(Drug drug) {
		// TODO Auto-generated method stub
        Drug key = drupMapper.selectByPrimaryKey(drug.getId());
        System.out.println(key+"-------------------------------------");
		if(key!=null) {
			drupMapper.updateByPrimaryKeySelective(drug);
		}else {
			drupMapper.insertSelective(drug);
		}
	}

	@Override
	public void deleteDrug(Integer id) {
		// TODO Auto-generated method stub
		drupMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void medicineGettingAndStorge(Integer id, int num, String operation) throws ServiceException {
		// TODO Auto-generated method stub
		if(operation.equals("取药")) {
		   Drug drug = drupMapper.selectByPrimaryKey(id);
		   drug.setInventory(drug.getInventory()-num);
		   drupMapper.updateByPrimaryKeySelective(drug);
		}else if(operation.equals("入库")) {
			System.out.println("入库");
			Drug drug = drupMapper.selectByPrimaryKey(id);
			drug.setInventory(drug.getInventory()+num);
			drupMapper.updateByPrimaryKeySelective(drug);
		}
	}

	@Override
	public Drug FindDrugById(Integer id) {
		// TODO Auto-generated method stub
		DrugExample example = new DrugExample();
		example.createCriteria().andIdEqualTo(id);
		 List<Drug> list = drupMapper.selectByExample(example);
		return list.get(0);
	}
	
}
