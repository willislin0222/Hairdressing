package com.member.model;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.morder.model.MorderVO;
import com.reservation.model.ReservationVO;

import hibernate.util.HibernateUtil;

public class MemberDAO implements MemberDAO_interface{

	private static final String GET_ONE_ByMEMID_STMT="from MemberVO where mem_id=?";
	private static final String GET_ALL_STMT="from MemberVO";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(MemberVO memberVO) {
		hibernateTemplate.saveOrUpdate(memberVO);
		
	}

	@Override
	public void update(MemberVO memberVO) {
		hibernateTemplate.update(memberVO);
		
	}

	@Override
	public void delete(String mem_no) {
		MemberVO memberVO =(MemberVO) hibernateTemplate.get(MemberVO.class, mem_no);
		hibernateTemplate.delete(memberVO);
	}

	@Override
	public MemberVO findByPrimaryKey(String mem_no) {
		MemberVO memberVO =(MemberVO) hibernateTemplate.get(MemberVO.class, mem_no);
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
		list = (List<MemberVO>) hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

	@Override
	public Set<ReservationVO> getReservationsByMemno(String mem_no) {
		Set<ReservationVO>	set = findByPrimaryKey(mem_no).getReservations();
				return set;
	}

	@Override
	public Set<MorderVO> getMordersByMemno(String mem_no) {
		Set<MorderVO>	set = findByPrimaryKey(mem_no).getMorders();
		return set;
	}

	@Override
	public MemberVO findByMemid(String mem_id) {
		List<MemberVO> list = null;
		MemberVO memberVO =new MemberVO();
		list = (List<MemberVO>) hibernateTemplate.find(GET_ONE_ByMEMID_STMT, mem_id);
		for(MemberVO member:list){
			memberVO=member;
		}
		return memberVO;
	}

	@Override
	public List<?> queryByPage(String hql, int offset, int pageSize) {
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
