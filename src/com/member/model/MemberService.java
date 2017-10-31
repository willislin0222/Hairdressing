package com.member.model;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import com.reservation.model.ReservationVO;




public class MemberService {
	
	private MemberDAO_interface dao;
	
	public MemberService(){
		dao =new MemberDAO();
	}
	
	public MemberVO addOMember(String mem_name,String mem_id,String mem_psw,Date 
						 mem_birthday,String mem_email,String mem_mobile,Date mem_joindate){
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_name(mem_name);
		memberVO.setMem_id(mem_id);
		memberVO.setMem_psw(mem_psw);
		memberVO.setMem_birthday(mem_birthday);
		memberVO.setMem_email(mem_email);
		memberVO.setMem_mobile(mem_mobile);
		memberVO.setMem_joindate(mem_joindate);		
		dao.insert(memberVO);
		
		return memberVO;
	}
	
	public MemberVO updateMember(String mem_no,String mem_name,String mem_id,String mem_psw,Date 
			 mem_birthday,String mem_email,String mem_mobile,Date mem_joindate){
		
		MemberVO memberVO = new MemberVO();
			
		memberVO.setMem_no(mem_no);
		memberVO.setMem_name(mem_name);
		memberVO.setMem_id(mem_id);
		memberVO.setMem_psw(mem_psw);
		memberVO.setMem_birthday(mem_birthday);
		memberVO.setMem_email(mem_email);
		memberVO.setMem_mobile(mem_mobile);
		memberVO.setMem_joindate(mem_joindate);		
		dao.update(memberVO);
		
		return memberVO;
	}
	
	//給struct2用
	public void addMember(MemberVO memberVO) {
		dao.insert(memberVO);
	}
	
	public void updateMembe(MemberVO memberVO) {
		dao.update(memberVO);
	}
	
	public void delete(String mem_no){
		dao.delete(mem_no);
	}
	
	public MemberVO getOneMember(String mem_no){
		return dao.findByPrimaryKey(mem_no);
	}
	
	public MemberVO getOneMemberBymemid(String mem_id){
		return dao.findByMemid(mem_id);
	}
	
	public List<MemberVO> getAll(){
		return dao.getAll();
	}
	//從會員編號取得此會員的全部預約清單
	public Set<ReservationVO> getReservationsByMemno(String mem_no){
		return dao.getReservationsByMemno(mem_no);
	}
}
