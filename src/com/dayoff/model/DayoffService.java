package com.dayoff.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DayoffService {

	private DayoffDAO_interface dao;
	
	public DayoffService(){
//		dao =new DayoffDAO();
		//dao = new EmpHibernateDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(DayoffDAO_interface) context.getBean("dayoffDAO");
	}
	
	//給struct2用
	public void addDayoff(DayoffVO dayoffVO) {
		dao.insert(dayoffVO);
	}
		
	public void updateDayoff(DayoffVO dayoffVO) {
		dao.update(dayoffVO);
	}
		
	public void delete(String day_no){
		dao.delete(day_no);
	}
		
	public DayoffVO getOneDayoff(String day_no){
		return dao.findByPrimaryKey(day_no);
	}
		
	public List<DayoffVO> getAll(){
		return dao.getAll();
	}
}
