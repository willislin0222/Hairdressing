package com.member.model;

import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.page.model.PageBean;
import com.reservation.model.ReservationVO;

public class MemberService {
	
	private MemberDAO_interface dao;
	
	public MemberService(){
//		dao =new MemberDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(MemberDAO_interface) context.getBean("memberDAO");
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
	        
	    List<?> list = dao.queryByPage(hql, offset, pageSize);
	        
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
	        
	    String hql = "from MorderVO where mem_no='" + mem_no + "' order by mord_no desc";
	        
	    int allRows = dao.getAllRowCount(hql);
	        
	    int totalPage = pageBean.getTotalPages(pageSize, allRows);
	        
	    int currentPage = pageBean.getCurPage(page);
	        
	    int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
	        
	    List<?> list = dao.queryByPage(hql, offset, pageSize);
	        
	    pageBean.setList(list);
	    pageBean.setAllRows(allRows);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setTotalPage(totalPage);
	        
	    return pageBean;
	}
}
