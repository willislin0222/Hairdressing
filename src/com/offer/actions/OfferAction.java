package com.offer.actions;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;
import com.opensymphony.xwork2.ActionSupport;

public class OfferAction extends ActionSupport{
	
	private OfferVO offerVO;
	
	//上傳的檔案物件list
	private List<File> fileUpload = new ArrayList<File>();   
		
	//新增優惠訊息
	public String addOffer() throws IOException{
		OfferService offerSvc = new OfferService();
		//處理前端送來的file List
		if(fileUpload.size() == 0){
			super.addFieldError("off_image", "優惠圖片請勿空白");
			return "input";
		}
		byte[] off_image=null;
		for (File file: fileUpload) {
			InputStream in = new FileInputStream(file);  
			off_image = new byte[in.available()];
			in.read(off_image);
			in.close();
			offerVO.setOff_image(off_image);
		}
		offerSvc.addOffer(offerVO);
		return "success";
	}
	
	//修改優惠訊息
	public String updateOffer() throws IOException{
		OfferService offerSvc = new OfferService();
		//處理前端送來的file List
		byte[] off_image=null;
		if(fileUpload.size() != 0){
			for (File file: fileUpload) {
				InputStream in = new FileInputStream(file);  
				off_image = new byte[in.available()];
				in.read(off_image);
				in.close();
				offerVO.setOff_image(off_image);
			}
		}else{
			off_image = offerSvc.getOneOffer(offerVO.getOff_no()).getOff_image();
			offerVO.setOff_image(off_image);
		}
			
		offerSvc.updateOffer(offerVO);
		return "success";
	}

	public OfferVO getOfferVO() {
		return offerVO;
	}

	public void setOfferVO(OfferVO offerVO) {
		this.offerVO = offerVO;
	}

	public List<File> getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(List<File> fileUpload) {
		this.fileUpload = fileUpload;
	}	
	
}
