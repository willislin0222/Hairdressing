package com.member.actions;


import java.util.Base64;

import com.aes256.AES256;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport {
	private MemberVO memberVO;
	private int page=1;
	
	//新增會員
	public String addMember(){
		MemberService memberSvc = new MemberService();
		memberVO.setMem_joindate(new java.sql.Date(System.currentTimeMillis()));
		if(memberSvc.getOneMemberBymemid(memberVO.getMem_id()).getMem_no() != null){
			super.addFieldError("mem_id", "此帳號已申請過");
			return "input";
		}
		//密碼加密(使用AES256)
		AES256 aes256 = new AES256();
		String passwordkey="zdtyukd";
		System.out.println("明文：" + memberVO.getMem_psw());  
        System.out.println("key：" + passwordkey);
        
        //將密碼使用KEY完成加密KEY=zdtyukd
        byte[] encryptResult = AES256.encrypt(memberVO.getMem_psw(), passwordkey);  
        System.out.println("密文：" + aes256.parseByte2HexStr(encryptResult));  
        
//		Base64.Encoder encoder = Base64.getEncoder();
//		final String psw_new64 = encoder.encodeToString(memberVO.getMem_psw().getBytes());
        //將密碼轉成String並存入資料庫
		memberVO.setMem_psw(aes256.parseByte2HexStr(encryptResult));
		memberVO.setMem_status("1");
		memberSvc.addMember(memberVO);
		return "success";
	}
	
	//修改會員
	public String updateMember(){
		MemberService memberSvc = new MemberService();
		//密碼加密
		AES256 aes256 = new AES256();
		String passwordkey="zdtyukd";
		System.out.println("明文：" + memberVO.getMem_psw());  
        System.out.println("key：" + passwordkey);
        
        byte[] encryptResult = AES256.encrypt(memberVO.getMem_psw(), passwordkey);  
        System.out.println("密文：" + aes256.parseByte2HexStr(encryptResult));  
		
//		Base64.Encoder encoder = Base64.getEncoder();
//		final String psw_new64 = encoder.encodeToString(memberVO.getMem_psw().getBytes());
		memberVO.setMem_psw(aes256.parseByte2HexStr(encryptResult));
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
