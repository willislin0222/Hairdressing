package com.dayoff.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface DayoffDAO_interface {
	public void insert(DayoffVO dayoffVO);
	public void update(DayoffVO dayoffVO);
	public void delete(String day_no);
	public DayoffVO findByPrimaryKey(String day_no);
	public List<DayoffVO> getAll();
}
