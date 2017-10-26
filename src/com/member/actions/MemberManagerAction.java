package com.member.actions;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class MemberManagerAction extends ActionSupport{
	private String mem_no;
	private String mem_id;
	private String mem_psw;
	
	//登入會員
	public String login(){
		MemberService memberSvc = new MemberService();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MemberVO memberVO = memberSvc.getOneMemberBymemid(mem_id);
		Base64.Encoder encoder = Base64.getEncoder();
		//密碼加密
		String psw_new64 = encoder.encodeToString(mem_psw.getBytes());
		if(memberVO.getMem_no() == null){
			super.addFieldError("errorMsg", "無此帳號");
			return "input";
		}else if(psw_new64.equals(memberVO.getMem_psw())){	
			//密碼解密
			final Base64.Decoder decoder = Base64.getDecoder();
			final String mem_psw = new String(decoder.decode(memberVO.getMem_psw()));
			memberVO.setMem_psw(mem_psw);
			session.setAttribute("memberVO", memberVO);// *工作1: 在session內做已經登入過的標識
			
			try {                                      //*工作2: 看看有無來源網頁 (-如有:則重導之)                  
		         String location = (String) session.getAttribute("location");
		         System.out.println("location(LoginHandler)="+location);
		         if (location != null) {
		           session.removeAttribute("location");
		           HttpServletResponse  response = ServletActionContext.getResponse(); 
		           response.sendRedirect(location);
		           return null;
		         }
		       }catch (IOException e) { e.printStackTrace();}
			return "success";
		}else{
			super.addFieldError("errorMsg", "密碼錯誤");
			return "input";
		}
		
	}
		
	//取得修改會員資料
	public String getOne_For_Update(){
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.getOneMember(mem_no);
		//密碼解密
		final Base64.Decoder decoder = Base64.getDecoder();
		final String mem_psw = new String(decoder.decode(memberVO.getMem_psw()));
		memberVO.setMem_psw(mem_psw);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("memberVO", memberVO);
		return "success";
		
	}
	

	//刪除會員
	public String delete(){
		MemberService memberSvc = new MemberService();
		memberSvc.delete(mem_no);
		return "success";
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

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	
	
	
	
}
