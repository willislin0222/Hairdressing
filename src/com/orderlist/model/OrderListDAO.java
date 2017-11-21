package com.orderlist.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.member.model.MemberVO;
import com.morder.model.MorderVO;
import com.product.model.ProductVO;

import hibernate.util.HibernateUtil;

public class OrderListDAO implements OrderListDAO_interface{
	
	
	private static final String GET_ORDERS_BY_MORDNO="from OrderListVO where mord_no=?";
	private static final String GET_ALL_STMT="from OrderListVO";
	
	@Override
	public void insert(OrderListVO orderlistVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderlistVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(OrderListVO orderlistVO) {
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderlistVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String mord_no, String pro_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {			
			session.beginTransaction();
			OrderListVO orderlistVO =(OrderListVO) session.get(OrderListVO.class, mord_no);
			session.delete(orderlistVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public OrderListVO findByPrimaryKey(String mord_no, String pro_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		OrderListVO orderlistVO =null;
		OrderListVO user = new OrderListVO();
		
		MorderVO morderVO = new MorderVO();
		morderVO.setMord_no(mord_no);
		user.setMorderVO(morderVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setPro_no(pro_no);
		user.setProductVO(productVO);
		
		try {
			session.beginTransaction();
			orderlistVO =(OrderListVO) session.get(OrderListVO.class, user);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return orderlistVO;
	}

	@Override
	public List<OrderListVO> getAll() {
		List<OrderListVO> list = null;
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

	@Override
	public void insert2(OrderListVO orderListVO, Session oldsession) {	
		try {
			oldsession.saveOrUpdate(orderListVO);	
		} catch (RuntimeException e) {
			oldsession.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public List<OrderListVO> getOrderListsByMordno(String mord_no) {
		List<OrderListVO> list = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ORDERS_BY_MORDNO);
			query.setParameter(0, mord_no);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}


}
