package com.reservation.actions;

import java.util.Base64;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class ReservationManagerAction {
	private String res_no;

	//取得修改預約資料
	public String getOne_For_Update(){
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("reservationVO", reservationVO);
		return "success";
			
	}
		

	//刪除預約
	public String delete(){
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.delete(res_no);
		return "success";
	}
	public String getRes_no() {
		return res_no;
	}

	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	
	
}
