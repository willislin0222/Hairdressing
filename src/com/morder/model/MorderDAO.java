package com.morder.model;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import hibernate.util.HibernateUtil;

public class MorderDAO implements MorderDAO_interface{
	
	private static final String GET_ALL_STMT ="FROM MorderVO order by mord_no";
	
	@Override
	public void insert(MorderVO morderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(morderVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(MorderVO morderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(morderVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String mord_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			MorderVO morderVO = new MorderVO();
			morderVO.setMord_no(mord_no);
			session.delete(morderVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public MorderVO findByPrimarykey(String mord_no) {
		MorderVO morderVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		
		try {
			session.beginTransaction();
			morderVO = (MorderVO) session.get(MorderVO.class, mord_no);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return morderVO;
	}

	@Override
	public List<MorderVO> getAll() {
		List<MorderVO> list = null;
		
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
