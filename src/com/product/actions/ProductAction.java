package com.product.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.product.model.ProductService;
import com.product.model.ProductVO;

public class ProductAction extends ActionSupport{
	
	private ProductVO productVO;
	
	//上傳的檔案物件list
	private List<File> fileUpload = new ArrayList<File>();
	
	//取得修改時前端送過來的file物件資料
	private File pro_image1;
	private File pro_image2;
	private File pro_image3;
	private File pro_image4;

	//新增商品
	public String addProduct() throws IOException{
		if(fileUpload.size() == 0){
			super.addFieldError("pro_image1", "商品圖片1請勿空白");
			return "input";
		}
		ProductService productSvc = new ProductService();
		//處理前端送來的file List
		Date pro_createdate = new java.sql.Date(System.currentTimeMillis());
		int count = 1;
		byte[] imagetemp=null;
		for (File file: fileUpload) {
			InputStream in = new FileInputStream(file);  
			imagetemp = new byte[in.available()];
			in.read(imagetemp);
			in.close();
			switch(count){
				case 1:
					productVO.setPro_image1(imagetemp);
					break;
				case 2:
					productVO.setPro_image2(imagetemp);
					break;
				case 3:
					productVO.setPro_image3(imagetemp);
					break;
				case 4:
					productVO.setPro_image4(imagetemp);
					break;
			}
			productVO.setPro_createdate(pro_createdate);
			productVO.setPro_status("1");
			productVO.setPro_number(0);
			count++;
		}
		productSvc.addProduct(productVO);
		productVO = null;
		return "success";
	}
		
	//修改商品
	public String updateProduct() throws IOException{
		ProductService productSvc = new ProductService();
		//處理前端送來的file List
		//取得資料庫原本的圖片資料
		byte[] imagetemp = null;
		byte[] getpro_image1=productSvc.getOneProduct(productVO.getPro_no()).getPro_image1();
		byte[] getpro_image2=productSvc.getOneProduct(productVO.getPro_no()).getPro_image2();
		byte[] getpro_image3=productSvc.getOneProduct(productVO.getPro_no()).getPro_image3();
		byte[] getpro_image4=productSvc.getOneProduct(productVO.getPro_no()).getPro_image4();
		
		//判斷pro_image1是否有圖片更新的動作
		if(pro_image1 != null ){
			InputStream in = new FileInputStream(pro_image1);  
			imagetemp = new byte[in.available()];
			in.read(imagetemp);
			in.close();
			productVO.setPro_image1(imagetemp);
		}else{
			productVO.setPro_image1(getpro_image1);
		}
		
		//判斷pro_image2是否有圖片更新的動作
		if(pro_image2 != null ){
			InputStream in = new FileInputStream(pro_image2);  
			imagetemp = new byte[in.available()];
			in.read(imagetemp);
			in.close();
			productVO.setPro_image2(imagetemp);
		}else{
			productVO.setPro_image2(getpro_image2);
		}
		
		//判斷pro_image3是否有圖片更新的動作
		if(pro_image3 != null ){
			InputStream in = new FileInputStream(pro_image3);  
			imagetemp = new byte[in.available()];
			in.read(imagetemp);
			in.close();
			productVO.setPro_image3(imagetemp);
		}else{
			productVO.setPro_image3(getpro_image3);
		}
		
		//判斷pro_image4是否有圖片更新的動作
		if(pro_image4 != null ){
			InputStream in = new FileInputStream(pro_image4);  
			imagetemp = new byte[in.available()];
			in.read(imagetemp);
			in.close();
			productVO.setPro_image4(imagetemp);
		}else{
			productVO.setPro_image4(getpro_image4);
		}	
		productSvc.updateProduct(productVO);
		productVO = null;
		return "success";
	}
	
	
	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public List<File> getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(List<File> fileUpload) {
		this.fileUpload = fileUpload;
	}

	public File getPro_image1() {
		return pro_image1;
	}

	public void setPro_image1(File pro_image1) {
		this.pro_image1 = pro_image1;
	}

	public File getPro_image2() {
		return pro_image2;
	}

	public void setPro_image2(File pro_image2) {
		this.pro_image2 = pro_image2;
	}

	public File getPro_image3() {
		return pro_image3;
	}

	public void setPro_image3(File pro_image3) {
		this.pro_image3 = pro_image3;
	}

	public File getPro_image4() {
		return pro_image4;
	}

	public void setPro_image4(File pro_image4) {
		this.pro_image4 = pro_image4;
	}

}
