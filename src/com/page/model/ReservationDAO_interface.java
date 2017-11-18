package com.page.model;

import java.sql.Date;
import java.util.List;

public interface ReservationDAO_interface {
	
	//Hibernate+Struct2 分頁功能用
	public List<ReservationVO> queryByPage(String hql, int offset, int pageSize);
    public int getAllRowCount(String hql);
}
