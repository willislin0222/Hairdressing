package com.page.model;

import java.util.List;

public class ReservationService implements ReservationService_interface{

private ReservationDAO_interface reservationDAO = new ReservationDAO();
    
    /**
     * pageSize为每页显示的记录数
     * page为当前显示的网页
     */
    @Override
    public PageBean getPageBean(int pageSize, int page)
    {
        PageBean pageBean = new PageBean();
        
        String hql = "from ReservationVO order by res_no desc";
        
        int allRows = reservationDAO.getAllRowCount(hql);
        
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        
        int currentPage = pageBean.getCurPage(page);
        
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        
        List<ReservationVO> list = reservationDAO.queryByPage(hql, offset, pageSize);
        
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
    }
}
