 <%@ page
	import="DAO.process, Model.Employee, java.sql.Date"%>
Correct taglib declaration
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 

String ids = request.getParameter("Id");
if (ids == null){
	response.sendRedirect("main.jsp");
	return;
}

int id = Integer.parseInt(ids);

Employee updates = new Employee();

if(request.getParameter("update_firstName") != null)
{
	updates.setFirstName(request.getParameter("first_Name"));
}
if (request.getParameter("update_lastName") != null)
{
    updates.setLastName(request.getParameter("last_Name"));
}
if (request.getParameter("update_phone") != null) 
{
    updates.setPhoneNumber(request.getParameter("phone_Number"));
}
if (request.getParameter("update_age") != null) 
{
    String a = request.getParameter("Age");
    if (a != null && !a.isEmpty()) {
    	updates.setAge(Integer.parseInt(a));
    }
}
if(request.getParameter("update_join") != null){
	String jd = request.getParameter("Join_Date");
	if(jd != null && !jd.isEmpty()){
		updates.setJoinDate(Date.valueOf(jd));
	}
}

try{
	process dao = new process();
	dao.updateById(id, updates);
	request.setAttribute("message", "Record Updated Successfully");
	request.getRequestDispatcher("success.jsp").forward(request, response);
}
catch(Exception ex){
	ex.printStackTrace();
	out.println("<h3>Error: "+ex.getMessage()+" </h3><a href='main.jsp'>Back</a>");
}

%>
