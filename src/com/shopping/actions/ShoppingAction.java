package com.shopping.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.morder.model.MorderDAO;
import com.morder.model.MorderService;
import com.morder.model.MorderVO;
import com.opensymphony.xwork2.ActionSupport;
import com.orderlist.model.OrderListDAO;
import com.orderlist.model.OrderListVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;



public class ShoppingAction extends ActionSupport {
	private ProductVO productVO;
	private int index;
	Vector<ProductVO> buylist = new Vector<ProductVO>();
	HttpServletRequest req = ServletActionContext.getRequest();
	HttpSession session = req.getSession();
	
	 public String addbuylist() throws Exception {
	       
		 ProductService productSvc = new ProductService();
		 buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
		 boolean match = false;

			// 取得後來新增的書籍
			 ProductVO aproduct = productVO;
			 productVO = productSvc.getOneProduct(aproduct.getPro_no()); 
			 session.setAttribute("productVO", productVO);

			// 新增第一本書籍至購物車時
			if (buylist == null) {
				buylist = new Vector<ProductVO>();
				buylist.add(aproduct);
			} else {
				for (int i = 0; i < buylist.size(); i++) {
					ProductVO product = buylist.get(i);

					// 假若新增的書籍和購物車的書籍一樣時
					if (product.getPro_name().equals(aproduct.getPro_name())) {
						product.setPro_number(product.getPro_number()
								+ aproduct.getPro_number());
						buylist.setElementAt(product, i);
						match = true;
					} // end of if name matches
				} // end of for

				// 假若新增的書籍和購物車的書籍不一樣時
				if (!match)
					buylist.add(aproduct);
			}
			session.setAttribute("shoppingcart", buylist);
	        return "success";
	}
	
	 public String deletebuylist() throws Exception {
		 buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
		 HttpServletRequest req = ServletActionContext.getRequest();
		 HttpSession session = req.getSession();
		 buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
		 buylist.removeElementAt(index);
		 session.setAttribute("shoppingcart", buylist);
	        return "success";
	}
	 
	public String checkout() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
		float total = 0;
		for (int i = 0; i < buylist.size(); i++) {
			ProductVO order = buylist.get(i);
			float price = order.getPro_price();
			int quantity = order.getPro_number();
			total += (price * quantity);
		}

		String amount = String.valueOf(total);
		req.setAttribute("amount", amount);
	        return "success";
	}
	
	public String confirm() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
		MemberVO memberVO =(MemberVO)session.getAttribute("memberVO");
		System.out.println("下單");
		List<OrderListVO> orderListVOlist = new ArrayList<OrderListVO>();
		
		float total = 0;
		for (int i = 0; i < buylist.size(); i++) {
			
			ProductVO order = buylist.get(i);
			float price = order.getPro_price();
			int number = order.getPro_number();
			total += (price * number);
		}
		
		for(ProductVO productVO : buylist){
			
			OrderListVO orderListVO = new OrderListVO();	
			orderListVO.setProductVO(productVO);
			orderListVO.setOrdl_number(productVO.getPro_number());
			orderListVOlist.add(orderListVO);
		}
		
		//新增訂單
		 MorderVO morderVO = new MorderVO();		 
		 morderVO.setMemberVO(memberVO);
		 morderVO.setMord_price((int) total);
		 morderVO.setMord_createdate(new java.sql.Date(System.currentTimeMillis()));
		 morderVO.setMord_status(0);
		 
		//新增訂單明細
		 MorderService MorderSvc = new MorderService();
		 MorderSvc.insertWithOrderList(morderVO, orderListVOlist);

		 session.removeAttribute("shoppingcart");
		return "success";
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	 
}
