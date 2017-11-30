package com.adm.actions;


import java.io.IOException;
import java.util.Base64;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.opensymphony.xwork2.ActionSupport;


public class AdmAction extends ActionSupport{
	
	private AdmVO admVO;
	
		
	//新增管理員
	public String addAdm() throws IOException{
		AdmService admSvc = new AdmService();
		if((admSvc.getOneAdmByAdmid(admVO.getAdm_id()).getAdm_no()) != null){
			super.addFieldError("adm_id", "此帳號已申請過");
			return "input";
		}
		//密碼加密
		Base64.Encoder encoder = Base64.getEncoder();
		final String psw_new64 = encoder.encodeToString(admVO.getAdm_psw().getBytes());
		admVO.setAdm_psw(psw_new64);
		admVO.setAdm_createdate(new java.sql.Date(System.currentTimeMillis()));
		admVO.setAdm_status("1");
		admSvc.addAdm(admVO);
		return "success";
	}
	
	//修改管理員資料
	public String updateAdm() throws IOException{
		AdmService admSvc = new AdmService();	
		//密碼加密
		Base64.Encoder encoder = Base64.getEncoder();
		final String psw_new64 = encoder.encodeToString(admVO.getAdm_psw().getBytes());
		admVO.setAdm_psw(psw_new64);
		admSvc.updateAdm(admVO);
		return "success";
	}

	public AdmVO getAdmVO() {
		return admVO;
	}

	public void setAdmVO(AdmVO admVO) {
		this.admVO = admVO;
	}

	

	
	
}
