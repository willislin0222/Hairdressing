package com.offer.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;

@MultipartConfig(fileSizeThreshold = 10240 * 1024, maxFileSize = 50000 * 1024 * 1024, maxRequestSize = 5000 * 5 * 1024
* 1024)

public class OfferServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//新增
		if("addoffer".equals(action)){
			Collection<Part> parts = req.getParts();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try{
				/*****1.接收請求參數，錯誤處理******/
				String off_title = req.getParameter("off_title").trim();
				if(off_title.equals("")){
					errorMsgs.add("請輸入優惠標題");
				}				
				String off_content = req.getParameter("off_content").trim();
				if(off_content.equals("")){
					errorMsgs.add("請輸入優惠內容");
				}
				byte[] off_image=null;
				int count=0;
				
				for(Part part : parts){
					count++;
					if(count==3){
						InputStream in = part.getInputStream();
						off_image = new byte[in.available()];
						in.read(off_image);
						in.close();
						if (off_image.length == 0) {
			
							errorMsgs.add("請選擇優惠圖片");
						}
					}
				}
				Date off_start = null;
				try {
					off_start = java.sql.Date.valueOf(req.getParameter("off_start").trim());
				} catch (IllegalArgumentException e) {
					off_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入優惠開始日期");
				}
				Date off_end = null;
				try {
					off_end = java.sql.Date.valueOf(req.getParameter("off_end").trim());
				} catch (IllegalArgumentException e) {
					off_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入優惠結束日期");
				}
				
				Integer off_status = new Integer(req.getParameter("off_status"));			
				OfferVO offerVO = new OfferVO();
				offerVO.setOff_title(off_title);
				offerVO.setOff_content(off_content);
				offerVO.setOff_image(off_image);
				offerVO.setOff_start(off_start);
				offerVO.setOff_end(off_end);
				offerVO.setOff_status(off_status);
				if(!errorMsgs.isEmpty()){
					req.setAttribute("offerVO", offerVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/offer/addOffer.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*****2.開始新增資料******/
				OfferService offerSvc = new OfferService();
				offerSvc.addOffer(off_title, off_content, off_image, off_start, off_end, off_status);
				/*****3.新增成功轉交******/
				String url = "/offer/listAllOffer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				
			}catch(Exception e){
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/addOffer.jsp");
				successView.forward(req, res);
			}
		}
		
		
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			/*****1.接收請求參數，錯誤處理******/
			try {
				String off_no = req.getParameter("off_no");
				
				/*****2.開始查詢資料******/
				OfferService offerSvc = new OfferService();
				OfferVO offerVO = offerSvc.getOneOffer(off_no);
				
				/*****3.查詢成功轉交******/
				req.setAttribute("offerVO", offerVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/updateOffer.jsp");// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("查詢資料失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/listAllOffer.jsp");// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			}
			
		}
		
		if("update".equals(action)){
			Collection<Part> parts = req.getParts();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.接收請求參數，錯誤處理******/
				String off_no = req.getParameter("off_no");
				String off_title=req.getParameter("off_title").trim();
				if(off_title.equals("") || off_title == null){
					errorMsgs.add("請輸入優惠標題");
				}
				
				String off_content=req.getParameter("off_content").trim();
				if(off_content.equals("") || off_content == null){
					errorMsgs.add("請輸入優惠內容");
				}
				
				int count=0;
				byte[] off_image= null;
				for(Part part:parts){
					count++;
					if(count == 3){
						InputStream in = part.getInputStream();
						off_image = new byte[in.available()];
						in.read(off_image);
						in.close();
						if (off_image.length == 0) {
							OfferService offerSvc = new OfferService();
							off_image = offerSvc.getOneOffer(off_no).getOff_image();
						}
					}
				}
				
				Date off_start = java.sql.Date.valueOf(req.getParameter("off_start"));
				Date off_end = java.sql.Date.valueOf(req.getParameter("off_end"));
				
				Integer off_status = new Integer(req.getParameter("off_status"));

				
				OfferVO offerVO = new OfferVO();
				offerVO.setOff_no(off_no);
				offerVO.setOff_title(off_title);
				offerVO.setOff_content(off_content);
				offerVO.setOff_image(off_image);
				offerVO.setOff_start(off_start);
				offerVO.setOff_end(off_end);
				offerVO.setOff_status(off_status);
				if(!errorMsgs.isEmpty()){
					req.setAttribute("offerVO", offerVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/offer/updateOffer.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}		
				/*****2.開始修改資料******/
				OfferService offerSvc = new OfferService();
				offerSvc.updateOffer(off_no, off_title, off_content, off_image, off_start, off_end, off_status);
		
				/*****修改成功轉交******/
				req.setAttribute("offerVO", offerVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/listAllOffer.jsp");// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
			}catch(Exception e){
				errorMsgs.add("修改資料失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/updateOffer.jsp");// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			}
		}
		//刪除
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*****1.接收請求參數，錯誤處理******/
				String off_no = req.getParameter("off_no");
				/*****2.開始刪除資料******/
				OfferService offerSvc = new OfferService();
				offerSvc.delete(off_no);
				/*****3.刪除成功轉交******/
				String url = "/offer/listAllOffer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/offer/listAllOffer.jsp");// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			}
		}
		
		//查詢一筆
		if("get_one_Offer".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);			
			try{
				/*****1.接收請求參數，錯誤處理******/
				String off_no = req.getParameter("off_no").trim();
				if(off_no.equals("") || off_no==null){
					errorMsgs.add("請輸入優惠編號");
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
		
				/*****2.開始查詢資料******/
				OfferService offerSvc = new OfferService();
				OfferVO offerVO = offerSvc.getOneOffer(off_no);
				if(offerVO == null){
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				/*****3.查詢成功轉交******/
				req.setAttribute("offerVO",offerVO);
				RequestDispatcher successView = req.getRequestDispatcher("/offer/listOneOffer.jsp");
				successView.forward(req, res);
				
			}catch(Exception e){
				errorMsgs.add("無法取得資料");
				RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
				successView.forward(req, res);
			}
		}
	}

}
