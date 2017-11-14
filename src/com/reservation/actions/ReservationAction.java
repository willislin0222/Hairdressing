package com.reservation.actions;


import java.util.Base64;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class ReservationAction extends ActionSupport{
	private ReservationVO reservationVO;

	//新增預約
	public String addReservation(){
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.addReservation(reservationVO);
		return "success";
	}
	
	//後台新增預約
	public String backaddReservation(){
		addReservation();
		return "success";
	}
	
	//修改預約資料
	public String updateReservation(){
		ReservationService reservationSvc = new ReservationService();
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.getOneMember(reservationVO.getMemberVO().getMem_no());
		reservationVO.setMemberVO(memberVO);
		reservationSvc.updateReservation(reservationVO);
		return "success";
	}
	//後台修改預約資料
	public String backupdateReservation(){
		ReservationService reservationSvc = new ReservationService();
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.getOneMember(reservationVO.getMemberVO().getMem_no());
		reservationVO.setMemberVO(memberVO);
		reservationSvc.updateReservation(reservationVO);
		return "success";
	}

	public ReservationVO getReservationVO() {
		return reservationVO;
	}

	public void setReservationVO(ReservationVO reservationVO) {
		this.reservationVO = reservationVO;
	}
	

	
}
