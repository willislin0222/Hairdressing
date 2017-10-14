package com.product.model;

import java.sql.Date;
import java.util.List;

public class ProductService {
	ProductDAO_interface dao;
	public ProductService(){
		dao =new ProductDAO();
	}
	public ProductVO addProduct(String pro_name,String pro_desc,Integer pro_price,byte[] pro_image1,
			byte[] pro_image2,byte[] pro_image3,byte[] pro_image4,Integer pro_number){
		
		ProductVO productVO = new ProductVO();
		productVO.setPro_name(pro_name);
		productVO.setPro_desc(pro_desc);
		productVO.setPro_price(pro_price);
		productVO.setPro_image1(pro_image1);
		productVO.setPro_image2(pro_image2);
		productVO.setPro_image3(pro_image3);
		productVO.setPro_image4(pro_image4);
		productVO.setPro_number(pro_number);
		dao.insert(productVO);
		
		return productVO;
	}
	
	public ProductVO update(String pro_no,String pro_name,String pro_desc,Integer pro_price,byte[] pro_image1,
			byte[] pro_image2,byte[] pro_image3,byte[] pro_image4,Integer pro_number){
		
		ProductVO productVO = new ProductVO();
		productVO.setPro_no(pro_no);
		productVO.setPro_name(pro_name);
		productVO.setPro_desc(pro_desc);
		productVO.setPro_price(pro_price);
		productVO.setPro_image1(pro_image1);
		productVO.setPro_image2(pro_image2);
		productVO.setPro_image3(pro_image3);
		productVO.setPro_image4(pro_image4);
		productVO.setPro_number(pro_number);
		dao.insert(productVO);
		return productVO;
	}
	
	public void delete(String pro_no){
		dao.delete(pro_no);
	}
	
	public ProductVO getOneProduct(String pro_no){
		return dao.findByPrimaryKey(pro_no);
	}
	
	public List<ProductVO> getAll(){
		return dao.getAll();
	}
}
