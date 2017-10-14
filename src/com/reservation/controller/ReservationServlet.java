package com.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.morder.model.MorderService;
import com.morder.model.MorderVO;
import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;

public class ReservationServlet extends HttpServlet {
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addreservation".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*****1.取得參數、錯誤處理******/
				
			try {
				String mem_no = req.getParameter("mem_no").trim();
				
				String res_datetemp = req.getParameter("res_date").trim();
				if(res_datetemp.equals("") || res_datetemp == null){
					errorMsgs.add("請輸入您要預約的日期");
				}
				
				Date res_date = null;
				try{
					res_date = java.sql.Date.valueOf(res_datetemp);
				}catch(Exception e){
					res_date = new java.sql.Date(System.currentTimeMillis());
				}
				
				String res_timestart = req.getParameter("res_timestart").trim();
				if(res_timestart.equals("") || res_timestart == null){
					errorMsgs.add("請選擇您要預約的開始時間");
				}
				
				String res_timeend = req.getParameter("res_timeend").trim();
				if(res_timeend.equals("") || res_timeend == null){
					errorMsgs.add("請選擇您要預約的結束時間");
				}
				
				String res_content = req.getParameter("res_content").trim();
				if(res_content.equals("") || res_content == null){
					errorMsgs.add("請選擇您要做的處理");
				}
				
			
			
				ReservationVO reservationVO = new ReservationVO();
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(mem_no);
				reservationVO.setMemberVO(memberVO);
				reservationVO.setRes_date(res_date);
				reservationVO.setRes_timestart(res_timestart);
				reservationVO.setRes_timeend(res_timeend);

		
				if(!errorMsgs.isEmpty()){
					req.setAttribute("reservationVO", reservationVO);				
					RequestDispatcher failureView = req
							.getRequestDispatcher("/reservation/addReservation.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*********2.新增資料*************/
				ReservationService reservationSvc = new ReservationService();
				reservationSvc.addReservation(mem_no, res_date, res_content, res_timestart, res_timeend);
				
				/*********3.新增成功轉交*************/
				String url = "/reservation/listAllReservation.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/reservation/addReservation.jsp");
				successView.forward(req, res);
			}
		}
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
				
			try{
				/*****1.取得參數、錯誤處理******/
				String res_no = req.getParameter("res_no").trim();
			
				/*********2.查詢資料*************/
				ReservationService reservationSvc = new ReservationService();
				ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);

				/*********3.查詢成功轉交*************/
				req.setAttribute("reservationVO", reservationVO);
				String url = "/reservation/updateReservation.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);
								
					
			}catch(Exception e){
				errorMsgs.add("查詢失敗" + e.getMessage());
						
				RequestDispatcher successView = req.getRequestDispatcher("/reservation/listAllReservation.jsp");
				successView.forward(req, res);
			}
		}
				
				if("update".equals(action)){
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					
					try{
						/*****1.取得參數、錯誤處理******/					
						String res_no = req.getParameter("res_no");
						String mem_no = req.getParameter("mem_no");
						String res_datetemp = req.getParameter("res_date").trim();
						if(res_datetemp.equals("") || res_datetemp == null){
							errorMsgs.add("請輸入您要預約的日期");
						}
						
						Date res_date = null;
						try{
							res_date = java.sql.Date.valueOf(res_datetemp);
						}catch(Exception e){
							res_date = new java.sql.Date(System.currentTimeMillis());
						}
						
						String res_timestart = req.getParameter("res_timestart").trim();
						if(res_timestart.equals("") || res_timestart == null){
							errorMsgs.add("請選擇您要預約的開始時間");
						}
						
						String res_timeend = req.getParameter("res_timeend").trim();
						if(res_timeend.equals("") || res_timeend == null){
							errorMsgs.add("請選擇您要預約的結束時間");
						}
						
						String res_content = req.getParameter("res_content").trim();
						if(res_content.equals("") || res_content == null){
							errorMsgs.add("請選擇您要做的處理");
						}
						
						ReservationVO reservationVO = new ReservationVO();
						reservationVO.setRes_no(res_no);
						MemberVO memberVO = new MemberVO();
						memberVO.setMem_no(mem_no);
						reservationVO.setMemberVO(memberVO);
						reservationVO.setRes_date(res_date);
						reservationVO.setRes_timestart(res_timestart);
						reservationVO.setRes_timeend(res_timeend);
						if(!errorMsgs.isEmpty()){
							req.setAttribute("reservationVO", reservationVO);
							RequestDispatcher failureView = req
									.getRequestDispatcher("/reservation/updateReservation.jsp");
							failureView.forward(req, res);
							return; //程式中斷
						}	
						
						/*********2.修改資料*************/
						ReservationService reservationSvc = new ReservationService();
						reservationSvc.updateReservation(res_no, mem_no, res_content, res_date, res_timestart, res_timeend);

						/*********3.修改成功轉交*************/
						req.setAttribute("reservationVO", reservationVO);
						String url = "/reservation/listAllReservation.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						
						successView.forward(req, res);
								
						
					}catch(Exception e){
						errorMsgs.add("修改失敗" + e.getMessage());
						
						RequestDispatcher successView = req.getRequestDispatcher("/reservation/updateReservation.jsp");
						successView.forward(req, res);
					}
				}
				
				//刪除
				if("delete".equals(action)){
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					
					try{
						/*****1.取得參數、錯誤處理******/
						String res_no = req.getParameter("res_no").trim();
			
						
						/*********2.刪除資料*************/
						ReservationService reservationSvc = new ReservationService();
						reservationSvc.delete(res_no);
					
						
						/*********3.刪除成功轉交*************/
						String url = "/reservation/listAllReservation.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						
						
					}catch(Exception e){
						errorMsgs.add("刪除失敗" + e.getMessage());
						
						RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
						successView.forward(req, res);
					}
					
				}
				
				//查詢一筆
				if("get_one_Reservation".equals(action)){
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					
					try{
						/*****1.取得參數、錯誤處理******/
						String res_no = req.getParameter("res_no").trim();
						if(res_no == null || res_no.equals("")){
							errorMsgs.add("請輸入預約編號");
						}
						if(!errorMsgs.isEmpty()){
							RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
							successView.forward(req, res);
							return;
						}
						
						/*********2.查詢資料*************/
						ReservationService reservationSvc = new ReservationService();
						ReservationVO reservationVO = reservationSvc.getOneReservation(res_no);
						if(reservationVO == null){
							errorMsgs.add("查無資料");
						}
						if(!errorMsgs.isEmpty()){
							RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
							successView.forward(req, res);
							return;
						}
						
						/*********3.查詢成功轉交*************/
						req.setAttribute("reservationVO", reservationVO);
						String url = "/reservation/listOneReservation.jsp";
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
