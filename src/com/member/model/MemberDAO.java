package com.member.model;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.morder.model.MorderVO;
import com.reservation.model.ReservationVO;

import hibernate.util.HibernateUtil;

public class MemberDAO implements MemberDAO_interface{

	private static final String GET_ONE_ByMEMID_STMT="from MemberVO where mem_id=?";
	private static final String GET_ALL_STMT="from MemberVO";
	
	@Override
	public void insert(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void delete(String mem_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		try {
			session.beginTransaction();
			MemberVO memberVO =(MemberVO) session.get(MemberVO.class, mem_no);
			session.delete(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public MemberVO findByPrimaryKey(String mem_no) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		MemberVO memberVO =null;
		try {
			session.beginTransaction();
			memberVO =(MemberVO) session.get(MemberVO.class, mem_no);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
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
		Session session = HibernateUtil.getSessionFactory().openSession();
		MemberVO memberVO =new MemberVO();;
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ONE_ByMEMID_STMT);
			query.setParameter(0, mem_id);
			List<MemberVO> names = query.list();

			for(MemberVO member:names){
				memberVO.setMem_no(member.getMem_no());
				memberVO.setMem_name(member.getMem_name());
				memberVO.setMem_id(member.getMem_id());
				memberVO.setMem_psw(member.getMem_psw());
				memberVO.setMem_birthday(member.getMem_birthday());
				memberVO.setMem_email(member.getMem_email());
				memberVO.setMem_mobile(member.getMem_mobile());
				memberVO.setMem_joindate(member.getMem_joindate());
			}
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		return memberVO;
	}



}
