package com.orderlist.model;

import java.util.List;


import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;


public class OrderListDAO implements OrderListDAO_interface{
	
	
	private static final String GET_ORDERS_BY_MORDNO="from OrderListVO where mord_no=?";
	private static final String GET_ALL_STMT="from OrderListVO";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(OrderListVO orderlistVO) {
		hibernateTemplate.saveOrUpdate(orderlistVO);
		
	}

	@Override
	public void update(OrderListVO orderlistVO) {
		hibernateTemplate.update(orderlistVO);
		
	}

	@Override
	public void delete(String mord_no, String pro_no) {
		OrderListVO orderlistVO =(OrderListVO) hibernateTemplate.get(OrderListVO.class, mord_no);
		hibernateTemplate.delete(orderlistVO);
		
	}

	@Override
	public OrderListVO findByPrimaryKey(String mord_no, String pro_no) {
//		OrderListVO orderlistVO =null;
//		OrderListVO user = new OrderListVO();
//		
//		MorderVO morderVO = new MorderVO();
//		morderVO.setMord_no(mord_no);
//		user.setMorderVO(morderVO);
//		
//		ProductVO productVO = new ProductVO();
//		productVO.setPro_no(pro_no);
//		user.setProductVO(productVO);
//		
//		orderlistVO =(OrderListVO) hibernateTemplate.get(OrderListVO.class, user);
		return null;
	}

	@Override
	public List<OrderListVO> getAll() {
		List<OrderListVO> list = null;
		list = (List<OrderListVO>) hibernateTemplate.find(GET_ALL_STMT);
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
		list = (List<OrderListVO>) hibernateTemplate.find(GET_ORDERS_BY_MORDNO, mord_no);
		return list;
	}


}
