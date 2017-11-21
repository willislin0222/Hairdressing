package com.reservation.actions;

import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.fullcalendarevent.model.Event;
import com.member.actions.GetDataByMemAction;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.member.model.PageBean;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class ReservationManagerAction {
	private String res_no;
	private String mem_no;
	private Date today;
	private int page=1;
	List<Event> events;
	
	
	//取得修改預約資料
	public String getOne_For_Update(){
		today = new Date(System.currentTimeMillis());
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("reservationVO", reservationVO);
		return "success";
			
	}
		
	//刪除預約
	public String delete() throws Exception{
		ReservationService reservationSvc = new ReservationService();
		reservationSvc.delete(res_no);
		today = new Date(System.currentTimeMillis());
		//重新查詢會員預約紀錄
		GetDataByMemAction getDataByMemAction = new GetDataByMemAction();
		getDataByMemAction.getReservationsPageBeanByMemno();	
	    HttpServletRequest request = ServletActionContext.getRequest();    
	        
		return "success";
	}
	
	//後台刪除預約
	public String backdelete() throws Exception{
		delete();
		return "success";
	}
	
	
	//取得所有預約資料
	public String getAllReservations(){
		ReservationService reservationSvc = new ReservationService();
		List<ReservationVO> reslist = reservationSvc.getAll();
		Event event = null;	
		events = new LinkedList();
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

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	
	
	
}
