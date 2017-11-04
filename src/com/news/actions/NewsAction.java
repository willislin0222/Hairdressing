package com.news.actions;


import java.io.IOException;

import com.news.model.NewsService;
import com.news.model.NewsVO;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport{
	
	private NewsVO newsVO;
	
		
	//新增最新訊息
	public String addNews() throws IOException{
		NewsService newsSvc = new NewsService();
		newsVO.setNews_createdate(new java.sql.Date(System.currentTimeMillis()));
		newsSvc.addNews(newsVO);
		return "success";
	}
	
	//修改最新訊息
	public String updateNews() throws IOException{
		NewsService newsSvc = new NewsService();		
		newsSvc.updateNews(newsVO);
		return "success";
	}

	public NewsVO getNewsVO() {
		return newsVO;
	}

	public void setNewsVO(NewsVO newsVO) {
		this.newsVO = newsVO;
	}

	
	
}
