package com.member.model;

import java.util.List;
import java.util.Set;

import com.reservation.model.ReservationVO;

public class MemberService {
	
	private MemberDAO_interface dao;
	
	public MemberService(){
		dao =new MemberDAO();
	}
		
	//給struct2用
	public void addMember(MemberVO memberVO) {
		dao.insert(memberVO);
	}
	
	public void updateMembe(MemberVO memberVO) {
		dao.update(memberVO);
	}
	
	public void delete(String mem_no){
		dao.delete(mem_no);
	}
	
	public MemberVO getOneMember(String mem_no){
		return dao.findByPrimaryKey(mem_no);
	}
	
	public MemberVO getOneMemberBymemid(String mem_id){
		return dao.findByMemid(mem_id);
	}
	
	public List<MemberVO> getAll(){
		return dao.getAll();
	}
	//從會員編號取得此會員的全部預約清單
	public Set<ReservationVO> getReservationsByMemno(String mem_no){
		return dao.getReservationsByMemno(mem_no);
	}
	//從會員編號取得此會員的全部預約清單，使用Hibernate+Struct2分頁技術
	public PageBean getReservationsPageBeanByMemno(int pageSize, int page, String mem_no)
	{
	    PageBean pageBean = new PageBean();
	        
	    String hql = "from ReservationVO where mem_no='" + mem_no + "' order by res_date desc";
	        
	    int allRows = dao.getAllRowCount(hql);
	        
	    int totalPage = pageBean.getTotalPages(pageSize, allRows);
	        
	    int currentPage = pageBean.getCurPage(page);
	        
	    int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
	        
	    List<ReservationVO> list = dao.queryByPage(hql, offset, pageSize);
	        
	    pageBean.setList(list);
	    pageBean.setAllRows(allRows);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setTotalPage(totalPage);
	        
	    return pageBean;
	}
	
	//從會員編號取得此會員的全部訂單清單，使用Hibernate+Struct2分頁技術
	public PageBean getMorderPageBeanByMemno(int pageSize, int page, String mem_no)
	{
	    PageBean pageBean = new PageBean();
	        
	    String hql = "from MorderVO where mem_no='" + mem_no + "' order by mord_createdate desc";
	        
	    int allRows = dao.getAllRowCount(hql);
	        
	    int totalPage = pageBean.getTotalPages(pageSize, allRows);
	        
	    int currentPage = pageBean.getCurPage(page);
	        
	    int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
	        
	    List<ReservationVO> list = dao.queryByPage(hql, offset, pageSize);
	        
	    pageBean.setList(list);
	    pageBean.setAllRows(allRows);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setTotalPage(totalPage);
	        
	    return pageBean;
	}
}
