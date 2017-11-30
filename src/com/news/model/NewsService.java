package com.news.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class NewsService {
	
private NewsDAO_interface dao;
	
	public NewsService(){
//		dao =new NewsDAO();
		//dao = new EmpHibernateDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(NewsDAO_interface) context.getBean("newsDAO");
	}
		
	//給struct2用
	public void addNews(NewsVO newsVO) {
		dao.insert(newsVO);
	}
		
	public void updateNews(NewsVO newsVO) {
		dao.update(newsVO);
	}
	
	public void delete(String news_no){
		dao.delete(news_no);
	}
	
	public NewsVO getOneNews(String news_no){
		return dao.findByPrimaryKey(news_no);
	}
	
	public List<NewsVO> getAll(){
		return dao.getAll();
	}
	
	public List<NewsVO> getNewsByStatus(){
		return dao.getNewsByStatus();
	}
}
