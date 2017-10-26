package com.reservation.model;

import java.sql.Date;
import java.util.List;

import com.member.model.MemberVO;
import com.morder.model.MorderDAO;
import com.morder.model.MorderDAO_interface;
import com.morder.model.MorderVO;

public class ReservationService {
	ReservationDAO_interface dao;
	
	public ReservationService(){
		dao =new ReservationDAO();
	}
	public ReservationVO addReservation(String mem_no,Date res_date,String res_content,String res_timestart,String res_timeend){
		
		ReservationVO reservationVO = new ReservationVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_no(mem_no);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setRes_date(res_date);
		reservationVO.setRes_content(res_content);
		reservationVO.setRes_timestart(res_timestart);
		reservationVO.setRes_timeend(res_timeend);

		dao.insert(reservationVO);
		
		return reservationVO;
	}
	
	public ReservationVO updateReservation(String res_no,String mem_no,String res_content,Date res_date,String res_timestart,String res_timeend){
		
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setRes_no(res_no);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_no(mem_no);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setRes_date(res_date);
		reservationVO.setRes_content(res_content);
		reservationVO.setRes_timestart(res_timestart);
		reservationVO.setRes_timeend(res_timeend);
		
		dao.update(reservationVO);
		
		return reservationVO;
	}
	
	//給struct2用
	public void addReservation(ReservationVO reservationVO) {
		dao.insert(reservationVO);
	}
	
	public void updateReservation(ReservationVO reservationVO) {
		dao.update(reservationVO);
	}
	
	public void delete(String res_no){
		dao.delete(res_no);
	}
	
	public ReservationVO getOneReservation(String res_no){
		return dao.findByPrimaryKey(res_no);
	}
	
	public List<ReservationVO> getAll(){
		return dao.getAll();
	}
}
