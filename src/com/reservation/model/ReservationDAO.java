package com.reservation.model;

import java.sql.Date;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class ReservationDAO implements ReservationDAO_interface{

	private static final String GET_RESERVATIONS_BY_TODAY ="FROM ReservationVO where res_date=? order by res_no";
	private static final String GET_ALL_STMT ="FROM ReservationVO order by res_no";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
		
	@Override
	public void insert(ReservationVO reservationVO) {
		hibernateTemplate.saveOrUpdate(reservationVO);
		
	}

	@Override
	public void update(ReservationVO reservationVO) {
		hibernateTemplate.update(reservationVO);
		
	}

	@Override
	public void delete(String res_no) {
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setRes_no(res_no);
		hibernateTemplate.delete(reservationVO);
	}

	@Override
	public ReservationVO findByPrimaryKey(String res_no) {
		ReservationVO	reservationVO = (ReservationVO) hibernateTemplate.get(ReservationVO.class, res_no);
		return reservationVO;
	}

	@Override
	public List<ReservationVO> getAll() {
		List<ReservationVO> list = null;
		list = (List<ReservationVO>) hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

	@Override
	public List<ReservationVO> getReservationsByToday(Date res_date) {
		List<ReservationVO> list = null;
		list = (List<ReservationVO>) hibernateTemplate.find(GET_RESERVATIONS_BY_TODAY, res_date);
		return list;
	}


}
