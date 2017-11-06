package com.adm.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.member.model.MemberVO;

import hibernate.util.HibernateUtil;

public class AdmDAO implements AdmDAO_interface{

	private static final String GET_ONE_By_ADMIN_STMT="from AdmVO where adm_id=?";
	private static final String GET_ALL_STMT="from AdmVO order by adm_no";
	@Override
	public void insert(AdmVO admVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(admVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(AdmVO admVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(admVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String adm_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			AdmVO admVO = (AdmVO) session.get(AdmVO.class, adm_no);
			session.delete(admVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public AdmVO findByPrimaryKey(String adm_no) {
		AdmVO admVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			admVO = (AdmVO) session.get(AdmVO.class, adm_no);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return admVO;
	}

	@Override
	public List<AdmVO> getAll() {
		List<AdmVO> list = null;
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

	@Override
	public AdmVO findByAdmmid(String adm_id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		AdmVO admVO =new AdmVO();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ONE_By_ADMIN_STMT);
			query.setParameter(0, adm_id);
			List<AdmVO> adms = query.list();

			for(AdmVO adm:adms){
				admVO.setAdm_no(adm.getAdm_no());
				admVO.setAdm_id(adm.getAdm_id());
				admVO.setAdm_psw(adm.getAdm_psw());
				admVO.setAdm_status(adm.getAdm_status());
				admVO.setAdm_createdate(adm.getAdm_createdate());
			}
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return admVO;
	}
}
