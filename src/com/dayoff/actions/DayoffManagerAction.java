package com.dayoff.actions;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dayoff.model.DayoffService;
import com.dayoff.model.DayoffVO;
import com.fullcalendarevent.model.Event;
import com.news.model.NewsService;
import com.news.model.NewsVO;
import com.opensymphony.xwork2.ActionSupport;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class DayoffManagerAction extends ActionSupport{
	private String day_no;
	List<Event> events;
	
	//取得修改休假日
	public String getOne_For_Update(){
		DayoffService dayoffSvc = new DayoffService();
		DayoffVO dayoffVO = dayoffSvc.getOneDayoff(day_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("dayoffVO", dayoffVO);
		return "success";
			
	}
	//刪除休假日
	public String delete(){
		DayoffService dayoffSvc = new DayoffService();
		dayoffSvc.delete(day_no);
		return "success";
	}
	
	//取得所有休假日
	public String getAllDayoffs(){
		DayoffService dayoffSvc = new DayoffService();
		List<DayoffVO> dayofflist = dayoffSvc.getAll();
		Event event = null;	
		events = new LinkedList();
		System.out.println(dayofflist.size());
		for(DayoffVO dayoff : dayofflist){
			event = new Event();  //每次要建立一個新的event物件，不然events內的值都會是同一筆
			event.setTitle(dayoff.getDay_title());
			event.setStart(dayoff.getDay_date());
			events.add(event);	
		}
		return "success";
				
	}
	
	public String getDay_no() {
		return day_no;
	}
	public void setDay_no(String day_no) {
		this.day_no = day_no;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	

	
	
	
}
