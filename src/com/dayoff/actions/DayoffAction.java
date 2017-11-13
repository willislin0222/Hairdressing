package com.dayoff.actions;


import java.io.IOException;

import com.dayoff.model.DayoffService;
import com.dayoff.model.DayoffVO;
import com.opensymphony.xwork2.ActionSupport;

public class DayoffAction extends ActionSupport{
	
	private DayoffVO dayoffVO;
	
		
	//新增休假日
	public String addDayoff() throws IOException{
		DayoffService dayoffSvc = new DayoffService();	
		dayoffSvc.addDayoff(dayoffVO);
		dayoffVO = null;
		return "success";
	}
	
	//修改休假日
	public String updateDayoff() throws IOException{
		DayoffService dayoffSvc = new DayoffService();		
		dayoffSvc.updateDayoff(dayoffVO);
		dayoffVO = null;
		return "success";
	}

	public DayoffVO getDayoffVO() {
		return dayoffVO;
	}

	public void setDayoffVO(DayoffVO dayoffVO) {
		this.dayoffVO = dayoffVO;
	}
	
}
