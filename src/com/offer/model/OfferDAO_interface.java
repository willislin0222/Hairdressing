package com.offer.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface OfferDAO_interface {
	public void insert(OfferVO offerVO);
	public void update(OfferVO offerVO);
	public void delete(String off_no);
	public OfferVO findByPrimaryKey(String off_no);
	public List<OfferVO> getAll();
	
	//取得優惠日期等於今天的清單
	public List<OfferVO> getOfferBYToday();
	
}
