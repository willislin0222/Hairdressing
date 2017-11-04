package com.adm.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.opensymphony.xwork2.ActionSupport;

public class AdmManagerAction extends ActionSupport{
	private String adm_no;
	
	//取得修改管理員
	public String getOne_For_Update(){
		AdmService admSvc = new AdmService();
		AdmVO admVO = admSvc.getOneNews(adm_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("admVO", admVO);
		return "success";
			
	}
	//刪除管理員
	public String delete(){
		AdmService admSvc = new AdmService();
		admSvc.delete(adm_no);
		return "success";
	}
	public String getAdm_no() {
		return adm_no;
	}
	public void setAdm_no(String adm_no) {
		this.adm_no = adm_no;
	}

	
	

	
	
}
