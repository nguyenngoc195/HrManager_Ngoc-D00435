<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/menu_style.css" type="text/css" rel="stylesheet" />
        <link href="css/style.css" type="text/css" rel="stylesheet" />
        <title></title>
    </head>
    <body>
        <div class="header">
            <br>
            <h1 align="center">Employees Manager</h1>
            <div class="menu bubplastic horizontal orange">
                <ul>
                    <li class="highlight"><span class="menu_r"><a href="login.jsp"><span class="menu_ar">login</span></a></span></li>
                    <li><span class="menu_r"><a href="employeeManager.jsp"><span class="menu_ar">Employee Manager</span></a></span></li>
                    <li><span class="menu_r"><a href="ProcessEmployee"><span class="menu_ar">Add New Employee</span></a></span></li>
                    <li><span class="menu_r"><a href="searchEmployee.jsp"><span class="menu_ar">Search Employee</span></a></span></li>
                    <li><span class="menu_r"><a href="logout.jsp"><span class="menu_ar">logout</span></a></span></li>
                </ul>
                <br class="clearit" />
            </div>
        </div>
        <div class="content">
            <br><BR>
            <c:choose>
                <c:when test="${param.type eq 'error'}">
                    <h1 class="error">${param.msg}</h1>
                </c:when>
                <c:when test="${param.type eq 'info'}">
                    <h1>${param.msg}</h1>
                </c:when>
                <c:when test="${type eq 'warning'}">
                    <h1>${param.msg}</h1>
                </c:when>
            </c:choose>
        </div>
    </body>
</html>
