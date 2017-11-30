package com.reservation.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ReservationService {
	ReservationDAO_interface dao;
	
	public ReservationService(){
//		dao =new ReservationDAO();
		//dao = new EmpHibernateDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(ReservationDAO_interface) context.getBean("reservationDAO");
	}
	
	//給struct2用
	public void addReservation(ReservationVO reservationVO) {
		dao.insert(reservationVO);
	}
	
	public void updateReservation(ReservationVO reservationVO) {
		dao.update(reservationVO);
	}
	
	public void delete(String res_no){
		dao.delete(res_no);
	}
	
	public ReservationVO getOneReservation(String res_no){
		return dao.findByPrimaryKey(res_no);
	}
	
	public List<ReservationVO> getAll(){
		return dao.getAll();
	}
	
	public List<ReservationVO> getReservationsByToday(Date res_no){
		return dao.getReservationsByToday(res_no);
	}
}
