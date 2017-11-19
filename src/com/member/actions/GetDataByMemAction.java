package com.member.actions;

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
    
    private int page=1;
    
    public int getPage()
    {
        return page;
    }

    public void setPage(int page)
    {
        this.page = page;
    }

    @Override
    public String execute() throws Exception
    {
    	memberVO = (MemberVO) session.getAttribute("memberVO");
        //表示每页显示5条记录，page表示当前网页
        PageBean pageBean = memberSvc.getPageBean(5, page ,memberVO.getMem_no());
        
        HttpServletRequest request = ServletActionContext.getRequest();
        
        request.setAttribute("pageBean", pageBean);
        
        return SUCCESS;
    }
}
