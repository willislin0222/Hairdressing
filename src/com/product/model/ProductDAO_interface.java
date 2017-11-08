package com.product.model;

import java.util.List;

import com.news.model.NewsVO;

public interface ProductDAO_interface {
	public void insert(ProductVO productVO);
	public void update(ProductVO productVO);
	public void delete(String pro_no);
	public ProductVO findByPrimaryKey(String pro_no);
	public List<ProductVO> getAll();
	
	//取得狀態為為1的最新商品清單
	public List<ProductVO> getProductsByStatus();
}
