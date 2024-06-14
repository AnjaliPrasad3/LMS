<%@page import="java.sql.Date"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.lms.UserDaw.UserDaw"%>
<%@page import="com.lms.UserModel.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String btn = request.getParameter("btn");
if(btn.equals("studentRegistration")){
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String role = "user";
	
	UserModel u = new UserModel();
	u.setName(name);
	u.setEmail(email);
	u.setRole(role);
	u.setPassword(password);
	
	int i = UserDaw.savedata(u);
	if(i>0){
		response.sendRedirect("../index.jsp");
	} 
	else {
	}
}
if(btn.equals("updateregistration")){
	int id= Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String role = request.getParameter("role");



	UserModel u = new UserModel();
	u.setName(name);
	u.setEmail(email);
	u.setPassword(password);
	u.setRole(role);
	u.setId(id);
	
	int status = UserDaw.updatedata(u);
	if(status>0){
		response.sendRedirect("../admin/users.jsp");
	} 
	else {
		response.sendRedirect("edit.jsp");
	}
}
if(btn.equals("deleteregistration")){
	int id = Integer.parseInt(request.getParameter("id"));
	int status = UserDaw.deleteregistration(id);
	if(status>0){
		response.sendRedirect("../admin/admin.jsp");
	}else{
	}
}
if(btn.equals("login")){
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	UserModel u = new UserModel();
	u.setEmail(email);
	u.setPassword(password);
	
	UserModel um = UserDaw.login(u);
	
	if(um!=null)
	{
		
		session.setAttribute("role",um.getRole());
		session.setAttribute("id",um.getId());
		session.setAttribute("name",um.getName());
		String role = um.getRole();
		if(role.equals("admin")){
			response.sendRedirect("../admin/admin.jsp");
		}
		else{
			response.sendRedirect("../index.jsp");
		}
	}else{
		response.sendRedirect("login.jsp");
	}
}

if(btn.equals("logout")){
	session.setAttribute("role","");
	session.setAttribute("id","");
	response.sendRedirect("../index.jsp");
}
if(btn.equals("buyNow")){
	
	if((String)session.getAttribute("role")!=null){
		int courseId = Integer.parseInt(request.getParameter("courseID"));
		int studentId = (int)session.getAttribute("id"); 
		float amount = Float.parseFloat(request.getParameter("amount"));
		int duration = Integer.parseInt(request.getParameter("duration"));
		int days = duration*7;
		
		LocalDate startDate = LocalDate.now();
		LocalDate endDateLocalDate = startDate.plusDays(days);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startDateString = startDate.format(formatter);
        String endDateString = endDateLocalDate.format(formatter);
		
		UserModel u = new UserModel();
		u.setId(courseId);
		u.setAmount(amount);
		u.setStartDate(startDateString);
		u.setEndDate(endDateString);
		
		int i = UserDaw.savepurchasedData(u, studentId);
		if(i>0){
			response.sendRedirect("../index.jsp");
		} 
		else {
		}
		
	}else{
		response.sendRedirect("login.jsp");
	}

}
%>