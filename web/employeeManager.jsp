<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees Manager</title>
        <link href="css/menu_style.css" type="text/css" rel="stylesheet" />
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>

        <c:choose>
            <c:when test="${not empty sessionScope.username}">
                <div class="header">
                    <br>
                    <h1 align="center">Employees Manager</h1>
                    <div class="menu bubplastic horizontal orange">
                        <ul>
                            <li><span class="menu_r"><a href="login.jsp"><span class="menu_ar">Login</span></a></span></li>
                            <li class="highlight"><span class="menu_r"><a href="employeeManager.jsp"><span class="menu_ar">Employee Manager</span></a></span></li>
                            <li><span class="menu_r"><a href="ProcessEmployee"><span class="menu_ar">Add New Employee</span></a></span></li>
                            <li><span class="menu_r"><a href="searchEmployee.jsp"><span class="menu_ar">Search Employee</span></a></span></li>
                            <li><span class="menu_r"><a href="logout.jsp"><span class="menu_ar">logout</span></a></span></li>
                        </ul>
                        <br class="clearit" />
                    </div>
                </div>
                <div class="content">
                    <br><br>
                    <table id="tb" width="100%" align="center">
                        <tr>
                            <th colspan="11" height="50px"><h4>EMPLOYEE LIST</h4></th>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <th>Birthday Date</th>
                            <th>Hire Date</th>
                            <th>Address</th>
                            <th>City</th>
                            <th>Country</th>
                            <th>Home Phone</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th colspan="2"></th>
                        </tr>
                        <jsp:useBean id="ebo" class="HRManager.bol.EmployeeBO" scope="request"/>
                        <c:choose>
                            <c:when test="${empty param.option or empty param.value}">
                                <c:set var="list" value="${ebo.select()}" scope="request"/>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${param.option eq 'Name'}">
                                        <c:set var="list" value="${ebo.find(0, param.value)}" scope="request"/>
                                    </c:when>
                                    <c:when test="${param.option eq 'City'}">
                                         <c:set var="list" value="${ebo.find(1, param.value)}" scope="request"/>
                                    </c:when>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:if test="${fn:length(list) > 0}">
                            <c:forEach items="${list}" var="em">
                                <tr>
                                    <td>${em.firstName} ${em.lastName}</td>
                                    <td>${em.birthDate}</td>
                                    <td>${em.hireDate}</td>
                                    <td>${em.address}</td>
                                    <td>${em.city}</td>
                                    <td>${em.country}</td>
                                    <td>${em.homePhone}</td>
                                    <td>${em.mobile}</td>
                                    <td>${em.email}</td>
                                    <td align='center'><a href='ProcessEmployee?action=edit&id=${em.employeeID}'>Edit </a></td>
                                    <td align='center'><a href='ProcessEmployee?action=delete&id=${em.employeeID}'> Delete</a></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                      
                    </c:when>
                    <c:otherwise>
                        <jsp:forward page="login.jsp"/>
                    </c:otherwise>
                </c:choose>
            </table>
            <br>
        </div>
    </body>
</html>