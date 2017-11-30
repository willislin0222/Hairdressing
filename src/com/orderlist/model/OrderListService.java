package com.orderlist.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.morder.model.MorderDAO_interface;
import com.morder.model.MorderVO;
import com.product.model.ProductVO;


public class OrderListService {
private OrderListDAO_interface dao;
	
	public OrderListService(){
//		dao =new OrderListDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(OrderListDAO_interface) context.getBean("orderlistDAO");
	}
	
	public OrderListVO addOrderList(String mord_no,String pro_no,Integer ordl_number){
		OrderListVO orderlistVO = new OrderListVO();
		
		MorderVO morderVO =new MorderVO();
		morderVO.setMord_no(mord_no);
		orderlistVO.setMorderVO(morderVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setPro_no(pro_no);
		orderlistVO.setProductVO(productVO);
		
		orderlistVO.setOrdl_number(ordl_number);
		dao.insert(orderlistVO);
		
		return orderlistVO;
	}
	
	public OrderListVO updateOrderList(String mord_no,String pro_no,Integer ordl_number){
		
		OrderListVO orderlistVO = new OrderListVO();

		MorderVO morderVO =new MorderVO();
		morderVO.setMord_no(mord_no);
		orderlistVO.setMorderVO(morderVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setPro_no(pro_no);
		orderlistVO.setProductVO(productVO);
		
		orderlistVO.setOrdl_number(ordl_number);
		dao.update(orderlistVO);
		
		return orderlistVO;
	}
	
	public void delete(String mord_no,String pro_no){
		dao.delete(mord_no,pro_no);
	}
	
	public OrderListVO getOneOrderList(String mord_no,String pro_no){
		return dao.findByPrimaryKey(mord_no, pro_no);
	}
	
	public List<OrderListVO> getAll(){
		return dao.getAll();
	}
	
	public void insert2 (OrderListVO orderListVO , Session oldsession){
		dao.insert2(orderListVO, oldsession);
	}
	
	public List<OrderListVO> getOrderListsByMordno(String mord_no){
		return dao.getOrderListsByMordno(mord_no);
	}
}
