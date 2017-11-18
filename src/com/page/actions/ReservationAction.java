package com.page.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.page.model.PageBean;
import com.page.model.ReservationService_interface;
import com.page.model.ReservationService;

public class ReservationAction extends ActionSupport{

private ReservationService_interface reservationService = new ReservationService();
    
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
        //表示每页显示5条记录，page表示当前网页
        PageBean pageBean = reservationService.getPageBean(5, page);
        
        HttpServletRequest request = ServletActionContext.getRequest();
        
        request.setAttribute("pageBean", pageBean);
        
        return SUCCESS;
    }
}
