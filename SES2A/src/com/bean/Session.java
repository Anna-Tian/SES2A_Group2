package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Session {
	private Integer sessionId;
	private Date date;
	private Date startTime;
	private Date endTime;
	private String type;
	private String advisorName;
	private String rule;
	
	private Student student;//n:1
	private Room room;//n:1
	private Admin admin;//n:1
	private Set<Attendance> attendances = new HashSet<Attendance>();//1:n
	private Set<WaitingList> waitingLists = new HashSet<WaitingList>();//1:n
	private Set<Report> reports = new HashSet<Report>();//n:n
	private Set<ConfirmationEmail> confirmationEmails = new HashSet<ConfirmationEmail>();//1:n
	private Set<Comment> comments = new HashSet<Comment>();//1:n
	public Session() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Session(Integer sessionId, Date date, Date startTime, Date endTime, String type, String advisorName,
			String rule, Student student, Room room, Admin admin, Set<Attendance> attendances,
			Set<WaitingList> waitingLists, Set<Report> reports, Set<ConfirmationEmail> confirmationEmails,
			Set<Comment> comments) {
		super();
		this.sessionId = sessionId;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.type = type;
		this.advisorName = advisorName;
		this.rule = rule;
		this.student = student;
		this.room = room;
		this.admin = admin;
		this.attendances = attendances;
		this.waitingLists = waitingLists;
		this.reports = reports;
		this.confirmationEmails = confirmationEmails;
		this.comments = comments;
	}
	public Integer getSessionId() {
		return sessionId;
	}
	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdvisorName() {
		return advisorName;
	}
	public void setAdvisorName(String advisorName) {
		this.advisorName = advisorName;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Set<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(Set<Attendance> attendances) {
		this.attendances = attendances;
	}
	public Set<WaitingList> getWaitingLists() {
		return waitingLists;
	}
	public void setWaitingLists(Set<WaitingList> waitingLists) {
		this.waitingLists = waitingLists;
	}
	public Set<Report> getReports() {
		return reports;
	}
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}
	public Set<ConfirmationEmail> getConfirmationEmails() {
		return confirmationEmails;
	}
	public void setConfirmationEmails(Set<ConfirmationEmail> confirmationEmails) {
		this.confirmationEmails = confirmationEmails;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	
	
}
