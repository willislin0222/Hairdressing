package com.product.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;
import com.opensymphony.xwork2.ActionSupport;
import com.product.model.ProductService;
import com.product.model.ProductVO;

public class ProductManagerAction extends ActionSupport{
	private String pro_no;

	//取得修改優惠資料
	public String getOne_For_Update(){
		ProductService productSvc = new ProductService();
		ProductVO productVO = productSvc.getOneProduct(pro_no);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("productVO", productVO);
		return "success";
				
	}
	//刪除優惠
	public String delete(){
		ProductService productSvc = new ProductService();
		productSvc.delete(pro_no);
		return "success";
	}
	
	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	
	

}
