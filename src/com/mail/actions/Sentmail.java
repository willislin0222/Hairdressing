package com.mail.actions;

import java.util.Base64;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.aes256.AES256;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

public class Sentmail extends ActionSupport{

	private MemberVO memberVO;
	private String to;
	private String subject;
	private String body;
	 
	static Properties properties = new Properties();
    static
	{
	      properties.put("mail.smtp.host", "smtp.gmail.com");
	      properties.put("mail.smtp.socketFactory.port", "465");
	      properties.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.port", "465");
	}
    
    public String sentpswmail() 
    {
    	
       String from = "demomail201711@gmail.com";
       String password = "L0o7V2e5";
       String ret = "success";
       MemberService  memberSvc =new MemberService();
       memberVO = memberSvc.getOneMemberBymemid(memberVO.getMem_id());
       if(memberVO.getMem_no() == null){
    	   super.addFieldError("mem_id", "查無此帳號請確認帳號是否正確");
    	   return "input";
       }
       //產生亂數密碼
       StringBuilder pswRandom = new StringBuilder();
       int n = 0;
       for (int i = 0; i < 6; i++) {
     		do{
     			n = 48 + (int)(Math.random() * 75);
     			System.out.println(n);
     		}while(!Character.toString((char) (n)).matches("[0-9|A-Z|a-z]"));
     		pswRandom.append(Character.toString((char) (n)));
      }
     		
      //密碼經base64加密
//      Base64.Encoder encoder = Base64.getEncoder();
//      String psw64 = encoder.encodeToString(pswRandom.toString().getBytes());
     //密碼加密(使用AES256)
        AES256 aes256 = new AES256();
		String passwordkey="zdtyukd";
     //將密碼使用KEY完成加密KEY=zdtyukd
        byte[] encryptResult = AES256.encrypt(pswRandom.toString(), passwordkey); 	
		
		
     //設定新密碼到資料庫
//     memberVO.setMem_psw(psw64);
     memberVO.setMem_psw(aes256.parseByte2HexStr(encryptResult));
     
     memberSvc.updateMembe(memberVO);
     //設定mail資訊
     to = memberVO.getMem_email();
     subject = "會員密碼";
     body ="您的新密碼為:" + pswRandom + "，登入後請記得更改您的密碼"; 
       try
       {
          Session session = Session.getDefaultInstance(properties,  
             new javax.mail.Authenticator() {
             protected PasswordAuthentication 
             getPasswordAuthentication() {
             return new 
             PasswordAuthentication(from, password);
             }});
          Message message = new MimeMessage(session);
          message.setFrom(new InternetAddress(from));
          message.setRecipients(Message.RecipientType.TO, 
             InternetAddress.parse(to));
          message.setSubject(subject);
          message.setText(body);
          Transport.send(message);
       }
       catch(Exception e)
       {
          ret = "error";
          e.printStackTrace();
       }
       return ret;
    }
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	 
	 
}
