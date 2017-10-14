package com.orderlist.model;

import java.util.List;

import com.member.model.MemberVO;

	public interface OrderListDAO_interface {
	public void insert(OrderListVO orderlistVO);
	public void update(OrderListVO orderlistVO);
	public void delete(String mord_no,String pro_no);
	public OrderListVO findByPrimaryKey(String mord_no,String pro_no);
	public List<OrderListVO> getAll();
	
}
