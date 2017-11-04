package com.adm.actions;


import java.io.IOException;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.opensymphony.xwork2.ActionSupport;

public class AdmAction extends ActionSupport{
	
	private AdmVO admVO;
	
		
	//新增管理員
	public String addAdm() throws IOException{
		AdmService admSvc = new AdmService();
		admVO.setAdm_createdate(new java.sql.Date(System.currentTimeMillis()));
		admSvc.addAdm(admVO);
		return "success";
	}
	
	//修改管理員資料
	public String updateAdm() throws IOException{
		AdmService admSvc = new AdmService();		
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
