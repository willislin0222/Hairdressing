package com.news.model;

import java.util.List;


public interface NewsDAO_interface {
	public void insert(NewsVO newsVO);
	public void update(NewsVO newsVO);
	public void delete(String news_no);
	public NewsVO findByPrimaryKey(String news_no);
	public List<NewsVO> getAll();
	//取得狀態為為1的最新消息清單
	public List<NewsVO> getNewsByStatus();
}
