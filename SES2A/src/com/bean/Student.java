package com.bean;

import java.util.*;

public class Student {
	private Integer studentId;
	private String firstName;
	private String lastName;
	private String password;
	private String faculty;
	private String course;
	private String email;
	private String phone;
	private String mobile;
	private String dob;
	
	private StudentProfile studentProfile;//1:1
	private Set<WaitingList> waitingLists = new HashSet<WaitingList>();//n:n
	private Set<ConfirmationEmail> confirmationEmails = new HashSet<ConfirmationEmail>();//1:n
	private Set<ReminderEmail> reminderEmails = new HashSet<ReminderEmail>();//1:n
	private Set<Comment> comments = new HashSet<Comment>();//1:n
	private Set<WorkShop> workShops = new HashSet<WorkShop>();//n:n
	private Set<Session> sessions = new HashSet<Session>();//1:n
	private Set<Attendance> attendances = new HashSet<Attendance>();//1:n
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(Integer studentId, String firstName, String lastName, String password, String faculty, String course,
			String email, String phone, String mobile, String dob, StudentProfile studentProfile,
			Set<WaitingList> waitingLists, Set<ConfirmationEmail> confirmationEmails, Set<ReminderEmail> reminderEmails,
			Set<Comment> comments, Set<WorkShop> workShops, Set<Session> sessions, Set<Attendance> attendances) {
		super();
		this.studentId = studentId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.faculty = faculty;
		this.course = course;
		this.email = email;
		this.phone = phone;
		this.mobile = mobile;
		this.dob = dob;
		this.studentProfile = studentProfile;
		this.waitingLists = waitingLists;
		this.confirmationEmails = confirmationEmails;
		this.reminderEmails = reminderEmails;
		this.comments = comments;
		this.workShops = workShops;
		this.sessions = sessions;
		this.attendances = attendances;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public StudentProfile getStudentProfile() {
		return studentProfile;
	}
	public void setStudentProfile(StudentProfile studentProfile) {
		this.studentProfile = studentProfile;
	}
	public Set<WaitingList> getWaitingLists() {
		return waitingLists;
	}
	public void setWaitingLists(Set<WaitingList> waitingLists) {
		this.waitingLists = waitingLists;
	}
	public Set<ConfirmationEmail> getConfirmationEmails() {
		return confirmationEmails;
	}
	public void setConfirmationEmails(Set<ConfirmationEmail> confirmationEmails) {
		this.confirmationEmails = confirmationEmails;
	}
	public Set<ReminderEmail> getReminderEmails() {
		return reminderEmails;
	}
	public void setReminderEmails(Set<ReminderEmail> reminderEmails) {
		this.reminderEmails = reminderEmails;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Set<WorkShop> getWorkShops() {
		return workShops;
	}
	public void setWorkShops(Set<WorkShop> workShops) {
		this.workShops = workShops;
	}
	public Set<Session> getSessions() {
		return sessions;
	}
	public void setSessions(Set<Session> sessions) {
		this.sessions = sessions;
	}
	public Set<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(Set<Attendance> attendances) {
		this.attendances = attendances;
	}
	
	
	
	
	
}
