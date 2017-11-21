<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>後台管理系統</title>
	<link rel="icon" href="images/logo_bb.jpg">
    <link href="<%= request.getContextPath()%>/back/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/back/css/back_entry.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/back/css/toast.css" rel="stylesheet">
</head>

<body>
    <header id="top" class="header">
        <div class="text-vertical-center" style="transition: opacity 1s;">
            <h1>後台管理系統</h1>
            <br>
            <a href="<%= request.getContextPath()%>/back/admin.jsp" class="btn btn-dark btn-lg">帳號登入</a>
        </div>
    </header>
</body>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>


