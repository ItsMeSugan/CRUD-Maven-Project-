<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DAO.process, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
process dao = new process();

List<Integer> ids = null;
try {
	ids = dao.getAllIds();
} catch (Exception ex) {
	ids = java.util.Collections.emptyList();
}
request.setAttribute("ids", ids);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MyWebAppProject1</title>
</head>
<body>

	<!-- Insert form -->
	<h2>Insert Employee</h2>
	<form method="post" action="insert.jsp">
		First name: <input name="first_Name" required><br>
		Last name: <input name="last_Name" required><br> 
		Phone No: <input name="phone_Number"><br>
		Age: <input name="Age" type="number"><br>
		Join Date:<input name="Join_Date" type="date"><br>
		<button type="submit">Insert</button>
	</form>

</body>
</html>