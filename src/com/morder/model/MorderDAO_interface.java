package com.morder.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.orderlist.model.OrderListVO;

@Transactional
public interface MorderDAO_interface {
	public void insert(MorderVO morderVO);
	public void update(MorderVO morderVO);
	public void delete(String mord_no);
	public MorderVO findByPrimarykey(String mord_no);
	public List<MorderVO> getAll();
	
	//新增訂單時同時新增訂單明細
    public void insertWithOrderList(MorderVO morderVO , List<OrderListVO> list);
    
    //從會員編號取得所有訂單
    public List<MorderVO> getMordersByMemno(String mem_no);
	
}
