package com.offer.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class OfferService {
	
	private OfferDAO_interface dao;
	
	public OfferService(){
//		dao =new OfferDAO();
		//dao = new EmpHibernateDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(OfferDAO_interface) context.getBean("offerDAO");
	}
	
	//給struct2用
	public void addOffer(OfferVO offerVO) {
		dao.insert(offerVO);
	}
		
	public void updateOffer(OfferVO offerVO) {
		dao.update(offerVO);
	}
	
	public void delete(String off_no){
		dao.delete(off_no);
	}
	
	public OfferVO getOneOffer(String off_no){
		return dao.findByPrimaryKey(off_no);
	}
	
	public List<OfferVO> getAll(){
		return dao.getAll();
	}
	
	public List<OfferVO> getofferBYtoday(){
		return dao.getOfferBYToday();
	}
}
