package com.product.actions;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.product.model.ProductService;
import com.product.model.ProductVO;

public class ProductImage extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

			try {
				String pro_no=req.getParameter("pro_no");
				String imglist=req.getParameter("imglist");
				ProductService productSve = new ProductService();
				ProductVO productVO = productSve.getOneProduct(pro_no);
				
				byte[] proimg=null;
				if(imglist.equals("1")){
					proimg = productVO.getPro_image1();
				}else if(imglist.equals("2")){
					proimg = productVO.getPro_image2();
				}else if(imglist.equals("3")){
					proimg = productVO.getPro_image3();
				}else if(imglist.equals("4")){
					proimg = productVO.getPro_image4();
				}
							
				out.write(proimg);
	
			} catch (Exception e) {
				System.out.println("沒有圖片");
			}

	}
}
