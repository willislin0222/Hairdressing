package com.member.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.morder.model.MorderVO;
import com.reservation.model.ReservationVO;

public class MemberVO {
	private	String mem_no;
	private	String mem_name;
	private	String mem_id;
	private	String mem_psw;
	private	Date mem_birthday;
	private	String mem_email;
	private	String mem_mobile;
	private	Date mem_joindate;
	private Set<ReservationVO> reservations = new HashSet<ReservationVO>();
	private Set<MorderVO> morders = new HashSet<MorderVO>();
	private String mem_status;
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_psw() {
		return mem_psw;
	}
	public void setMem_psw(String mem_psw) {
		this.mem_psw = mem_psw;
	}
	public Date getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(Date mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_mobile() {
		return mem_mobile;
	}
	public void setMem_mobile(String mem_mobile) {
		this.mem_mobile = mem_mobile;
	}
	public Date getMem_joindate() {
		return mem_joindate;
	}
	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}
	public Set<ReservationVO> getReservations() {
		return reservations;
	}
	public void setReservations(Set<ReservationVO> reservations) {
		this.reservations = reservations;
	}
	public Set<MorderVO> getMorders() {
		return morders;
	}
	public void setMorders(Set<MorderVO> morders) {
		this.morders = morders;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	
}
