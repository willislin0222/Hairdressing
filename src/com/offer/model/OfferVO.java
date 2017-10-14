package com.offer.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;


public class OfferVO {
	private String off_no;
	private String off_title;
	private String off_content;
	private byte[] off_image;
	private Date off_start;
	private Date off_end;
	private Integer off_status;
	public String getOff_no() {
		return off_no;
	}
	public void setOff_no(String off_no) {
		this.off_no = off_no;
	}
	public String getOff_title() {
		return off_title;
	}
	public void setOff_title(String off_title) {
		this.off_title = off_title;
	}
	public String getOff_content() {
		return off_content;
	}
	public void setOff_content(String off_content) {
		this.off_content = off_content;
	}
	public byte[] getOff_image() {
		return off_image;
	}
	public void setOff_image(byte[] off_image) {
		this.off_image = off_image;
	}
	public Date getOff_start() {
		return off_start;
	}
	public void setOff_start(Date off_start) {
		this.off_start = off_start;
	}
	public Date getOff_end() {
		return off_end;
	}
	public void setOff_end(Date off_end) {
		this.off_end = off_end;
	}
	public Integer getOff_status() {
		return off_status;
	}
	public void setOff_status(Integer off_status) {
		this.off_status = off_status;
	}
	
	
	
}
