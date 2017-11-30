package com.adm.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AdmDAO_interface {
	public void insert(AdmVO admVO);
	public void update(AdmVO admVO);
	public void delete(String adm_no);
	public AdmVO findByPrimaryKey(String adm_no);
	public List<AdmVO> getAll();
	//從登入帳號查詢管理者資料
	public AdmVO findByAdmmid(String adm_id);
}
