package com.news.model;

import java.sql.Date;

public class NewsVO {
	private String news_no;
	private String news_title;
	private String news_content;
	private Date news_createdate;
	private String news_status;
	public String getNews_no() {
		return news_no;
	}
	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public Date getNews_createdate() {
		return news_createdate;
	}
	public void setNews_createdate(Date news_createdate) {
		this.news_createdate = news_createdate;
	}
	public String getNews_status() {
		return news_status;
	}
	public void setNews_status(String news_status) {
		this.news_status = news_status;
	}
	
	
}
