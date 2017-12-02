package com.page.model;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;



public class ReservationDAO implements ReservationDAO_interface{

	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<ReservationVO> queryByPage(String hql, int offset, int pageSize) {
	        List<ReservationVO> list = null;
	        
	        try
	        {
	           list=(List<ReservationVO>) hibernateTemplate.execute(new HibernateCallback(){

				@SuppressWarnings("rawtypes")
				@Override
				public Object doInHibernate(Session session) throws HibernateException {
					Query query = session.createQuery(hql);
					query.setFirstResult(offset);
					query.setMaxResults(pageSize);
					List list = query.list();
					return list;
				}
	        	   
	           });
	            
	        }
	        catch (Exception e){throw e; }
	        
	        return list;
	}

	@Override
	public int getAllRowCount(String hql) {
        int allRows = 0;
        allRows = hibernateTemplate.find(hql).size();
        return allRows;
	}


}
