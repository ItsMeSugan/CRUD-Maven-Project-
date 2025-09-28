<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.process, java.util.List"%>
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
		First name: <input name="first_Name" required><br> Last
		name: <input name="last_Name" required><br> Phone No: <input
			name="phone_Number"><br> Age: <input name="Age"
			type="number"><br> Join Date:<input name="Join_Date"
			type="date"><br>
		<button type="submit">Insert</button>
	</form>
	
	<!-- update - only the checked field   -->
	<h2>Update Employee</h2>
	<form action="update.jsp" method="POST"	>
	
	Select Id : 
	<select name="Id" required>
		<c:forEach var="i" items="${requestScope.ids}">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select><br>
	
	<input type="checkbox" name="update_firstName">
	First Name: <input name="first_Name"><br>	
	<input type="checkbox" name="update_lastName">
	Last Name: <input name="last_Name"><br>
	<input type="checkbox" name="update_phone">
	Phone Number: <input name="phone_Number"><br>
	
	<input type="checkbox" name="update_age">
	Age: <input type="number" name="Age"><br>
	<input type="checkbox" name="update_join">
	Join Date: <input name="Join_Date" type="date"><br>
	
	<button type="submit" > Update </button>
	</form>
	
	<!-- Delete -->
	<h2>Delete Employee</h2>
	<form method="post" action="delete.jsp">
	Select Id to delete: 
	<select name="Id" required>
	<c:forEach var="i" items="${requestScope.ids}">
	<option value="${i}">${i}</option>
	</c:forEach>
	</select>
	<button type="submit">Delete</button>
	</form>

	<!-- List -->
	<h2>List Employees</h2>
	<form method="get" action="show.jsp">
		<button type="submit">Show All Employees</button>
	</form>

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.process,  java.util.List"%>
<%-- Correct taglib declaration --%>
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
<title>WebApp Project</title>
</head>
<body>
	<h1>Java Project </h1>

	<!-- Insert form -->
	<h2>Insert Employee</h2>
	<form method="post" action="insert.jsp">
		First name: <input name="first_Name" type="text"><br> Last
		name: <input name="last_Name"><br> Phone: <input
			name="phone_Number"><br> Age: <input name="Age"
			type="number"><br> Join Date: <input name="Join_Date"
			type="date"><br>
		<button type="submit">Insert</button>
	</form>

	<!-- Update - only shows fields to set; checkboxes indicate which to update -->
	<h2>Update Employee</h2>
	<form method="post" action="update.jsp">
		Select Id: <select name="Id" required>
			<c:forEach var="i" items="${requestScope.ids}">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select><br> <input type="checkbox" name="update_firstName">First
		name: <input name="first_Name"><br> <input
			type="checkbox" name="update_lastName">Last name: <input
			name="last_Name"><br> <input type="checkbox"
			name="update_phone">Phone: <input name="phone_Number"><br>

		<input type="checkbox" name="update_age">Age: <input
			name="Age" type="number"><br> <input type="checkbox"
			name="update_join">Join Date: <input name="Join_Date"
			type="date"><br>

		<button type="submit">Update</button>
	</form>

	<!-- Delete -->
	<h2>Delete Employee</h2>
	<form method="post" action="delete.jsp">
		Select Id to delete: <select name="Id" required>
			<c:forEach var="i" items="${requestScope.ids}">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<button type="submit">Delete</button>
	</form>

	<!-- List -->
	<h2>List Employees</h2>
	<form method="get" action="show.jsp">
		<button type="submit">Show All Employees</button>
	</form>

</body>
</html>
