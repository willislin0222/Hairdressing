<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
// 		String url=request.getContextPath();
		String url=request.getContextPath() + "/index.jsp";
		session.removeAttribute("memberVO");
		System.out.println(url);
		response.sendRedirect(url);
	
	%>

</body>
</html>