<%@ page
	import="DAO.process, Model.Employee, java.util.List"%>
<%-- Correct taglib declaration --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
try {
	process dao = new process();
	List<Employee> list = dao.getAllEmployees();
	request.setAttribute("list", list);
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>List Employees</title>
</head>
<body>
	<h1>All Employees</h1>
	<table border="1" cellpadding="5">
		<tr>
			<th>Id</th>
			<th>First</th>
			<th>Last</th>
			<th>Phone</th>
			<th>Age</th>
			<th>Join Date</th>
		</tr>
		<%
		List<Employee> list = (List<Employee>) request.getAttribute("list");
		if (list != null) {
			for (Employee e : list) {
		%>
		<tr>
			<td><%=e.getId()%></td>
			<td><%=e.getFirstName()%></td>
			<td><%=e.getLastName()%></td>
			<td><%=e.getPhoneNumber()%></td>
			<td><%=e.getAge()%></td>
			<td><%=e.getJoinDate()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<br>
	<a href="main.jsp">Back to main page</a>
</body>
</html>