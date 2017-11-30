package com.product.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class ProductDAO implements ProductDAO_interface{

	private static final String GET_ALL_STMT="from " + ProductVO.class.getName() +" order by pro_createdate desc";	
	private static final String GET_PRODUCTS_BY_STATUS="from ProductVO where pro_status=1 order by pro_createdate desc";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public void insert(ProductVO productVO) {
		hibernateTemplate.saveOrUpdate(productVO);
		
	}

	@Override
	public void update(ProductVO productVO) {
		hibernateTemplate.update(productVO);
		
	}

	@Override
	public void delete(String pro_no) {
		ProductVO productVO = (ProductVO) hibernateTemplate.get(ProductVO.class, pro_no);
		hibernateTemplate.delete(productVO);
		
	}

	@Override
	public ProductVO findByPrimaryKey(String pro_no) {
		ProductVO productVO= (ProductVO) hibernateTemplate.get(ProductVO.class, pro_no);
		return productVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = null;
		list =(List<ProductVO>) hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

	@Override
	public List<ProductVO> getProductsByStatus() {
		List<ProductVO> list = null;
		list = (List<ProductVO>) hibernateTemplate.find(GET_PRODUCTS_BY_STATUS);
		
		return list;
	}

}
