<%@page import="com.google.gson.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.lms.UserDaw.UserDaw"%>
<%@page import="com.lms.UserModel.UserModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%

int maxPostSize = 100 * 1024 * 1024; 
MultipartRequest m = new MultipartRequest(request,"C:/Users/Anjali Prasad/eclipse-workspace/lms/src/main/webapp/admin/images", maxPostSize);
String btn = m.getParameter("btnCourse");

if(btn.equals("addCourse")){
    String name = m.getParameter("name");
    int duration = Integer.parseInt(m.getParameter("duration"));
    String level = m.getParameter("level");
    String des = m.getParameter("desc");
    String instructor = m.getParameter("instructor");
    int rating = Integer.parseInt(m.getParameter("rating"));
    String image = m.getOriginalFileName("img");
    float amount = Float.parseFloat(m.getParameter("amount"));
    String imageName = (image != null) ? image : "";

    UserModel u = new UserModel();
    u.setName(name);
    u.setDuration(duration);
    u.setLevel(level);
    u.setDesc(des);
    u.setInstructor(instructor);
    u.setRating(rating);
    u.setImg(imageName);
    u.setAmount(amount);

    int i = UserDaw.savecourse(u);
    if(i > 0){
        response.sendRedirect("courses.jsp");
    } 
}

if(btn.equals("addCourseStructure")){
	int courseId = Integer.parseInt(m.getParameter("courseId"));
    String section = m.getParameter("section");
    String[] subSections = m.getParameterValues("subsection[]");
    @SuppressWarnings("unchecked")
    Enumeration<String> files = m.getFileNames();
    List<String> fileNames = new ArrayList<>();

    while(files.hasMoreElements()){
        String fileField = (String) files.nextElement();
        String fileName = m.getOriginalFileName(fileField);
        if (fileName != null) {
            fileNames.add(fileName);
        }
    }

    Gson gson = new Gson();
    String jsonSubsection = gson.toJson(subSections);
    String jsonFileNames = gson.toJson(fileNames);
     
    UserModel u = new UserModel();
    u.setSection(section);
    u.setSubSection(jsonSubsection);
    u.setVideo(jsonFileNames);
    u.setId(courseId);
    int i = UserDaw.saveCourseStructure(u);
    if(i>0){
    	response.sendRedirect("courseStructure.jsp");
    }
}
%>