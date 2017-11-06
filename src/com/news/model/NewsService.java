package com.news.model;

import java.util.List;


public class NewsService {
	
private NewsDAO_interface dao;
	
	public NewsService(){
		dao =new NewsDAO();
	}
		
	//給struct2用
	public void addNews(NewsVO newsVO) {
		dao.insert(newsVO);
	}
		
	public void updateNews(NewsVO newsVO) {
		dao.update(newsVO);
	}
	
	public void delete(String news_no){
		dao.delete(news_no);
	}
	
	public NewsVO getOneNews(String news_no){
		return dao.findByPrimaryKey(news_no);
	}
	
	public List<NewsVO> getAll(){
		return dao.getAll();
	}
	
	public List<NewsVO> getNewsByStatus(){
		return dao.getNewsByStatus();
	}
}
