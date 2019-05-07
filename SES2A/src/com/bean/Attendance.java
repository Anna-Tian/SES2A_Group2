package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Attendance {
	private Integer attendanceId;
	private String lastName;
	private String firstName;
	private Date date;
	private String time;
	private Boolean isPresent;
	
	private Student student;//n:1
	private Session session;//1:1
	private WorkShop workShop;//n:1
	private Set<Report> reports = new HashSet<Report>();//n:n
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attendance(Integer attendanceId, String lastName, String firstName, Date date, String time,
			Boolean isPresent, Student student, Session session, WorkShop workShop, Set<Report> reports) {
		super();
		this.attendanceId = attendanceId;
		this.lastName = lastName;
		this.firstName = firstName;
		this.date = date;
		this.time = time;
		this.isPresent = isPresent;
		this.student = student;
		this.session = session;
		this.workShop = workShop;
		this.reports = reports;
	}
	public Integer getAttendanceId() {
		return attendanceId;
	}
	public void setAttendanceId(Integer attendanceId) {
		this.attendanceId = attendanceId;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Boolean getIsPresent() {
		return isPresent;
	}
	public void setIsPresent(Boolean isPresent) {
		this.isPresent = isPresent;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	public WorkShop getWorkShop() {
		return workShop;
	}
	public void setWorkShop(WorkShop workShop) {
		this.workShop = workShop;
	}
	public Set<Report> getReports() {
		return reports;
	}
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}
	
	
}
