package com.member.actions;

import com.aes256.AES256;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class MemberManagerAction extends ActionSupport{
	private String mem_no;
	private String mem_id;
	private String mem_psw;
	private Map<String,Boolean> result;
	
	//登入會員
	public String login(){
		MemberService memberSvc = new MemberService();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MemberVO memberVO = memberSvc.getOneMemberBymemid(mem_id);
//		Base64.Encoder encoder = Base64.getEncoder();
		//密碼加密(使用AES256)
		
		AES256 aes256 = new AES256();
		String passwordkey="zdtyukd"; //加密金鑰
        byte[] encryptResult = AES256.encrypt(mem_psw, passwordkey);  	
		String psw_new64 = aes256.parseByte2HexStr(encryptResult);
//		System.out.println("輸入密碼=" + mem_psw);
//		System.out.println("加密key：" + passwordkey);
//		System.out.println("加密密碼" + psw_new64);
//		System.out.println("資料庫密碼" + memberVO.getMem_psw());
		
		if(memberVO.getMem_no() == null){
			super.addFieldError("errorMsg", "無此帳號");
			return "input";
		}else if(psw_new64.equals(memberVO.getMem_psw())){	
			//密碼解密
			 String decryptResult = AES256.decrypt(encryptResult, passwordkey);  
//			 System.out.println("解密密碼" + decryptResult);
//			final Base64.Decoder decoder = Base64.getDecoder();
//			final String mem_psw = new String(decoder.decode(memberVO.getMem_psw()));
			 memberVO.setMem_psw(decryptResult);
			session.setAttribute("memberVO", memberVO);// *工作1: 在session內做已經登入過的標識
			
			try {                                      //*工作2: 看看有無來源網頁 (-如有:則重導之)                  
		         String location = (String) session.getAttribute("location");
//		         System.out.println("location(LoginHandler)="+location);
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
	
	//檢查前端註冊ID是否有測過
	public String checkid(){
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.getOneMemberBymemid(mem_id);
		result = new HashMap<String,Boolean>();
		if(memberVO.getMem_id() != null){
			result.put("boolean", true);
		}else{
			result.put("boolean", false);
		}
		System.out.println(result.toString());
		return "success";
		
	}
		
	//用不到，程式碼是錯誤的，要想辦法將DB的密碼轉成byte在解碼才會正確
	//取得修改會員資料
//	public String getOne_For_Update(){
//		MemberService memberSvc = new MemberService();
//		MemberVO memberVO = memberSvc.getOneMember(mem_no);
//		String passwordkey="zdtyukd"; //加密金鑰
//		//密碼解密
//		byte[] getDbPsw = AES256.tohash256Deal(memberVO.getMem_psw());
//		String decryptResult = AES256.decrypt(getDbPsw, passwordkey); 
//		System.out.println("解密密碼=" + decryptResult);
////		final Base64.Decoder decoder = Base64.getDecoder();
////		final String mem_psw = new String(decoder.decode(memberVO.getMem_psw()));
//		memberVO.setMem_psw(decryptResult);
//		System.out.println(memberVO.getMem_psw());
//		HttpServletRequest request = ServletActionContext.getRequest();
//		request.setAttribute("memberVO", memberVO);
//		return "success";
//		
//	}
	

	//刪除會員
	public String delete(){
		MemberService memberSvc = new MemberService();
		memberSvc.delete(mem_no);
		return "success";
	}
	
	//停用會員
	public String end(){
		MemberService memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.getOneMember(mem_no);
		memberVO.setMem_status("0");
		memberSvc.updateMembe(memberVO);
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

	public Map<String, Boolean> getResult() {
		return result;
	}

	public void setResult(Map<String, Boolean> result) {
		this.result = result;
	}

	

	
	
	
}
