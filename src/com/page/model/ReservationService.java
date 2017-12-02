package com.page.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class ReservationService implements ReservationService_interface{

	private ReservationDAO_interface dao;

	public ReservationService(){
	//	dao =new MemberDAO();
		//註1: 雖然model-config1-DriverManagerDataSource.xml也可以用
		//註2: 但為了使用Apache DBCP連線池,以提高效能,所以底下的model-config2-JndiObjectFactoryBean.xml內部dataSource設定是採用org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config.xml");
		dao =(ReservationDAO_interface) context.getBean("pageDAO");
	}
    
    /**
     * pageSize为每页显示的记录数
     * page为当前显示的网页
     */
    @Override
    public PageBean getPageBean(int pageSize, int page)
    {
        PageBean pageBean = new PageBean();
        
        String hql = "from ReservationVO order by res_no desc";
        
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
