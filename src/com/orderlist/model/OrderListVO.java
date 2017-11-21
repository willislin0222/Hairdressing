package com.orderlist.model;

import java.io.Serializable;


import com.morder.model.MorderVO;
import com.product.model.ProductVO;

public class OrderListVO implements Serializable{
	private MorderVO morderVO;
	private ProductVO productVO;
	private Integer ordl_number;
	public OrderListVO(){
		
	}
		
	public MorderVO getMorderVO() {
		return morderVO;
	}

	public void setMorderVO(MorderVO morderVO) {
		this.morderVO = morderVO;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public Integer getOrdl_number() {
		return ordl_number;
	}

	public void setOrdl_number(Integer ordl_number) {
		this.ordl_number = ordl_number;
	}


}
