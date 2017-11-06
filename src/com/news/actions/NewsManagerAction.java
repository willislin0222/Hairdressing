package com.news.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.news.model.NewsService;
import com.news.model.NewsVO;
import com.opensymphony.xwork2.ActionSupport;

public class NewsManagerAction extends ActionSupport{
	private String news_no;
	
	//取得修改最新消息
	public String getOne_For_Update(){
		NewsService newsSvc = new NewsService();
		NewsVO newsVO = newsSvc.getOneNews(news_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("newsVO", newsVO);
		return "success";
			
	}
	//刪除最新消息
	public String delete(){
		NewsService newsSvc = new NewsService();
		newsSvc.delete(news_no);
		return "success";
	}
	
	//最新消息結束公告
	public String end(){
		NewsService newsSvc = new NewsService();
		NewsVO newsVO = newsSvc.getOneNews(news_no);
		newsVO.setNews_status("0");
		newsSvc.updateNews(newsVO);
		return "success";
	}
	
	public String getNews_no() {
		return news_no;
	}
	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}
	
}
