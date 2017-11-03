package com.offer.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;
import com.opensymphony.xwork2.ActionSupport;

public class OfferManagerAction extends ActionSupport{
	private String off_no;
	
	//取得修改優惠資料
	public String getOne_For_Update(){
		OfferService offerSvc = new OfferService();
		OfferVO offerVO = offerSvc.getOneOffer(off_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("offerVO", offerVO);
		return "success";
			
	}
	//刪除優惠
	public String delete(){
		OfferService offerSvc = new OfferService();
		offerSvc.delete(off_no);
		return "success";
	}

	public String getOff_no() {
		return off_no;
	}

	public void setOff_no(String off_no) {
		this.off_no = off_no;
	}
	
}
