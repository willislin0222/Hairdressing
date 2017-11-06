package com.adm.actions;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

public class AdmManagerAction extends ActionSupport{
	private String adm_no;
	private String adm_id;
	private String adm_psw;
	
	
	//登入管理者
	public String login(){
		AdmService admSvc = new AdmService();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		AdmVO admVO = admSvc.getOneAdmByAdmid(adm_id);
		Base64.Encoder encoder = Base64.getEncoder();
		//密碼加密
		String psw_new64 = encoder.encodeToString(adm_psw.getBytes());
		if(admVO.getAdm_no() == null){
			super.addFieldError("errorMsg", "無此帳號");
			return "input";
		}else if(psw_new64.equals(admVO.getAdm_psw())){	
			//密碼解密
			final Base64.Decoder decoder = Base64.getDecoder();
			final String adm_psw = new String(decoder.decode(admVO.getAdm_psw()));
			admVO.setAdm_psw(adm_psw);
			session.setAttribute("admVO", admVO);// *工作1: 在session內做已經登入過的標識
				
			return "success";
		}else{
			super.addFieldError("errorMsg", "密碼錯誤");
			return "input";
		}
		
	}
		
	//取得修改管理員
	public String getOne_For_Update(){
		AdmService admSvc = new AdmService();
		AdmVO admVO = admSvc.getOneAdm(adm_no);
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

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAdm_psw() {
		return adm_psw;
	}

	public void setAdm_psw(String adm_psw) {
		this.adm_psw = adm_psw;
	}
	
	

	
	

	
	
}
