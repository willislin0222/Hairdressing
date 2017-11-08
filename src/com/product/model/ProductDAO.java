package com.product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.news.model.NewsVO;

import hibernate.util.HibernateUtil;

public class ProductDAO implements ProductDAO_interface{

	private static final String GET_ALL_STMT="from " + ProductVO.class.getName() +" order by pro_createdate desc";	
	private static final String GET_PRODUCTS_BY_STATUS="from ProductVO where pro_status=1 order by pro_createdate desc";
	
	@Override
	public void insert(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String pro_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			ProductVO productVO = (ProductVO) session.get(ProductVO.class, pro_no);
			session.delete(productVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public ProductVO findByPrimaryKey(String pro_no) {
		ProductVO productVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		
		try {
			session.beginTransaction();
			productVO= (ProductVO) session.get(ProductVO.class, pro_no);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return productVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = null;
		
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

	@Override
	public List<ProductVO> getProductsByStatus() {
		List<ProductVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_PRODUCTS_BY_STATUS);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
		return list;
	}

}
