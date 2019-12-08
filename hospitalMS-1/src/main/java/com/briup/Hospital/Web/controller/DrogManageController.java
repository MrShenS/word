package com.briup.Hospital.Web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.Hospital.Service.DrugManageService;
import com.briup.Hospital.bean.Category;
import com.briup.Hospital.bean.Drug;
import com.briup.Hospital.bean.extend.DrugVM;
import com.briup.Hospital.util.ServiceException;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/drugManage")
public class DrogManageController {
   
	@Autowired
	public DrugManageService drugManageService;
	
	/***
	 * 药品管理
	 * @return
	 */
	@RequestMapping("/findDrugs")
	@ResponseBody
	public List<Drug> findDrugs() {
		List<Drug> list = drugManageService.findAllDrugs();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("/findAllDrugWithCategory/{id}")
	public String findAllCategory(HttpSession session,@PathVariable int id) {
		PageInfo<DrugVM> drugWithCategory = drugManageService.findAllDrugWithCategory(id, 4);
		session.setAttribute("drugInfo", drugWithCategory);
		return "DrugManage/drug";
	}
	
	
	@RequestMapping("/findCates")
	@ResponseBody
	public List<Category> findCategories(Drug drup) {
		System.out.println("进来了");
		return drugManageService.findCategories();
	}
	
	/**
	 * 修改药物
	 * @return
	 */
	@RequestMapping("/findDrugWithCategoryById")
	@ResponseBody
	public DrugVM findDrugWithCategoryById(int id) {
		return drugManageService.findDrugWithCategoryById(id);
	}
	
	/**
	 * 修改并保存药品
	 * @param drup
	 * @return
	 */
	@RequestMapping("/saveOrUpdateDrug")
	public String saveOrUpdateCategory(Drug drup) {
		drugManageService.saveOrUpdateDrug(drup);
		return "redirect:/drugManage/findAllDrugWithCategory/1";
	}
	
	/**
	 * 取药或入库   条件判断
 	 * @param drup
	 * @return
	 * @throws ServiceException 
	 */
	@RequestMapping("/medicineGettingAndStore")
	public String medicineGettingAndStore(String operation,int id,int num) throws ServiceException {
		System.out.println(id);	
		drugManageService.medicineGettingAndStorge(id, num, operation);
		System.out.println(num);
		return "redirect:/drugManage/findAllDrugWithCategory/1";
	}
	
	/**
	 * 删除
	 * @param operation
	 * @param id
	 * @param num
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/deleteDrug")
	public String deleteDrug(int id) throws ServiceException {
		drugManageService.deleteDrug(id);
		return "redirect:/drugManage/findAllDrugWithCategory/1";
	}
	/**
	 * 批量删除
	 * @param id
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/deleteDrugs")
	public String deleteDrugs(int[] ids) throws ServiceException {
		System.out.println(ids.toString());
		for (int id : ids) {
			System.out.println(id);
			drugManageService.deleteDrug(id);
		}
		return "redirect:/drugManage/findAllDrugWithCategory/1";
	}
	
	
	
	
	/**
	 *以下是  药品种类管理模块   的内容
	 */
	@RequestMapping("/findAllCategory/{id}")
	public String findAllCategory(@PathVariable int id,HttpSession session) {
	
		session.setAttribute("categoryInfo",drugManageService.findAllCategory(id, 4));
		return "DrugManage/category";
	}
	
	@RequestMapping("/saveOrUpdateCategory")
	public String saveOrUpdateCategory(Category category) {
		System.out.println("保存药瓶");
		System.out.println(category.toString());
		drugManageService.saveOrUpdate(category);
		return "redirect:/drugManage/findAllCategory/1";
	}
	
	@RequestMapping("/deleteCategorys")
	public String deleteCategorys(int[] ids) {
		for (int id : ids) {
			drugManageService.deleteCategory(id);
		}
		return "redirect:/drugManage/findAllCategory/1";
	}
	
	@RequestMapping("/deleteCategory")
	public String deleteCategory(int id) {
			drugManageService.deleteCategory(id);
		return "redirect:/drugManage/findAllCategory/1";
	}
	
	/**
	 * 修改前查询数据到弹窗中
	 */
	@RequestMapping("/findCategoryById")
	@ResponseBody
	public Category findCategoryById(int id) {
		return drugManageService.findCategoryById(id);
	}

}
