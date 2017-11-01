package com.reservation.actions;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.fullcalendarevent.model.Event;
import com.member.model.MemberService;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class ReservationManagerAction {
	private String res_no;
	private String mem_no;	
	Set<Event> events;
	
	//取得修改預約資料
	public String getOne_For_Update(){
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("reservationVO", reservationVO);
		return "success";
			
	}
		
	//刪除預約，從listAllReservation.jsp送出的刪除請求
	public String delete(){
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.delete(res_no);
		return "success";
	}
	
	
	//從會員編號取得此會員所有預約資料
	public String getReservationsByMemno(){
		MemberService membernSvc = new MemberService();
		Set<ReservationVO> reslist = membernSvc.getReservationsByMemno(mem_no);
		Event event = null;	
		events = new HashSet();
		for(ReservationVO reservation : reslist){
			event = new Event();  //每次要建立一個新的event物件，不然events內的值都會是同一筆
			String title = reservation.getRes_timestart() + "~" + reservation.getRes_timeend() 
						   + "預約項目:" +reservation.getRes_content();
			event.setTitle(title);
			event.setStart(reservation.getRes_date());
			event.setAllDay(false);
			events.add(event);	
		}
		return "success";
			
	}
	public String getRes_no() {
		return res_no;
	}

	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}


	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	
}
