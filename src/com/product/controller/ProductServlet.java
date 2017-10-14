package com.product.controller;

import java.io.IOException;
import java.io.InputStream;
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

import com.product.model.ProductService;
import com.product.model.ProductVO;

@MultipartConfig(fileSizeThreshold = 10240 * 1024, maxFileSize = 50000 * 1024 * 1024, maxRequestSize = 5000 * 5 * 1024
* 1024)

public class ProductServlet extends HttpServlet {
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		//新增
		if("addProduct".equals(action)){
			Collection<Part> parts = req.getParts();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				/*****1.接收請求參數，錯誤處理******/
				String pro_name = req.getParameter("pro_name").trim();
				if(pro_name.equals("") || pro_name == null){
					errorMsgs.add("請輸入商品名稱");
				}
				
				String pro_desc = req.getParameter("pro_desc").trim();
				if(pro_desc.equals("") || pro_desc == null){
					errorMsgs.add("請輸入商品描述");
				}
				
				String pro_pricetemp = req.getParameter("pro_price").trim();
				Integer pro_price = null;
				if(pro_pricetemp.equals("") || pro_pricetemp == null){
					errorMsgs.add("請輸入商品單價");
				}else{	
					try{
						pro_price = new Integer(pro_pricetemp);
					}catch(NumberFormatException e){
						errorMsgs.add("請輸入正確的金額數字");
					}
				}
				
				int count=0;
				byte[]  pro_image1=null;
				byte[]  pro_image2=null;
				byte[]  pro_image3=null;
				byte[]  pro_image4=null;
				for(Part part:parts){
					count++;				
					if(count==4){
						InputStream in = part.getInputStream();
						pro_image1 = new byte[in.available()];
						in.read(pro_image1);
						in.close();
						if (pro_image1.length == 0) {
			
							errorMsgs.add("請選擇商品圖片1");
						}
					}
					if(count==5){
						InputStream in = part.getInputStream();
						pro_image2 = new byte[in.available()];
						in.read(pro_image2);
						in.close();
					}
					if(count==6){
						InputStream in = part.getInputStream();
						pro_image3 = new byte[in.available()];
						in.read(pro_image3);
						in.close();
					}
					if(count==7){
						InputStream in = part.getInputStream();
						pro_image4 = new byte[in.available()];
						in.read(pro_image4);
						in.close();
					}
									
				}
				
				Integer pro_number = new Integer(req.getParameter("pro_number"));
				
				
				ProductVO productVO = new ProductVO();
				productVO.setPro_name(pro_name);
				productVO.setPro_desc(pro_desc);
				productVO.setPro_price(pro_price);
				productVO.setPro_image1(pro_image1);
				productVO.setPro_image2(pro_image2);
				productVO.setPro_image3(pro_image3);
				productVO.setPro_image4(pro_image4);
				productVO.setPro_number(pro_number);
				if(!errorMsgs.isEmpty()){
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/product/addProduct.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/*****2.開始新增資料******/
				ProductService productSvc = new ProductService();
				productSvc.addProduct(pro_name, pro_desc, pro_price, pro_image1, pro_image2, pro_image3, pro_image4, pro_number);
				
				/*****3.新增成功轉交******/
				String url = "/product/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			
			}catch(Exception e){
				errorMsgs.add("新增失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/product/addProduct.jsp");
				successView.forward(req, res);
			}
			
		}
		
		//修改
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			
			
			try{
				
				/*****1.接收請求參數，錯誤處理******/
				String pro_no = req.getParameter("pro_no");
				
				/*****2.查詢資料******/
				ProductService productSvc = new ProductService();
				ProductVO productVO = productSvc.getOneProduct(pro_no);
				
				/*****3.轉交資料******/
				req.setAttribute("productVO", productVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/product/updateProduct.jsp");
				successView.forward(req, res);
				
			}catch(Exception e){
				
			}
			
		}
		
