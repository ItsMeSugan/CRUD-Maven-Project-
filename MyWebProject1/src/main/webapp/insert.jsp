<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Employee, DAO.process, java.sql.Date"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String fn = request.getParameter("first_Name");
if (fn == null) {
	response.sendRedirect("main.jsp");
	return;
}

Employee e = new Employee();

e.setFirstName(fn);
e.setLastName(request.getParameter("last_Name"));
e.setPhoneNumber(request.getParameter("phone_Number"));

String ages = request.getParameter("Age");

if (ages != null && !ages.isEmpty()) {
	e.setAge(Integer.parseInt(ages));
}

String jd = request.getParameter("Join_Date");
if (jd != null && !jd.isEmpty()) {
	e.setJoinDate(Date.valueOf(jd));
}

try {
	process dao = new process();
	dao.insertEmployee(e);
	request.setAttribute("message", "Inserted Successfully");
	request.getRequestDispatcher("success.jsp").forward(request, response);
} catch (Exception ex) {
	ex.printStackTrace();
	out.println("<h3>Error: " + ex.getMessage()
	+ "</h3><a href='main.jsp'>Back</a>");
}
%>