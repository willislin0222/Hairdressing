package com.adm.model;

import java.util.List;


public class AdmService {
	
private AdmDAO_interface dao;
	
	public AdmService(){
		dao =new AdmDAO();
	}
		
	//給struct2用
	public void addAdm(AdmVO admVO) {
		dao.insert(admVO);
	}
		
	public void updateAdm(AdmVO admVO) {
		dao.update(admVO);
	}
	
	public void delete(String adm_no){
		dao.delete(adm_no);
	}
	
	public AdmVO getOneNews(String adm_no){
		return dao.findByPrimaryKey(adm_no);
	}
	
	public List<AdmVO> getAll(){
		return dao.getAll();
	}
}
