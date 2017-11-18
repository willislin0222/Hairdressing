package com.page.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.morder.model.MorderVO;

import hibernate.util.HibernateUtil;

public class ReservationDAO implements ReservationDAO_interface{

	@Override
	public List<ReservationVO> queryByPage(String hql, int offset, int pageSize) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	        Transaction tx = null;
	        List<ReservationVO> list = null;
	        
	        try
	        {
	            tx = session.beginTransaction();
	            
	            Query query = session.createQuery(hql).setFirstResult(offset).setMaxResults(pageSize);
	            
	            list = query.list();
	            
	            tx.commit();
	            
	        }
	        catch (Exception e)
	        {
	            if(tx != null)
	            {
	                tx.rollback();
	            }
	            
	            e.printStackTrace();
	        }
	        
	        
	        return list;
	}

	@Override
	public int getAllRowCount(String hql) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction tx = null;
        int allRows = 0;
        try
        {
            tx = session.beginTransaction();
            
            Query query = session.createQuery(hql);
            
            allRows = query.list().size();
            
            tx.commit();
            
        }
        catch (Exception e)
        {
            if(tx != null)
            {
                tx.rollback();
            }
            
            e.printStackTrace();
        }
        return allRows;
	}


}
