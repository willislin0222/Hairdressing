package com.member.actions;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.member.model.PageBean;
import com.opensymphony.xwork2.ActionSupport;

public class GetDataByMemAction extends ActionSupport{
	
	private MemberVO memberVO = new MemberVO();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	private MemberService memberSvc = new MemberService();
	private Date today;
    
    private int page=1;
    
    @Override
    public String execute() throws Exception
    {
    	memberVO = (MemberVO) session.getAttribute("memberVO");
    	//取得今日日期，用於前台判斷預約清單時間是否已過
    	today = new Date(System.currentTimeMillis());
        //表示每页显示5条记录，page表示当前网页
        PageBean pageBean = memberSvc.getPageBean(5, page ,memberVO.getMem_no());
        
        HttpServletRequest request = ServletActionContext.getRequest();
        
        request.setAttribute("pageBean", pageBean);
        
        return SUCCESS;
    }
    
    public int getPage()
    {
        return page;
    }

    public void setPage(int page)
    {
        this.page = page;
    }

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}
    
    
}
