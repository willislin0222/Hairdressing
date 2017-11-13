package com.dayoff.model;

import java.util.List;


public class DayoffService {

	private DayoffDAO_interface dao;
	
	public DayoffService(){
		dao =new DayoffDAO();
	}
	
	//給struct2用
	public void addDayoff(DayoffVO dayoffVO) {
		dao.insert(dayoffVO);
	}
		
	public void updateDayoff(DayoffVO dayoffVO) {
		dao.update(dayoffVO);
	}
		
	public void delete(String day_no){
		dao.delete(day_no);
	}
		
	public DayoffVO getOneDayoff(String day_no){
		return dao.findByPrimaryKey(day_no);
	}
		
	public List<DayoffVO> getAll(){
		return dao.getAll();
	}
}
