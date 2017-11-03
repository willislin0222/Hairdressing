package com.offer.model;

import java.sql.Date;
import java.util.List;

import com.member.model.MemberVO;

public class OfferService {
	
	private OfferDAO_interface dao;
	
	public OfferService(){
		dao =new OfferDAO();
	}
	
	public OfferVO addOffer(String off_title,String off_content,byte[] off_image,Date 
						 off_start,Date off_end,Integer off_status){
		OfferVO offerVO = new OfferVO();
		offerVO.setOff_title(off_title);
		offerVO.setOff_content(off_content);
		offerVO.setOff_image(off_image);
		offerVO.setOff_start(off_start);
		offerVO.setOff_end(off_end);
		offerVO.setOff_status(off_status);
		dao.insert(offerVO);
		
		return offerVO;
	}
	
	public OfferVO updateOffer(String off_no,String off_title,String off_content,byte[] off_image,Date 
			 off_start,Date off_end,Integer off_status){
		
		OfferVO offerVO = new OfferVO();
		
		offerVO.setOff_no(off_no);
		offerVO.setOff_title(off_title);
		offerVO.setOff_content(off_content);
		offerVO.setOff_image(off_image);
		offerVO.setOff_start(off_start);
		offerVO.setOff_end(off_end);
		offerVO.setOff_status(off_status);
		dao.update(offerVO);
		
		return offerVO;
	}
	
	//給struct2用
	public void addOffer(OfferVO offerVO) {
		dao.insert(offerVO);
	}
		
	public void updateOffer(OfferVO offerVO) {
		dao.update(offerVO);
	}
	
	public void delete(String off_no){
		dao.delete(off_no);
	}
	
	public OfferVO getOneOffer(String off_no){
		return dao.findByPrimaryKey(off_no);
	}
	
	public List<OfferVO> getAll(){
		return dao.getAll();
	}
}
