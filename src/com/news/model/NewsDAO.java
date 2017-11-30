package com.news.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class NewsDAO implements NewsDAO_interface{

	private static final String GET_ALL_STMT="from NewsVO order by news_no";
	private static final String GET_NEWS_BY_STATUS="from NewsVO where news_status=1 order by news_createdate desc";
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(NewsVO newsVO) {
		hibernateTemplate.saveOrUpdate(newsVO);
		
	}

	@Override
	public void update(NewsVO newsVO) {
		hibernateTemplate.update(newsVO);
		
	}

	@Override
	public void delete(String news_no) {
		NewsVO newsVO = (NewsVO) hibernateTemplate.get(NewsVO.class, news_no);
		hibernateTemplate.delete(newsVO);
	}

	@Override
	public NewsVO findByPrimaryKey(String news_no) {
		NewsVO	newsVO = (NewsVO) hibernateTemplate.get(NewsVO.class, news_no);
		return newsVO;
	}

	@Override
	public List<NewsVO> getAll() {
		List<NewsVO> list = null;
		list = (List<NewsVO>) hibernateTemplate.find(GET_ALL_STMT);
		
		return list;
	}

	@Override
	public List<NewsVO> getNewsByStatus() {
		List<NewsVO> list = null;
		list = (List<NewsVO>) hibernateTemplate.find(GET_NEWS_BY_STATUS);
		
		return list;
	}

}
