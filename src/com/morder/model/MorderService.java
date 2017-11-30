package com.morder.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.orderlist.model.OrderListVO;



public class MorderService {
	MorderDAO_interface dao;
	
	public MorderService(){
//		dao =new MorderDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(MorderDAO_interface) context.getBean("morderDAO");
	}
	
	public void delete(String mord_no){
		dao.delete(mord_no);
	}
	
	public MorderVO getOneMorder(String mord_no){
		return dao.findByPrimarykey(mord_no);
	}
	
	public List<MorderVO> getAll(){
		return dao.getAll();
	}
	
	public void insertWithOrderList(MorderVO morderVO, List<OrderListVO> list){
		dao.insertWithOrderList(morderVO, list);
	}
	
	public List<MorderVO> getMordersByMemno(String mem_no){
		return dao.getMordersByMemno(mem_no);
	}
	
}
