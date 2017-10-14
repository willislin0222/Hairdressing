package com.morder.model;

import java.util.List;
import java.util.Set;

import com.orderlist.model.OrderListVO;


public interface MorderDAO_interface {
	public void insert(MorderVO morderVO);
	public void update(MorderVO morderVO);
	public void delete(String mord_no);
	public MorderVO findByPrimarykey(String mord_no);
	public List<MorderVO> getAll();
	
	

	

	
}
