package com.member.model;

import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.morder.model.MorderVO;
import com.reservation.model.ReservationVO;


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

	@SuppressWarnings("unchecked")
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

	@SuppressWarnings("unchecked")
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

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<?> queryByPage(String hql, int offset, int pageSize) {
        List<ReservationVO> list = null;
        
        try {
        	list = (List<ReservationVO>) hibernateTemplate.execute(new HibernateCallback(){

				@Override
				public Object doInHibernate(Session session) throws HibernateException {
					Query query = session.createQuery(hql);
					query.setFirstResult(offset);
					query.setMaxResults(pageSize);
					List list = query.list();
					return list;
				}
        		
        	});
        }catch(Exception e){
        	throw e;
        }
        return list;
	}

	@Override
	public int getAllRowCount(String hql) {
        int allRows = 0;
        allRows = hibernateTemplate.find(hql).size();
        return allRows;
	}



}
