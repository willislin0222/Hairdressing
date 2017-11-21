package com.morder.actions;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.member.actions.GetDataByMemAction;
import com.member.model.MemberService;
import com.morder.model.MorderService;
import com.opensymphony.xwork2.ActionSupport;

public class MorderManagerAction extends ActionSupport{
	private String mord_no;
	
	//取消訂單
	public String delete() throws Exception{
		MorderService morderSvc = new MorderService();
		morderSvc.delete(mord_no);
		//重新查詢會員訂單紀錄
		GetDataByMemAction getDataByMemAction = new GetDataByMemAction();
		getDataByMemAction.getMordersPageBeanByMemno();		
		return "success";
	}

	public String getMord_no() {
		return mord_no;
	}

	public void setMord_no(String mord_no) {
		this.mord_no = mord_no;
	}

	

	
}
