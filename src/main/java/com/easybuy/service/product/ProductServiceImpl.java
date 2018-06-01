package com.easybuy.service.product;

import com.easybuy.dao.product.ProductMapper;
import com.easybuy.entity.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	private List<Product> list=new ArrayList();
	boolean flag=false;
	private Logger log=Logger.getLogger(ProductServiceImpl.class);

	@Autowired(required=false)
	private ProductMapper productMapper=null;
	
	public boolean addProduct(Product p) {
		try {
			int num=productMapper.addProduct(p);
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			log.error(e);
		}
		return flag;
	}
	
	public boolean deleteProductById(int id) {
		try {
			int num=productMapper.deleteProductById(id);
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			log.error(e);
		}
		return flag;
	}
	
	public boolean updateProduct(Product p) {
		try {
			int num=productMapper.updateProduct(p);
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			log.error(e);
		}
		return flag;
	}
	
	@Transactional(readOnly=true)
	public List<Product> getListProduct(String proName,Integer categoryId,Integer startIndex,Integer pageSize) {
		try {
			list=productMapper.getListProduct(proName, categoryId, startIndex, pageSize);
		} catch (SQLException e) {
			log.error(e);
		}
		return list;
	}

	@Transactional(readOnly=true)
	public Product getProductById(Integer id) {
		Product p=null;
		try {
			p=productMapper.getProductById(id);
		} catch (SQLException e) {
			log.error(e);
		}
		return p;
	}
	
	@Transactional(readOnly=true)
	public int getProductCount(Integer categoryId,String proName) {
		int count=0;
		try {
			count=productMapper.getProductCount(categoryId,proName);
		} catch (Exception e) {
			log.error(e);
		}
		return count;
	}

	@Transactional(readOnly=true)
	public int getTotalCount() {
		int count=0;
		try {
			count=productMapper.getTotalCount();
		} catch (SQLException e) {
			log.error(e);
		}
		return count;
	}
	
	@Transactional(readOnly=true)
	public List<Product> getListProductByCategoryId(Integer categoryId,Integer startIndex, Integer pageSize) {
		try {
			list=productMapper.getListProductByCategoryId(categoryId,startIndex, pageSize);
		} catch (SQLException e) {
			log.error(e);
		}
		return list;
	}

	
}
