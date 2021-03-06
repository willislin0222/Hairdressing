<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
  <head>
<%--     <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'pagePerson.jsp' starting page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    
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

  </head>
  
  <body>

    <h1><font color="blue">分页查询</font></h1><hr>
    
    <table border="1" align="center" bordercolor="#CCCCFF" width="100%">
    
        <tr>
            <th>預約編號</th>
			<th>會員名稱</th>
			<th>預約日期</th>
			<th>預約開始時間</th>
			<th>預約結束時間</th>
			<th>預約項目</th>
			<th>修改</th>
			<th>刪除</th>
        </tr>
    
    
    <s:iterator value="#request.pageBean.list" id="person">
    
        <tr>
            <td><s:property value="#person.res_no"/></td>
            <td><s:property value="#person.memberVO.mem_name"/></td>
            <td><s:property value="#person.res_date"/></td>        
            <td><s:property value="#person.res_timestart"/></td>        
            <td><s:property value="#person.res_timeend"/></td>        
            <td><s:property value="#person.res_content"/></td>      
            <td>
			  <s:form action="getOne_For_Update" namespace="/reservation">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			  </s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/reservation">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			  </s:form>
			</td>  
        </tr>
    
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
            <a href="personAction.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="personAction.action?page=<s:property value="#request.pageBean.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="#request.pageBean.currentPage != #request.pageBean.totalPage">
            <a href="personAction.action?page=<s:property value="#request.pageBean.currentPage + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="personAction.action?page=<s:property value="#request.pageBean.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
    
    </center><br>
    
    <center>
        
        <form action="personAction" onsubmit="return validate();">
            <font size="4">至</font>
            <input type="text" size="2" name="page">页
            <input type="submit" value="前往">
        </form>
        
    </center>
    
  </body>
</html>