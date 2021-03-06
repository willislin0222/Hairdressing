package com.offer.model;

import java.sql.Date;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class OfferDAO implements OfferDAO_interface{
	
	private static final String GET_ALL_STMT="from OfferVO order by off_no";
	private static final String GET_OFFER_BY_TODAY="from OfferVO where off_end=?";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(OfferVO offerVO) {
		hibernateTemplate.saveOrUpdate(offerVO);
	}

	@Override
	public void update(OfferVO offerVO) {
		hibernateTemplate.update(offerVO);
	}

	@Override
	public void delete(String off_no) {
		
			OfferVO offerVO = (OfferVO) hibernateTemplate.get(OfferVO.class, off_no);
			hibernateTemplate.delete(offerVO);
		
	}

	@Override
	public OfferVO findByPrimaryKey(String off_no) {
		
		OfferVO	offerVO = (OfferVO) hibernateTemplate.get(OfferVO.class, off_no);
		
		return offerVO;
	}

	@Override
	public List<OfferVO> getAll() {
		List<OfferVO> list = null;
		
		list = (List<OfferVO>) hibernateTemplate.find(GET_ALL_STMT);
		
		return list;
	}

	@Override
	public List<OfferVO> getOfferBYToday() {
		List<OfferVO> list = null;
		Date today = new Date(System.currentTimeMillis());
		list = (List<OfferVO>) hibernateTemplate.find(GET_OFFER_BY_TODAY,today);
		
		return list;
	}

}