		if("update".equals(action)){
			Collection<Part> parts = req.getParts();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try{
				/*****1.接收請求參數，錯誤處理******/
				String pro_no = req.getParameter("pro_no").trim();
				System.out.println(pro_no);		
				String pro_name = req.getParameter("pro_name").trim();
				if(pro_name.equals("") || pro_name == null){
					errorMsgs.add("請輸入商品名稱");
				}
				
				String pro_desc = req.getParameter("pro_desc").trim();
				if(pro_desc.equals("") || pro_desc == null){
					errorMsgs.add("請輸入商品描述");
				}
				
				String pro_pricetemp = req.getParameter("pro_price").trim();
				Integer pro_price = null;
				if(pro_pricetemp.equals("") || pro_pricetemp == null){
					errorMsgs.add("請輸入商品單價");
				}else{	
					try{
						pro_price = new Integer(pro_pricetemp);
					}catch(NumberFormatException e){
						errorMsgs.add("請輸入正確的金額數字");
					}
				}
				
				int count=0;
				byte[]  pro_image1=null;
				byte[]  pro_image2=null;
				byte[]  pro_image3=null;
				byte[]  pro_image4=null;
				for(Part part:parts){
					count++;				
					if(count==4){
						InputStream in = part.getInputStream();
						pro_image1 = new byte[in.available()];
						in.read(pro_image1);
						in.close();
						if (pro_image1.length == 0) {
							ProductService productSvc = new ProductService();
							pro_image1 = productSvc.getOneProduct(pro_no).getPro_image1();
							
						}
					}
					if(count==5){
						InputStream in = part.getInputStream();
						pro_image2 = new byte[in.available()];
						in.read(pro_image2);
						in.close();
						if (pro_image2.length == 0) {
							ProductService productSvc = new ProductService();
							pro_image2 = productSvc.getOneProduct(pro_no).getPro_image2();
							
						}
					}
					if(count==6){
						InputStream in = part.getInputStream();
						pro_image3 = new byte[in.available()];
						in.read(pro_image3);
						in.close();
						if (pro_image3.length == 0) {
							ProductService productSvc = new ProductService();
							pro_image3 = productSvc.getOneProduct(pro_no).getPro_image3();
							
						}
					}
					if(count==7){
						InputStream in = part.getInputStream();
						pro_image4 = new byte[in.available()];
						in.read(pro_image4);
						in.close();
						if (pro_image4.length == 0) {
							ProductService productSvc = new ProductService();
							pro_image4 = productSvc.getOneProduct(pro_no).getPro_image4();
							
						}
					}
									
				}
				
				Integer pro_number = new Integer(req.getParameter("pro_number"));
				
				
				ProductVO productVO = new ProductVO();
				productVO.setPro_no(pro_no);
				productVO.setPro_name(pro_name);
				productVO.setPro_desc(pro_desc);
				productVO.setPro_price(pro_price);
				productVO.setPro_image1(pro_image1);
				productVO.setPro_image2(pro_image2);
				productVO.setPro_image3(pro_image3);
				productVO.setPro_image4(pro_image4);
				productVO.setPro_number(pro_number);
				if(!errorMsgs.isEmpty()){
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/product/updateProduct.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				/*****2.開始修改資料******/
				ProductService productSvc = new ProductService();
				productSvc.update(pro_no, pro_name, pro_desc, pro_price, pro_image1, pro_image2, pro_image3, pro_image4, pro_number);
				
				/*****3.修改成功轉交******/
				String url = "/product/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			
			}catch(Exception e){
				errorMsgs.add("修改失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/product/updateProduct.jsp");
				successView.forward(req, res);
			}
		}
		
		//刪除
		if("delete".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*****1.接收請求參數，錯誤處理******/
				String pro_no = req.getParameter("pro_no");
				System.out.println(pro_no);					
				/*****2.刪除資料******/
				ProductService productSvc = new ProductService();
				productSvc.delete(pro_no);
				
				/*****3.刪除成功轉交******/
				String url = "/product/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除失敗" + e.getMessage());
				
				RequestDispatcher successView = req.getRequestDispatcher("/product/listAllProduct.jsp");
				successView.forward(req, res);
			}
			
		}
		
		//查詢一筆
		if("get_one_Product".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				/*****1.接收請求參數，錯誤處理******/
				String pro_no = req.getParameter("pro_no").trim();
				if(pro_no.equals("") || pro_no == null){
					errorMsgs.add("請輸入商品編號");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				
				/*****2.查詢資料******/
				ProductService productSvc = new ProductService();
				ProductVO productVO = productSvc.getOneProduct(pro_no);
				if(productVO == null){
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()){
					RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
					successView.forward(req, res);
					return;
				}
				/*****3.刪除成功轉交******/
				req.setAttribute("productVO", productVO);
				RequestDispatcher successView = req.getRequestDispatcher("/product/listOneProduct.jsp");
				successView.forward(req, res);
				
			}catch(Exception e){
				errorMsgs.add("查無資料");
				
				RequestDispatcher successView = req.getRequestDispatcher("/select_page.jsp");
				successView.forward(req, res);
			}
		}
	}

}
