package com.dayoff.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class DayoffDAO implements DayoffDAO_interface{

	private static final String GET_ALL_STMT="from DayoffVO order by day_no desc";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
		
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public void insert(DayoffVO dayoffVO) {
		hibernateTemplate.saveOrUpdate(dayoffVO);
		
	}

	@Override
	public void update(DayoffVO dayoffVO) {
		hibernateTemplate.update(dayoffVO);
		
	}

	@Override
	public void delete(String day_no) {
		
		DayoffVO dayoffVO =(DayoffVO) hibernateTemplate.get(DayoffVO.class, day_no);
		hibernateTemplate.delete(dayoffVO);
		
	}

	@Override
	public DayoffVO findByPrimaryKey(String day_no) {
		DayoffVO dayoffVO =(DayoffVO) hibernateTemplate.get(DayoffVO.class, day_no);
		return dayoffVO;
	}

	@Override
	public List<DayoffVO> getAll() {
		List<DayoffVO> list = null;
		
		list = (List<DayoffVO>) hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

}
