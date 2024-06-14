package com.lms.UserDaw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.UserModel.UserModel;


public class UserDaw {
	public static Connection getConnection() {
		 Connection con = null;
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_lms","root","");
		 }catch(Exception e) {
			 System.out.print(e);
		 }
		 return con;
	 }
	
	public static int savedata(UserModel u) {
		 int status = 0;
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("insert into tb_studentRegistration(name,email,password,role)values(?,?,?,?)");
			 ps.setString(1, u.getName());
			 ps.setString(2, u.getEmail());
			 ps.setString(3, u.getPassword());
			 ps.setString(4, u.getRole());
			 status = ps.executeUpdate();
		 }catch(Exception e) {
			 System.out.print(e);
		 }
		 return status;
	 }
	
	public static List<UserModel> getdata(){
		List<UserModel> list = new ArrayList<UserModel>();
		try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_studentRegistration");
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 UserModel u = new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setName(rs.getString("name"));
				 u.setEmail(rs.getString("email"));
				 u.setPassword(rs.getString("password"));
				 u.setRole(rs.getString("role"));
				 list.add(u);
			 }
		 }catch(Exception e) {
			 System.out.print(e);
		 }
		 return list;
	}
	
	public static UserModel getdatabyid(int id) {
		 UserModel u = null;
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_studentRegistration where id=?");
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 u=new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setName(rs.getString("name"));
				 u.setEmail(rs.getString("email"));
				 u.setPassword(rs.getString("password"));
				 u.setRole(rs.getString("role"));
		 }
		 }catch (Exception e) {
			 System.out.print(e);
		}
		 return u;
	 }
	
	public static int updatedata(UserModel u) {
		 int status=0;
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("update tb_studentRegistration set name=?, email=?, password=?, role=? where id=?");
			
				 ps.setString(1, u.getName());
				 ps.setString(2, u.getEmail());
				 ps.setString(3, u.getPassword());
				 ps.setString(4, u.getRole());
				 ps.setInt(5, u.getId());
				 
				 
				 status = ps.executeUpdate();
			
			 
		 }
		 catch (Exception e) {
			 System.out.print(e);
		}
		 return status;
	 }
	
	public static int deleteregistration(int id) {
		 int status = 0;
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("delete from tb_studentRegistration where id=?");
			 ps.setInt(1, id);
			 status = ps.executeUpdate();
		 }catch (Exception e) {
			 System.out.print(e);
		}
		 return status;
	 }
	
	public static UserModel login(UserModel u) {
		UserModel um = null;
		try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_studentRegistration where email=? and password=?");
			 
			 ps.setString(1, u.getEmail());
			 ps.setString(2, u.getPassword());
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 um = new UserModel();
				 um.setId(rs.getInt("id"));
				 um.setName(rs.getString("name"));
				 um.setEmail(rs.getString("email"));
				 um.setPassword(rs.getString("password"));
				 um.setRole(rs.getString("role"));
			 }
		}catch (Exception e) {
			 System.out.print(e);
		}
		return um;
	}
	
	public static int savecourse(UserModel u) {
		 int status = 0;
		 try {
	            Connection con = getConnection();
	            PreparedStatement ps = con.prepareStatement("insert into tb_courses(c_name,	c_duration,c_level,c_description,c_instructor,c_rating,c_img,c_amount)values(?,?,?,?,?,?,?,?)");
	            ps.setString(1, u.getName());
	            ps.setInt(2, u.getDuration());
	            ps.setString(3, u.getLevel());
	            ps.setString(4, u.getDesc());
	            ps.setString(5, u.getInstructor());
	            ps.setInt(6, u.getRating());
	            ps.setString(7, u.getImg());
	            ps.setFloat(8, u.getAmount());
	            status = ps.executeUpdate();
	        } catch(Exception e) {
	            System.out.print(e);
	        }
	        return status;

	 }
	public static List<UserModel> getCourse(){
		List<UserModel> list = new ArrayList<UserModel>();
		try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_courses");
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 UserModel u = new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setName(rs.getString("c_name"));
				 u.setDuration(rs.getInt("c_duration"));
				 u.setLevel(rs.getString("c_level"));
				 u.setDesc(rs.getString("c_description"));
				 u.setInstructor(rs.getString("c_instructor"));
				 u.setRating(rs.getInt("c_rating"));
				 u.setImg(rs.getString("c_img"));
				 u.setAmount(rs.getFloat("c_amount"));
				 list.add(u);
			 }
		 }catch(Exception e) {
			 System.out.print(e);
		 }
		 return list;
	}
	public static UserModel getcoursebyid(int id) {
		 UserModel u = null;
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_courses where id=?");
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 u=new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setName(rs.getString("c_name"));
				 u.setDuration(rs.getInt("c_duration"));
				 u.setLevel(rs.getString("c_level"));
				 u.setDesc(rs.getString("c_description"));
				 u.setInstructor(rs.getString("c_instructor"));
				 u.setRating(rs.getInt("c_rating"));
				 u.setImg(rs.getString("c_img"));
				 u.setAmount(rs.getFloat("c_amount"));
		 }
		 }catch (Exception e) {
			 System.out.print(e);
		}
		 return u;
	 }
	public static int savepurchasedData(UserModel u, int stId) {
		 int status = 0;
		 try {
	            Connection con = getConnection();
	            PreparedStatement ps = con.prepareStatement("insert into tb_purchasedcourse(course_id,student_id,amount,start_date,end_date)values(?,?,?,?,?)");
	            ps.setInt(1, u.getId());
	            ps.setInt(2, stId);
	            ps.setFloat(3, u.getAmount());
	            ps.setString(4, u.getStartDate());
	            ps.setString(5, u.getEndDate());
	            status = ps.executeUpdate();
	        } catch(Exception e) {
	            System.out.print(e);
	        }
	        return status;
	}
	public static List<UserModel> getPurchasedCourses() {
        List<UserModel> list = new ArrayList<UserModel>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT  t1.*, t2.c_name, t2.c_duration, t2.c_level, t2.c_description, t2.c_instructor, t2.c_rating, t2.c_img FROM tb_purchasedcourse as t1 LEFT JOIN tb_courses as t2 ON t1.course_id=t2.id");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserModel u = new UserModel();
                u.setId(rs.getInt("id"));
                u.setCourseId(rs.getInt("course_id"));
                u.setStudentId(rs.getInt("student_id"));
                u.setName(rs.getString("c_name"));
                u.setDuration(rs.getInt("c_duration"));
                u.setLevel(rs.getString("c_level"));
                u.setDesc(rs.getString("c_description"));
                u.setInstructor(rs.getString("c_instructor"));
                u.setRating(rs.getInt("c_rating"));
                u.setImg(rs.getString("c_img"));
                u.setAmount(rs.getFloat("amount"));
                u.setStartDate(rs.getString("start_date"));
                u.setEndDate(rs.getString("end_date"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        return list;
    }
	
	public static int saveCourseStructure(UserModel u) {
		 int status = 0;
		 try {
	            Connection con = getConnection();
	            PreparedStatement ps = con.prepareStatement("insert into tb_cousestructure(section, course_id, subSection, video)values(?,?,?,?)");
	            ps.setString(1, u.getSection());
	            ps.setInt(2, u.getId());
	            ps.setString(3, u.getSubSection());
	            ps.setString(4, u.getVideo());
	            status = ps.executeUpdate();
	        } catch(Exception e) {
	            System.out.print(e);
	        }
	        return status;

	 }
	
	public static List<UserModel> getCourseStructure(){
		List<UserModel> list = new ArrayList<UserModel>();
		try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("SELECT  t1.*, t2.c_name FROM tb_cousestructure as t1 LEFT JOIN tb_courses as t2 ON t1.course_id=t2.id");
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 UserModel u = new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setName(rs.getString("c_name"));
				 u.setSection((rs.getString("section")));
				 u.setSubSection(rs.getString("subSection"));
				 u.setVideo(rs.getString("video"));
				 u.setCourseId(rs.getInt("course_id"));
				 list.add(u);
			 }
		 }catch(Exception e) {
			 System.out.print(e);
		 }
		 return list;
	}
	
	public static List<UserModel> getCourseStructureById(int id) {
		List<UserModel> list = new ArrayList<UserModel>();
		 try {
			 Connection con = getConnection();
			 PreparedStatement ps = con.prepareStatement("select * from tb_cousestructure where course_id=?");
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 UserModel u = new UserModel();
				 u.setId(rs.getInt("id"));
				 u.setCourseId(rs.getInt("course_id"));
				 u.setSection(rs.getString("section"));
				 u.setSubSection(rs.getString("subSection"));
				 u.setVideo(rs.getString("video"));
				 list.add(u);
		 }
		 }catch (Exception e) {
			 System.out.print(e);
		}
		 return list;
	 }
}


