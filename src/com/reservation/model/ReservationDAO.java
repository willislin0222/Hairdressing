package com.reservation.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.morder.model.MorderVO;

import hibernate.util.HibernateUtil;

public class ReservationDAO implements ReservationDAO_interface{

	private static final String GET_ALL_STMT ="FROM ReservationVO order by res_no";
	@Override
	public void insert(ReservationVO reservationVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservationVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(ReservationVO reservationVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(reservationVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String res_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			ReservationVO reservationVO = new ReservationVO();
			reservationVO.setRes_no(res_no);
			session.delete(reservationVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public ReservationVO findByPrimaryKey(String res_no) {
		ReservationVO reservationVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		
		try {
			session.beginTransaction();
			reservationVO = (ReservationVO) session.get(ReservationVO.class, res_no);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return reservationVO;
	}

	@Override
	public List<ReservationVO> getAll() {
		List<ReservationVO> list = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

}
