package com.orderlist.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.morder.model.MorderVO;
import com.offer.model.OfferService;
import com.offer.model.OfferVO;
import com.orderlist.model.OrderListService;
import com.orderlist.model.OrderListVO;
import com.product.model.ProductVO;

public class OrderListServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		
		//新增訂單明細
		if("addorderlist".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*****1.取得參數、錯誤處理******/
				
			try {
				String mord_no = req.getParameter("mord_no").trim();	
				
				String pro_no = req.getParameter("pro_no").trim();
		
				
				Integer ordl_number = new Integer(req.getParameter("ordl_number").trim());
					
				
				OrderListVO orderlistVO = new OrderListVO();
				
				MorderVO morderVO =new MorderVO();
				morderVO.setMord_no(mord_no);
				orderlistVO.setMorderVO(morderVO);
				
				ProductVO productVO = new ProductVO();
				productVO.setPro_no(pro_no);
				orderlistVO.setProductVO(productVO);
				
				orderlistVO.setOrdl_number(ordl_number);

		
				if(!errorMsgs.isEmpty()){
					req.setAttribute("orderlistVO", orderlistVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/orderlist/addOrderLsit.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*********2.新增資料*************/
				OrderListService orderlistSvc = new OrderListService();
				orderlistSvc.addOrderList(mord_no, pro_no, ordl_number);
				
				/*********3.新增成功轉交*************/
				String url = "/orderlist/listAllOrderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/addOrderList.jsp");
				successView.forward(req, res);
			}
			
			
		}
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			/*****1.接收請求參數，錯誤處理******/
			try {
				String mord_no = req.getParameter("mord_no");
				String pro_no = req.getParameter("pro_no");
				
				/*****2.開始查詢資料******/
				OrderListService orderListSvc = new OrderListService();
				OrderListVO orderListVO = orderListSvc.getOneOrderList(mord_no, pro_no);
						
				/*****3.查詢成功轉交******/
				req.setAttribute("orderListVO", orderListVO);
						
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/updateOrderList.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("查詢資料失敗" + e.getMessage());
						
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/listAllOrderList.jsp");
				successView.forward(req, res);
			}
					
		}
				
		if("update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			try{
				/*****1.接收請求參數，錯誤處理******/
				String mord_no = req.getParameter("mord_no").trim();
				String pro_no = req.getParameter("pro_no").trim();						
				Integer ordl_number = new Integer(req.getParameter("ordl_number").trim());
			
						
				OrderListVO orderListVO = new OrderListVO();

				MorderVO morderVO =new MorderVO();
				morderVO.setMord_no(mord_no);
				orderListVO.setMorderVO(morderVO);
				
				ProductVO productVO = new ProductVO();
				productVO.setPro_no(pro_no);
				orderListVO.setProductVO(productVO);
				
				orderListVO.setOrdl_number(ordl_number);
			
				if(!errorMsgs.isEmpty()){
					req.setAttribute("orderListVO", orderListVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/orderlist/updateOrderListVO.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}		
				/*****2.開始修改資料******/
				OrderListService orderListSvc = new OrderListService();
				orderListSvc.updateOrderList(mord_no, pro_no, ordl_number);
				
				/*****修改成功轉交******/
				req.setAttribute("orderListVO", orderListVO);
						
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/listAllOrderList.jsp");
				successView.forward(req, res);
						
			}catch(Exception e){
				errorMsgs.add("修改資料失敗" + e.getMessage());
						
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/updateOrderList.jsp");// 
				successView.forward(req, res);
			}
		}
		
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****1.取得參數、錯誤處理******/
				String mord_no = req.getParameter("mord_no");
				String pro_no = req.getParameter("pro_no");

				/*********2.刪除資料*************/
				OrderListService orderListSvc = new OrderListService();
				orderListSvc.delete(mord_no, pro_no);
				
				/*********3.刪除成功轉交*************/
				String url = "/orderlist/listAllOrderList.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("刪除失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/listAllMember.jsp");
				successView.forward(req, res);
			}

		}
		
		//查詢一筆
		if("get_one_orderList".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);			
			try{
				/*****1.接收請求參數，錯誤處理******/

				String mord_no = req.getParameter("mord_no").trim();
				if(mord_no.equals("") || mord_no==null){
					errorMsgs.add("請輸入訂單明細編號");
				}
								
				String pro_no = req.getParameter("pro_no").trim();
				if(pro_no.equals("") || pro_no==null){
					errorMsgs.add("請輸入商品編號");
				}
			
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
		
				/*****2.開始查詢資料******/
				OrderListService orderListSvc = new OrderListService();
				OrderListVO orderListVO = orderListSvc.getOneOrderList(mord_no, pro_no);
				if(orderListVO == null){
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				/*****3.查詢成功轉交******/
				req.setAttribute("orderListVO",orderListVO);
				RequestDispatcher successView = req.getRequestDispatcher("/orderlist/listOneOrderList.jsp");
				successView.forward(req, res);
					
			}catch(Exception e){
				errorMsgs.add("無法取得資料");
				RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
			}
		}
	}

}
