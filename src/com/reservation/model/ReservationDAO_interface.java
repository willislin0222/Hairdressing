package com.reservation.model;

import java.sql.Date;
import java.util.List;

public interface ReservationDAO_interface {
	public void insert(ReservationVO reservationVO);
	public void update(ReservationVO reservationVO);
	public void delete(String res_no);
	public ReservationVO findByPrimaryKey(String res_no);
	public List<ReservationVO> getAll();

	//從今日日期取得所有預約清單
	public List<ReservationVO> getReservationsByToday(Date res_no);
}
