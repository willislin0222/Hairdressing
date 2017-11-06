package com.product.model;

import java.sql.Date;

public class ProductVO {
	private String pro_no;
	private String pro_name;
	private String pro_desc;
	private Integer pro_price;
	private byte[] pro_image1;
	private byte[] pro_image2;
	private byte[] pro_image3;
	private byte[] pro_image4;
	private Integer pro_number;
	private Date pro_createdate;
	private String pro_status;
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_desc() {
		return pro_desc;
	}
	public void setPro_desc(String pro_desc) {
		this.pro_desc = pro_desc;
	}
	public Integer getPro_price() {
		return pro_price;
	}
	public void setPro_price(Integer pro_price) {
		this.pro_price = pro_price;
	}
	public byte[] getPro_image1() {
		return pro_image1;
	}
	public void setPro_image1(byte[] pro_image1) {
		this.pro_image1 = pro_image1;
	}
	public byte[] getPro_image2() {
		return pro_image2;
	}
	public void setPro_image2(byte[] pro_image2) {
		this.pro_image2 = pro_image2;
	}
	public byte[] getPro_image3() {
		return pro_image3;
	}
	public void setPro_image3(byte[] pro_image3) {
		this.pro_image3 = pro_image3;
	}
	public byte[] getPro_image4() {
		return pro_image4;
	}
	public void setPro_image4(byte[] pro_image4) {
		this.pro_image4 = pro_image4;
	}
	public Integer getPro_number() {
		return pro_number;
	}
	public void setPro_number(Integer pro_number) {
		this.pro_number = pro_number;
	}
	public Date getPro_createdate() {
		return pro_createdate;
	}
	public void setPro_createdate(Date pro_createdate) {
		this.pro_createdate = pro_createdate;
	}
	public String getPro_status() {
		return pro_status;
	}
	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
	}
	

}
