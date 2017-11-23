package com.member.model;

import java.util.List;
import java.util.Set;

import com.morder.model.MorderVO;
import com.reservation.model.ReservationVO;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(String mem_no);
	public MemberVO findByPrimaryKey(String mem_no);
	//從登入帳號查詢會員資料
	public MemberVO findByMemid(String mem_id);
	public List<MemberVO> getAll();
	
	//查詢某會員的預約紀錄從會員編號(一對多)(回傳 Set)
    public Set<ReservationVO> getReservationsByMemno(String mem_no);
    
    //查詢某部門的員工(一對多)(回傳 Set)
    public Set<MorderVO> getMordersByMemno(String mem_no);
    
    //Hibernate+Struct2 分頁功能用
  	public List<?> queryByPage(String hql, int offset, int pageSize);
    public int getAllRowCount(String hql);
}
