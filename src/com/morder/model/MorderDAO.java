package com.morder.model;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.orderlist.model.OrderListDAO;
import com.orderlist.model.OrderListService;
import com.orderlist.model.OrderListVO;

import hibernate.util.HibernateUtil;

public class MorderDAO implements MorderDAO_interface{
	
	private static final String GET_MORDERS_BY_MEMNO ="FROM MorderVO where mem_no=? order by mord_no";
	private static final String GET_ALL_STMT ="FROM MorderVO order by mord_no";
	
	@Override
	public void insert(MorderVO morderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(morderVO);
			String key =(String) session.getIdentifier(morderVO);
			System.out.println(key);
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
			morderVO.getProducts().remove(mord_no);
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

	@Override
	public void insertWithOrderList(MorderVO morderVO, List<OrderListVO> list) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			
			//先新增訂單
			session.saveOrUpdate(morderVO);
			//取對應的自增主鍵值
			String key =(String) session.getIdentifier(morderVO);
			
			//在新增訂單明細
			OrderListService orderListSvc = new OrderListService();
			for(OrderListVO aOrderList : list){
				morderVO.setMord_no(key);
				aOrderList.setMorderVO(morderVO);
				orderListSvc.insert2(aOrderList, session);
			}
			
			//交易commit，要在訂單這邊做commit
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public List<MorderVO> getMordersByMemno(String mem_no) {
		List<MorderVO> list = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_MORDERS_BY_MEMNO);
			query.setParameter(0, mem_no);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		return list;
	}


}
