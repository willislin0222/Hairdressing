package com.adm.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class AdmDAO implements AdmDAO_interface{

	private static final String GET_ONE_By_ADMIN_STMT="from AdmVO where adm_id=?";
	private static final String GET_ALL_STMT="from AdmVO order by adm_no";
	//springframework hibernate5
	private HibernateTemplate hibernateTemplate;    
		
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
	    this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(AdmVO admVO) {
		hibernateTemplate.saveOrUpdate(admVO);
		
	}

	@Override
	public void update(AdmVO admVO) {
		hibernateTemplate.update(admVO);
		
	}

	@Override
	public void delete(String adm_no) {
		AdmVO admVO = (AdmVO) hibernateTemplate.get(AdmVO.class, adm_no);
		hibernateTemplate.delete(admVO);
		
	}

	@Override
	public AdmVO findByPrimaryKey(String adm_no) {
		AdmVO admVO = (AdmVO) hibernateTemplate.get(AdmVO.class, adm_no);
		return admVO;
	}

	@Override
	public List<AdmVO> getAll() {
		List<AdmVO> list = null;
		list = (List<AdmVO>) hibernateTemplate.find(GET_ALL_STMT);
		
		return list;
	}

	@Override
	public AdmVO findByAdmmid(String adm_id) {
		AdmVO admVO =new AdmVO();
		List<AdmVO> list = null;
		list = (List<AdmVO>) hibernateTemplate.find(GET_ONE_By_ADMIN_STMT, adm_id);
		for(AdmVO adm:list){
			admVO = adm;
		}
		return admVO;
	}
}
