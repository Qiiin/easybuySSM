package com.easybuy.service.category;

import com.easybuy.entity.Category;
import com.easybuy.util.CategoryVo;

import java.util.List;

public interface CategoryService {

	/**
	 * 增加
	 * @param 
	 * @return
	 * @throws Exception 
	 */
	public boolean addCategory(Category c);

	/**
	 * 删除
	 * @param 
	 * @return
	 */
	public boolean deleteCategoryById(int id);

	/**
	 * 修改
	 * @param 
	 * @return
	 */
	public boolean updateCategory(Category c);
	
	/**
	 * 查询
	 * @return
	 */
	public List<Category> getListCategory(int startIndex,int pageSize);

	/**
	 * 根据id查询
	 * @param 
	 * @return
	 */
	public Category getCategoryById(int id);

	public int getTotalCount();

	public List<Category> getListCategoryByLevel(int level);
	
	public List<Category> getListCategoryByParentId(int parentId);

	public List<CategoryVo> getListAllCategory();
	
	
}
