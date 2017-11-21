package com.morder.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.member.model.MemberVO;
import com.orderlist.model.OrderListVO;
import com.product.model.ProductVO;

public class MorderVO {
	private String mord_no; 
	private MemberVO memberVO;
	private Integer mord_price;
	private Date mord_createdate;
	private Integer mord_status;
	//MANY-TO-MANY
	private Set<ProductVO> products = new HashSet<ProductVO>();
	
	public String getMord_no() {
		return mord_no;
	}
	public void setMord_no(String mord_no) {
		this.mord_no = mord_no;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public Integer getMord_price() {
		return mord_price;
	}
	public void setMord_price(Integer mord_price) {
		this.mord_price = mord_price;
	}
	public Date getMord_createdate() {
		return mord_createdate;
	}
	public void setMord_createdate(Date mord_createdate) {
		this.mord_createdate = mord_createdate;
	}
	public Integer getMord_status() {
		return mord_status;
	}
	public void setMord_status(Integer mord_status) {
		this.mord_status = mord_status;
	}
	
	public Set<ProductVO> getProducts() {
		return products;
	}
	public void setProducts(Set<ProductVO> products) {
		this.products = products;
	}
}
