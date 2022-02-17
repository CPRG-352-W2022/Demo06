<%-- 
    Document   : users
    Created on : 29-Sep-2015, 9:56:32 PM
    Author     : awarsyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
    </head>
    <body>
        <h1>Accounts</h1>
        
        <h3>Page ${page}</h3>
        
        <!-- display a table of all of the accounts -->
        <table border="1" cellpadding="7">
            <tr>
                <th>Name</th>
                <th>View Account</th>
            </tr>
            <c:forEach items="${accounts}" var="user">
                <tr>
                    <td>${user.name}</td>
                    <td>
                        <a href="<c:url value="/account">
                               <c:param name="username" value="${user.username}" />
                           </c:url>">View</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <!-- handle paging: forward/back -->
        <div>
            <c:if test="${page > 1}">
                <a href="accounts?page=${page - 1}"> &lt; Back</a>&nbsp;|&nbsp;
            </c:if>
            <a href="accounts?page=${page + 1}">Next &gt; </a>
        </div>
        <br><br>
        <div>
            <c:forTokens items="-5,-4,-3,-2,-1,0,1,2,3,4,5" delims="," var="i">
                <c:choose>
                    <c:when test="${(page+i) < 1}"></c:when>
                    <c:when test="${i == 0}">
                        <b>${page}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="account?page=${page + i}">${page + i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forTokens>
        </div>
        
        
    </body>
</html>
