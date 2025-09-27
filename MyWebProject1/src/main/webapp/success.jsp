<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Correct taglib declaration --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta charset="utf-8"><title>Success</title></head>
<body>
<h2>Success</h2>
<p><%= request.getAttribute("message") %></p>
<a href="main.jsp">Back to main page</a>
</body></html>
