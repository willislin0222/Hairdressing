package com.adm.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdmService {
	
private AdmDAO_interface dao;
	
	public AdmService(){
//		dao =new AdmDAO();
		//dao = new EmpHibernateDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(AdmDAO_interface) context.getBean("admDAO");
	}
		
	//給struct2用
	public void addAdm(AdmVO admVO) {
		dao.insert(admVO);
	}
		
	public void updateAdm(AdmVO admVO) {
		dao.update(admVO);
	}
	
	public void delete(String adm_no){
		dao.delete(adm_no);
	}
	
	public AdmVO getOneAdm(String adm_no){
		return dao.findByPrimaryKey(adm_no);
	}
	
	public AdmVO getOneAdmByAdmid(String adm_id){
		return dao.findByAdmmid(adm_id);
	}
	
	public List<AdmVO> getAll(){
		return dao.getAll();
	}
}
