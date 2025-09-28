<%@ page import="DAO.process"%>
<%-- Correct taglib declaration --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String idS = request.getParameter("Id");
if (idS == null) {
	response.sendRedirect("index.jsp");
	return;
}
try {
	int id = Integer.parseInt(idS);
	process dao = new process();
	dao.deleteById(id);
	request.setAttribute("message", "Record Deleted Successfully");
	request.getRequestDispatcher("success.jsp").forward(request, response);
} catch (Exception ex) {
	ex.printStackTrace();
	out.println("<h3>Error: " + ex.getMessage()
	+ "</h3><a href='index.jsp'>Back</a>");
}
%>
