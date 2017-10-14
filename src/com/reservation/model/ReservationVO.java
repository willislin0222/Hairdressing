package com.reservation.model;

import java.sql.Date;

import com.member.model.MemberVO;

public class ReservationVO {
	private String res_no;
	private MemberVO memberVO;
	private Date res_date;
	private String res_content;
	private String res_timestart;
	private String res_timeend;
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public String getRes_timestart() {
		return res_timestart;
	}
	public void setRes_timestart(String res_timestart) {
		this.res_timestart = res_timestart;
	}
	public String getRes_timeend() {
		return res_timeend;
	}
	public void setRes_timeend(String res_timeend) {
		this.res_timeend = res_timeend;
	}
	public String getRes_content() {
		return res_content;
	}
	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}
	
	
	
	
	
	
}
