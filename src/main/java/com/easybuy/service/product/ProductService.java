package com.easybuy.service.product;

import com.easybuy.entity.Product;

import java.util.List;

public interface ProductService {
	
	/**
	 * 增加
	 * @param 
	 * @return
	 */
	public boolean addProduct(Product p);

	/**
	 * 删除
	 * @param 
	 * @return
	 */
	public boolean deleteProductById(int id);

	/**
	 * 修改
	 * @param 
	 * @return
	 */
	public boolean updateProduct(Product p);

	/**
	 * 根据id查询
	 * @param 
	 * @return
	 */
	public Product getProductById(Integer id);
	
	public int getProductCount(Integer categoryId,String proName);
	
	public int getTotalCount();
	
	public List<Product> getListProductByCategoryId(Integer categoryId,Integer startIndex,Integer pageSize);

	public List<Product> getListProduct(String proName,Integer categoryId,Integer startIndex,Integer pageSize);
}
