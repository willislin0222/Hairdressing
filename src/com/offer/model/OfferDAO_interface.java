package com.offer.model;

import java.util.List;

public interface OfferDAO_interface {
	public void insert(OfferVO offerVO);
	public void update(OfferVO offerVO);
	public void delete(String off_no);
	public OfferVO findByPrimaryKey(String off_no);
	public List<OfferVO> getAll();
	
}
