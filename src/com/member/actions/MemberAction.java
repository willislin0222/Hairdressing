package com.member.actions;

import java.sql.Date;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport {
	private MemberVO memberVO;

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	//新增會員
	public String addMember(){
		MemberService memberSvc = new MemberService();
		memberVO.setMem_joindate(new java.sql.Date(System.currentTimeMillis()));
		memberSvc.addMember(memberVO);
		return "success";
	}
	
	//修改會員
	public String updateMember(){
		MemberService memberSvc = new MemberService();
		memberSvc.updateMembe(memberVO);
		return "success";
	}
	
	//取得修改會員資料
	public String getOne_For_Update(){
		MemberService memberSvc = new MemberService();
		memberVO = memberSvc.getOneMember(memberVO.getMem_no());
		return "success";
	}
	
	//刪除會員
	public String delete(){
		MemberService memberSvc = new MemberService();
		memberSvc.delete(memberVO.getMem_no());
		return "success";
	}

}
