package com.morder.model;



import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.orderlist.model.OrderListService;
import com.orderlist.model.OrderListVO;


public class MorderDAO implements MorderDAO_interface{
	
	private static final String GET_MORDERS_BY_MEMNO ="FROM MorderVO where mem_no=? order by mord_no";
	private static final String GET_ALL_STMT ="FROM MorderVO order by mord_no";
	
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(MorderVO morderVO) {
		hibernateTemplate.saveOrUpdate(morderVO);
		
	}

	@Override
	public void update(MorderVO morderVO) {
		hibernateTemplate.update(morderVO);
		
	}

	@Override
	public void delete(String mord_no) {
		MorderVO morderVO = new MorderVO();
		morderVO.getProducts().remove(mord_no);
		morderVO.setMord_no(mord_no);
		hibernateTemplate.delete(morderVO);
		
	}

	@Override
	public MorderVO findByPrimarykey(String mord_no) {
		MorderVO morderVO = (MorderVO) hibernateTemplate.get(MorderVO.class, mord_no);
		return morderVO;
	}

	@Override
	public List<MorderVO> getAll() {
		List<MorderVO> list = null;
		list = (List<MorderVO>) hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}

	@Override
	public void insertWithOrderList(MorderVO morderVO, List<OrderListVO> list) {
		
			
			//先新增訂單
			hibernateTemplate.saveOrUpdate(morderVO);
			//取對應的自增主鍵值
			String key =(String) hibernateTemplate.getSessionFactory().getCurrentSession().getIdentifier(morderVO);
			
			//在新增訂單明細
			OrderListService orderListSvc = new OrderListService();
			for(OrderListVO aOrderList : list){
				morderVO.setMord_no(key);
				aOrderList.setMorderVO(morderVO);
				orderListSvc.insert2(aOrderList, hibernateTemplate);
			}
	}

	@Override
	public List<MorderVO> getMordersByMemno(String mem_no) {
		List<MorderVO> list = null;
		list = (List<MorderVO>) hibernateTemplate.find(GET_MORDERS_BY_MEMNO, mem_no);
		return list;
	}


}
