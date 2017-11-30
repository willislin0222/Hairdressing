package com.product.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class ProductService {
	ProductDAO_interface dao;
	public ProductService(){
//		dao =new ProductDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(ProductDAO_interface) context.getBean("productDAO");
	}
	
	
	//給struct2用
	public void addProduct(ProductVO productVO) {
		dao.insert(productVO);
	}
			
	public void updateProduct(ProductVO productVO) {
		dao.update(productVO);
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
	
	public List<ProductVO> getProductsByStatus(){
		return dao.getProductsByStatus();
	}
}
