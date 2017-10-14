package com.morder.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberVO;
import com.morder.model.MorderService;
import com.morder.model.MorderVO;

public class MorderServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");	
		String action = req.getParameter("action");
		
		if("addmorder".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.取得參數、錯誤處理******/
				String mem_no = req.getParameter("mem_no");
				Integer mord_price =new Integer(req.getParameter("mord_price"));
				
				Date mord_createdate =new java.sql.Date(System.currentTimeMillis());
				
				Integer mord_status = 0;
				
				MorderVO morderVO = new MorderVO();
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(mem_no);
				morderVO.setMemberVO(memberVO);
				morderVO.setMord_price(mord_price);
				morderVO.setMord_createdate(mord_createdate);
				morderVO.setMord_status(mord_status);
				
				/*********2.新增資料*************/
				MorderService morderSvc = new MorderService();
				morderSvc.addMorder(mem_no, mord_price, mord_createdate, mord_status);

				/*********3.新增成功轉交*************/
				String url = "/morder/listAllMorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
						
				
			}catch(Exception e){
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/morder/addMorder.jsp");
				successView.forward(req, res);
			}
		}
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.取得參數、錯誤處理******/
				String mord_no = req.getParameter("mord_no").trim();
			
				/*********2.查詢資料*************/
				MorderService morderSvc = new MorderService();
				MorderVO morderVO = morderSvc.getOneMorder(mord_no);

				/*********3.查詢成功轉交*************/
				req.setAttribute("morderVO", morderVO);
				String url = "/morder/updateMorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
						
				
			}catch(Exception e){
				errorMsgs.add("查詢失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/morder/listAllMorder.jsp");
				successView.forward(req, res);
			}
		}
		
		if("update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.取得參數、錯誤處理******/
				String mord_no = req.getParameter("mord_no");
				String mem_no = req.getParameter("mem_no");
				Integer mord_price =new Integer(req.getParameter("mord_price"));
				
				Date mord_createdate =java.sql.Date.valueOf(req.getParameter("mord_createdate"));
				
				Integer mord_status = new Integer(req.getParameter("mord_status"));
				
				MorderVO morderVO = new MorderVO();
				morderVO.setMord_no(mord_no);
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(mem_no);
				morderVO.setMemberVO(memberVO);
				morderVO.setMord_price(mord_price);
				morderVO.setMord_createdate(mord_createdate);
				morderVO.setMord_status(mord_status);
				
				/*********2.修改資料*************/
				MorderService morderSvc = new MorderService();
				morderSvc.updateMorder(mord_no, mem_no, mord_price, mord_createdate, mord_status);

				/*********3.新增成功轉交*************/
				req.setAttribute("morderVO", morderVO);
				String url = "/morder/listAllMorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
						
				
			}catch(Exception e){
				errorMsgs.add("修改失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/morder/updateMorder.jsp");
				successView.forward(req, res);
			}
		}
		
		//刪除
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.取得參數、錯誤處理******/
				String mord_no = req.getParameter("mord_no").trim();
	
				
				/*********2.刪除資料*************/
				MorderService morderSvc = new MorderService();
				morderSvc.delete(mord_no);
			
				
				/*********3.刪除成功轉交*************/
				String url = "/morder/listAllMorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				
			}catch(Exception e){
				errorMsgs.add("刪除失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
				successView.forward(req, res);
			}
			
		}
		//查詢一筆
		if("get_one_Morder".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.取得參數、錯誤處理******/
				String mord_no = req.getParameter("mord_no").trim();
				if(mord_no == null || mord_no.equals("")){
					errorMsgs.add("請輸入訂單編號");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				
				/*********2.查詢資料*************/
				MorderService morderSvc = new MorderService();
				MorderVO morderVO = morderSvc.getOneMorder(mord_no);
				if(morderVO == null){
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				
				/*********3.查詢成功轉交*************/
				req.setAttribute("morderVO", morderVO);
				String url = "/morder/listOneMorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
				
				
			}catch(Exception e){
				errorMsgs.add("查無資料" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
				successView.forward(req, res);
			}
			
		}
	}

}
