<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	int count=0;
%>
<html>
  <head>
<%--     <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'pagePerson.jsp' starting page</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/mordersByMemno.css"> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
    <meta http-equiv="pragma" content="no-cache"> 
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
    
        function validate()
        {
            var page = document.getElementsByName("page")[0].value;
                
            if(page > <s:property value="#request.pageBean.totalPage"/>)
            {
                alert("你输入的页数大于最大页数，页面将跳转到首页！");
                
                window.document.location.href = "personAction";
                
                return false;
            }
            
            return true;
        }
    
    </script>
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
		#showlist{
		color:#333333;
		text-decoration: none;
		font-size:15px;
		display:block;
		}
		table tr td{border:solid 1px #ccc;}
		div{padding:10px 30px;}
	</style>

</head>
  
  <body>
<div class="container">  
  	<jsp:include page="/header.jsp" />

    <div id="title">${memberVO.mem_name}的訂單清單</div>
    
    <s:iterator value="#request.pageBean.list" id="morderVO">
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
 		<td width="200"><s:property value="#morderVO.mord_no"/></td>
 		<td width="200"><s:property value="#morderVO.mord_price"/></td>
 		<td width="200"><s:property value="#morderVO.mord_createdate"/></td>
 		<td>
	  		<a href="<%= request.getContextPath()%>/reservation/delete.action?res_no=${reservationVO.res_no}"  class="btn btn-primary">取消訂單</a>
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
				 	<s:iterator value="#request.orderslist" id="orderslistVO">
					 	<s:if test="#orderslistVO.morderVO.mord_no == #morderVO.mord_no">
						 	<tr class="tabelcontext">
							  	<td width="500"><s:property value="#orderslistVO.productVO.pro_name"/></td>
							  	<td width="500"><s:property value="#orderslistVO.ordl_number"/></td>
							  	<td width="500"><s:property value="#orderslistVO.productVO.pro_price"/></td>
							  	<td width="500"><s:property value="#orderslistVO.productVO.pro_price*#orderslistVO.ordl_number"/></td>
						 	</tr>
						</s:if>					 	
			 		 </s:iterator>		 	
				 </table>        
           	</div>
        </td>	
   	</tr>
 </table>
 </s:iterator>
    
    </table>
    
    <center>
    
        <font size="5">目前在第<font color="red"><s:property value="#request.pageBean.currentPage"/></font>页 </font>
        <font size="5">共<font color="red"><s:property value="#request.pageBean.totalPage"/></font>页 </font>&nbsp;&nbsp;
        <font size="5">共<font color="red"><s:property value="#request.pageBean.allRows"/></font>筆記錄</font><br><br>
        
        <s:if test="#request.pageBean.currentPage == 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>
        
        <s:else>
            <a href="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action?page=<s:property value="#request.pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="#request.pageBean.currentPage != #request.pageBean.totalPage">
            <a href="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action?page=<s:property value="#request.pageBean.currentPage + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action?page=<s:property value="#request.pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
    
    </center><br>
    
    <center>
        
        <form action="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action" onsubmit="return validate();">
            <font size="4">至</font>
            <input type="text" size="2" name="page">页
            <input type="submit" value="前往">
        </form>
        
    </center>
</div>  
	<div class="content"></div>  
    <jsp:include page="/footer.jsp" />
  
  </body>
</html>