package com.dayoff.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.member.model.MemberVO;

import hibernate.util.HibernateUtil;

public class DayoffDAO implements DayoffDAO_interface{

	private static final String GET_ALL_STMT="from DayoffVO";
	@Override
	public void insert(DayoffVO dayoffVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(dayoffVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(DayoffVO dayoffVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(dayoffVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String day_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		try {
			session.beginTransaction();
			DayoffVO dayoffVO =(DayoffVO) session.get(DayoffVO.class, day_no);
			session.delete(dayoffVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public DayoffVO findByPrimaryKey(String day_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		DayoffVO dayoffVO =null;
		try {
			session.beginTransaction();
			dayoffVO =(DayoffVO) session.get(DayoffVO.class, day_no);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return dayoffVO;
	}

	@Override
	public List<DayoffVO> getAll() {
		List<DayoffVO> list = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}

}
