package com.morder.model;

import java.sql.Date;
import java.util.List;

import com.member.model.MemberVO;
import com.orderlist.model.OrderListVO;



public class MorderService {
	MorderDAO_interface dao;
	
	public MorderService(){
		dao =new MorderDAO();
	}
	public MorderVO addMorder(String mem_no,Integer mord_price,Date mord_createdate,Integer mord_status){
		
		MorderVO morderVO = new MorderVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_no(mem_no);
		morderVO.setMemberVO(memberVO);
		morderVO.setMord_price(mord_price);
		morderVO.setMord_createdate(mord_createdate);
		morderVO.setMord_status(mord_status);
		dao.insert(morderVO);
		
		return morderVO;
	}
	
	public MorderVO updateMorder(String mord_no,String mem_no,Integer mord_price,Date mord_createdate,Integer mord_status){
		
		MorderVO morderVO = new MorderVO();
		morderVO.setMord_no(mord_no);
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_no(mem_no);
		morderVO.setMemberVO(memberVO);
		morderVO.setMord_price(mord_price);
		morderVO.setMord_createdate(mord_createdate);
		morderVO.setMord_status(mord_status);
		dao.update(morderVO);
		
		return morderVO;
	}
	
	public void delete(String mord_no){
		dao.delete(mord_no);
	}
	
	public MorderVO getOneMorder(String mord_no){
		return dao.findByPrimarykey(mord_no);
	}
	
	public List<MorderVO> getAll(){
		return dao.getAll();
	}
	
	public void insertWithOrderList(MorderVO morderVO, List<OrderListVO> list){
		dao.insertWithOrderList(morderVO, list);
	}
	
	public List<MorderVO> getMordersByMemno(String mem_no){
		return dao.getMordersByMemno(mem_no);
	}
	
}
