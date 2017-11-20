package com.member.actions;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.member.model.PageBean;
import com.morder.model.MorderService;
import com.morder.model.MorderVO;
import com.opensymphony.xwork2.ActionSupport;
import com.orderlist.model.OrderListService;
import com.orderlist.model.OrderListVO;

public class GetDataByMemAction extends ActionSupport{
	
	private MemberVO memberVO = new MemberVO();
	HttpServletRequest request = ServletActionContext.getRequest();
	List<OrderListVO> orderslist = new LinkedList<OrderListVO>();
	HttpSession session = request.getSession();
	private MemberService memberSvc = new MemberService();
	private Date today;
	
    
    private int page=1;
    
//  使用Hibernate+Struct2 分頁功能來實作從會員編號取得預約紀錄功能 
    public String getReservationsPageBeanByMemno() throws Exception
    {
    	memberVO = (MemberVO) session.getAttribute("memberVO");
    	//取得今日日期，用於前台判斷預約清單時間是否已過
    	today = new Date(System.currentTimeMillis());
        //表示每页显示5条记录，page表示当前网页
        PageBean pageBean = memberSvc.getReservationsPageBeanByMemno(5, page ,memberVO.getMem_no());
        
        HttpServletRequest request = ServletActionContext.getRequest();
        
        request.setAttribute("pageBean", pageBean);
        
        return SUCCESS;
    }
    
//  使用Hibernate+Struct2 分頁功能來實作從會員編號取得訂單紀錄功能 
    public String getMordersPageBeanByMemno() throws Exception
    {
    	MorderService morderSvc = new MorderService(); 
    	OrderListService orderListSvc = new OrderListService();
    	memberVO = (MemberVO) session.getAttribute("memberVO");
    	//取得今日日期，用於前台判斷預約清單時間是否已過
    	today = new Date(System.currentTimeMillis());
        //表示每页显示5条记录，page表示当前网页
//    	取得所有的會員訂單
        PageBean pageBean = memberSvc.getMorderPageBeanByMemno(5, page ,memberVO.getMem_no());

        //取得所有的會員訂單明細
        List<MorderVO> list = morderSvc.getMordersByMemno(memberVO.getMem_no());
        for(MorderVO morderVO :list ){  
    		orderslist.addAll(orderListSvc.getOrderListsByMordno(morderVO.getMord_no()));
    	}
        
        HttpServletRequest request = ServletActionContext.getRequest();
        
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("orderslist", orderslist);
        
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
