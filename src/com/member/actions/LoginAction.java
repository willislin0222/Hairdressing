package com.member.actions;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;

public class LoginAction extends ActionSupport{
	private String mem_id;
	private String mem_psw;
	
	//登入會員
	public String login(){
		MemberService memberSvc = new MemberService();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MemberVO memberVO = memberSvc.getOneMemberBymemid(mem_id);
		if(memberVO.getMem_no() == null){
			super.addFieldError("errorMsg", "無此帳號");
			return "input";
		}else if(mem_psw.equals(memberVO.getMem_psw())){		
			session.setAttribute("memberVO", memberVO);
			return "success";
		}else{
			super.addFieldError("errorMsg", "密碼錯誤");
			return "input";
		}
		
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_psw() {
		return mem_psw;
	}

	public void setMem_psw(String mem_psw) {
		this.mem_psw = mem_psw;
	}

	
	
	
}
