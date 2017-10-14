package com.offer.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import hibernate.util.HibernateUtil;

public class OfferDAO implements OfferDAO_interface{

	private static final String GET_ALL_STMT="from OfferVO order by off_no";
	@Override
	public void insert(OfferVO offerVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(offerVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void update(OfferVO offerVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(offerVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void delete(String off_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			OfferVO offerVO = (OfferVO) session.get(OfferVO.class, off_no);
			session.delete(offerVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public OfferVO findByPrimaryKey(String off_no) {
		OfferVO offerVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			offerVO = (OfferVO) session.get(OfferVO.class, off_no);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return offerVO;
	}

	@Override
	public List<OfferVO> getAll() {
		List<OfferVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
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
