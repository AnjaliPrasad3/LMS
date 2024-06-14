package com.lms.UserModel;

public class UserModel {
int id, courseId, studentId;
public int getStudentId() {
	return studentId;
}
public void setStudentId(int studentId) {
	this.studentId = studentId;
}
public int getCourseId() {
	return courseId;
}
public void setCourseId(int courseId) {
	this.courseId = courseId;
}

String name,email,password, role;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}

String desc,instructor,img;
int rating;
public String getDesc() {
	return desc;
}
public void setDesc(String desc) {
	this.desc = desc;
}
public String getInstructor() {
	return instructor;
}
public void setInstructor(String instructor) {
	this.instructor = instructor;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}

float amount;
public float getAmount() {
	return amount;
}
public void setAmount(float amount) {
	this.amount = amount;
}
int duration;
public int getDuration() {
	return duration;
}
public void setDuration(int duration) {
	this.duration = duration;
}
String level;
public String getLevel() {
	return level;
}
public void setLevel(String level) {
	this.level = level;
}
String startDate, endDate;
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
public String getEndDate() {
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
}

String section, subSection, video;
public String getSection() {
	return section;
}
public void setSection(String section) {
	this.section = section;
}
public String getSubSection() {
	return subSection;
}
public void setSubSection(String subSection) {
	this.subSection = subSection;
}
public String getVideo() {
	return video;
}
public void setVideo(String video) {
	this.video = video;
}

}
