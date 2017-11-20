<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.morder.model.*"%>
<%@ page import="com.orderlist.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	int count=0;
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	MorderService morderSvc = new MorderService();  
	List<MorderVO> list = morderSvc.getMordersByMemno(memberVO.getMem_no());
	pageContext.setAttribute("list",list);
	
	OrderListService orderListSvc = new OrderListService();
	List<OrderListVO> orderslist = new LinkedList<OrderListVO>();
	for(MorderVO morderVO :list ){  
		orderslist.addAll(orderListSvc.getOrderListsByMordno(morderVO.getMord_no()));
	}
	pageContext.setAttribute("orderslist",orderslist);
	System.out.println(orderslist.size());
		
%>


<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/mordersByMemno.css"> 

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
<script>
	var $j = $.noConflict();
	$j(function(){
		$j("a").click(function(){
			var _this= $j(this).attr("href");
			if($j(_this).css("display")=="none"){
				$j(_this).slideDown();
				$j(this).html("-");
			}else{
				$j(_this).slideUp();
				$j(this).html("+");
			}
			return false;
		});
	});
</script>
	<style type="text/css">
		body{font-size:12px;}
		a{
		color:#333333;
		text-decoration: none;
		font-size:15px;
		display:block;
		}
		table tr td{border:solid 1px #ccc;}
		div{padding:10px 30px;}
</style>
</head>
<body bgcolor='white'>
<!-- header -->
    	<jsp:include page="/header.jsp" />
    	<div id="title">${memberVO.mem_name}的訂單明細</div>
<!--複合查詢 -->
	 <div class="container ">
			<div class="input-group search">
				<input placeholder="輸入 ID" class="form-control input-lg" type="text">
				<span class="input-group-btn">
				<button class="btn btn-primary btn-lg">查詢</button>
				</span>
	 		 </div>
<%@ include file="/pages/orderpage.file"%>   
<c:forEach var="morderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr class="tabeltitle">
		<td width="26" align="center" bgcolor="#eeeeee"><a href="#tr<%= count%>">+</a></td>
	  	<td width="200">訂單編號</td>
	  	<td width="200">金額</td>
	  	<td width="200">下單日期</td>
	  	<td width="200">取消</td>
 	</tr>
 	<tr class="tabelcontext">
 		<td width="200"></td>
 		<td width="200">${morderVO.mord_no}</td>
 		<td width="200">${morderVO.mord_price}</td>
 		<td width="200">${morderVO.mord_createdate}</td>
	  	<td>
		  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/morder/morderServlet.do">
		  	  <c:if test="${morderVO.mord_status.equals('0')}">
			     <input type="submit" value="取消訂單"> 
			     <input type="hidden" name="mord_no" value="${morderVO.mord_no}">
			  </c:if>   
		  </FORM>
		</td>	
   	</tr>
   	<tr>
   		<td colspan="5" class="content">
           	<div id="tr<%= count++%>" style="display:none;">訂單${morderVO.mord_no}明細內容
				 <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr class="tabeltitle">
					  	<td width="500">商品名稱</td>
					  	<td width="500">數量</td>
					  	<td width="500">單價</td>
					  	<td width="500">總計</td>
				 	</tr>
				 	<c:forEach var="orderslistVO" items="${orderslist}">
					 	<c:if test="${orderslistVO.morderVO.mord_no == morderVO.mord_no}">
						 	<tr class="tabelcontext">
							  	<td width="500">${orderslistVO.productVO.pro_name}</td>
							  	<td width="500">${orderslistVO.ordl_number}</td>
							  	<td width="500">${orderslistVO.productVO.pro_price}</td>
							  	<td width="500">${orderslistVO.productVO.pro_price * orderslistVO.ordl_number}</td>
						 	</tr>
						</c:if>					 	
			 		</c:forEach>		 	
				 </table>        
           	</div>
        </td>	
   	</tr>
 </table>
 </c:forEach>
 <%@ include file="/pages/page4.file" %>
</div>
	

<div class="content"></div>


<jsp:include page="/footer.jsp" />	

    	

</body>
</html>



