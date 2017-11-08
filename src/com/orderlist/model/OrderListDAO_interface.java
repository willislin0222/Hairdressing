package com.orderlist.model;

import java.util.List;

import org.hibernate.Session;

import com.member.model.MemberVO;

	public interface OrderListDAO_interface {
	public void insert(OrderListVO orderlistVO);
	public void update(OrderListVO orderlistVO);
	public void delete(String mord_no,String pro_no);
	public OrderListVO findByPrimaryKey(String mord_no,String pro_no);
	public List<OrderListVO> getAll();
	
	//新增訂單時同時新增訂單明細
    public void insert2 (OrderListVO orderListVO , Session oldsession);
	
}
