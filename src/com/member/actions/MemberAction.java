package com.member.actions;


import java.util.Base64;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport {
	private MemberVO memberVO;
	
	//新增會員
	public String addMember(){
		MemberService memberSvc = new MemberService();
		memberVO.setMem_joindate(new java.sql.Date(System.currentTimeMillis()));
		if(memberSvc.getOneMemberBymemid(memberVO.getMem_id()).getMem_no() != null){
			super.addFieldError("mem_id", "此帳號已申請過");
			return "input";
		}
		//密碼加密
		Base64.Encoder encoder = Base64.getEncoder();
		final String psw_new64 = encoder.encodeToString(memberVO.getMem_psw().getBytes());
		memberVO.setMem_psw(psw_new64);
		memberSvc.addMember(memberVO);
		return "success";
	}
	
	//修改會員
	public String updateMember(){
		MemberService memberSvc = new MemberService();
		//密碼加密
		Base64.Encoder encoder = Base64.getEncoder();
		final String psw_new64 = encoder.encodeToString(memberVO.getMem_psw().getBytes());
		memberVO.setMem_psw(psw_new64);
		memberSvc.updateMembe(memberVO);
		return "success";
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	
}
