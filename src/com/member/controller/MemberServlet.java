package com.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberService;
import com.member.model.MemberVO;


public class MemberServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		
		//新增會員
		if("addmember".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*****1.取得參數、錯誤處理******/
				
			try {
				String mem_name = req.getParameter("mem_name").trim();
				if(mem_name.equals("") || mem_name == null){
					errorMsgs.add("請輸入您的姓名");
				}
				
				String mem_id = req.getParameter("mem_id").trim();
				if(mem_id.equals("") || mem_id == null){
					errorMsgs.add("請輸入您的帳號");
				}
				
				String mem_psw = req.getParameter("mem_psw").trim();
				if(mem_psw.equals("") || mem_psw == null){
					errorMsgs.add("請輸入您的密碼");
				}
				
				Date mem_birthday=null;
				try {
					mem_birthday = java.sql.Date.valueOf(req.getParameter("mem_birthday").trim());
				} catch (IllegalArgumentException e) {
					mem_birthday = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入您的生日");
				}				
				
				String mem_email = req.getParameter("mem_email").trim();
				if(mem_email.equals("") || mem_email == null){
					errorMsgs.add("請輸入您的E-MAIL");
				}
				
				String mem_mobile = req.getParameter("mem_mobile").trim();
				if(mem_mobile.equals("") || mem_mobile == null){
					errorMsgs.add("請輸入您的電話");
				}
				
				Date mem_joindate =new java.sql.Date(System.currentTimeMillis());
		
				
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_name(mem_name);
				memberVO.setMem_id(mem_id);
				memberVO.setMem_psw(mem_psw);
				memberVO.setMem_birthday(mem_birthday);
				memberVO.setMem_email(mem_email);
				memberVO.setMem_mobile(mem_mobile);
				memberVO.setMem_joindate(mem_joindate);
		
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memberVO", memberVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/addMember.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*********2.新增資料*************/
				MemberService memberSvc = new MemberService();
				MemberVO checkmemberVO = memberSvc.getOneMemberBymemid(mem_id);
				System.out.println(checkmemberVO.getMem_no());
				//判斷此帳號是否有人註冊過
				if(checkmemberVO.getMem_id() != null){
					errorMsgs.add("此帳號已有人申請");
				}
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memberVO", memberVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/addMember.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				memberSvc.addOMember(mem_name, mem_id, mem_psw, mem_birthday, mem_email, mem_mobile, mem_joindate);
				
				/*********3.新增成功轉交*************/
				String url = "/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/addMember.jsp");
				successView.forward(req, res);
			}
			
			
		}
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****1.取得參數、錯誤處理******/
				String mem_no = req.getParameter("mem_no");

				/*********2.查詢修改資料*************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(mem_no);
				
				/*********3.查詢成功轉交*************/
				req.setAttribute("memberVO", memberVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/updateMember.jsp");
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("查詢失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/listAllMember.jsp");
				successView.forward(req, res);
			}
		}
		
		if("update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			/*****1.取得參數、錯誤處理******/
				
			try {
				String mem_no = req.getParameter("mem_no").trim();
			
				String mem_name = req.getParameter("mem_name").trim();
				if(mem_name.equals("") || mem_name == null){
					errorMsgs.add("請輸入您的姓名");
				}
				
				String mem_id = req.getParameter("mem_id").trim();
				
				String mem_psw = req.getParameter("mem_psw").trim();
				if(mem_psw.equals("") || mem_psw == null){
					errorMsgs.add("請輸入您的密碼");
				}				
				Date mem_birthday=null;
				try {
					mem_birthday = java.sql.Date.valueOf(req.getParameter("mem_birthday").trim());
				} catch (IllegalArgumentException e) {
					mem_birthday = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入您的生日");
				}				
				
				String mem_email = req.getParameter("mem_email").trim();
				if(mem_email.equals("") || mem_email == null){
					errorMsgs.add("請輸入您的E-MAIL");
				}
				
				String mem_mobile = req.getParameter("mem_mobile").trim();
				if(mem_mobile.equals("") || mem_mobile == null){
					errorMsgs.add("請輸入您的電話");
				}
				
				MemberService memberSvc = new MemberService();
				Date mem_joindate =memberSvc.getOneMember(mem_no).getMem_joindate();
		
				
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(mem_no);
				memberVO.setMem_name(mem_name);
				memberVO.setMem_id(mem_id);
				memberVO.setMem_psw(mem_psw);
				memberVO.setMem_birthday(mem_birthday);
				memberVO.setMem_email(mem_email);
				memberVO.setMem_mobile(mem_mobile);
				memberVO.setMem_joindate(mem_joindate);
		
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memberVO", memberVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/updateMember.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*********2.新增資料*************/
				memberSvc.updateMember(mem_no, mem_name, mem_id, mem_psw, mem_birthday, mem_email, mem_mobile, mem_joindate);
				
				/*********3.新增成功轉交*************/
				String url = "/member/listAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/updateMember.jsp");
				successView.forward(req, res);
			}
		}
		
		//刪除
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****1.取得參數、錯誤處理******/
				String mem_no = req.getParameter("mem_no");

				/*********2.刪除資料*************/
				MemberService memberSvc = new MemberService();
				memberSvc.delete(mem_no);
				
				/*********3.刪除成功轉交*************/
				String url = "/member/listAllMember.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("刪除失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/listAllMember.jsp");
				successView.forward(req, res);
			}

		}
		
		//查詢一筆
			if("get_one_Member".equals(action)){
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);			
				try{
					/*****1.接收請求參數，錯誤處理******/
					String mem_no = req.getParameter("mem_no").trim();
					if(mem_no.equals("") || mem_no==null){
						errorMsgs.add("請輸入會員編號");
					}
					
					if(!errorMsgs.isEmpty()){
						RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
						successView.forward(req, res);
						return;
					}
			
					/*****2.開始查詢資料******/
					MemberService memberSvc = new MemberService();
					MemberVO memberVO = memberSvc.getOneMember(mem_no);
					if(memberVO == null){
						errorMsgs.add("查無資料");
					}
					if(!errorMsgs.isEmpty()){
						RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
						successView.forward(req, res);
						return;
					}
					/*****3.查詢成功轉交******/
					req.setAttribute("memberVO",memberVO);
					RequestDispatcher successView = req.getRequestDispatcher("/member/listOneMember.jsp");
					successView.forward(req, res);
						
				}catch(Exception e){
					errorMsgs.add("無法取得資料");
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
						successView.forward(req, res);
				}
			}
			
		//會員登入
		if("login".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			
			try{
				
				/*----1.接收請求參數，錯誤處理--------*/
				String mem_id = req.getParameter("mem_id");
				if(mem_id.equals("") || mem_id == null){
					errorMsgs.add("帳號請勿空白");
				}
				String mem_psw = req.getParameter("mem_psw");
				if(mem_psw.equals("") || mem_psw == null){
					errorMsgs.add("密碼請勿空白");
				}
				
		
				
				if(!errorMsgs.isEmpty()){
//					req.setAttribute("memberVO", memberVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/login.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*----2.查詢資料--------*/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMemberBymemid(mem_id);
				HttpSession session = req.getSession();
				
				if(memberVO.getMem_no() == null){
					System.out.println("無此帳號無此帳號");
					errorMsgs.add("無此帳號");	
				}else if(mem_psw.equals(memberVO.getMem_psw())){
					session.setAttribute("memberVO", memberVO);
					System.out.println("登入成功");
				}else{
					System.out.println("密碼錯誤");
					errorMsgs.add("密碼錯誤");	
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("login.jsp");
					successView.forward(req, res);
					return;
				}
				
				/*----3.登入成功轉交--------*/
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 登入成功後轉交index.jsp
				successView.forward(req, res);
				
			}catch(Exception e){
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/login.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
