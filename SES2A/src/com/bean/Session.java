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
	private String subjectName;
	private String assignType;
	private Boolean isAssignment;
	private Boolean isSendToStudent;
	private Boolean isSendToLecture;
	private String booked;//1.non-booked;2.booked;3.canceled
	private String isAttendance;//1.yes; 2.no
	private Student student;//n:1
	private Room room;//n:1
	private Admin admin;//n:1
	private Advisor advisor;//n:1
	private Attendance attendance;//1:1
	private Set<WaitingList> waitingLists = new HashSet<WaitingList>();//1:n
	private Set<Report> reports = new HashSet<Report>();//n:n
	private Set<ConfirmationEmail> confirmationEmails = new HashSet<ConfirmationEmail>();//1:n
	private Set<Comment> comments = new HashSet<Comment>();//1:n
	public Session() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Session(Integer sessionId, Date date, Date startTime, Date endTime, String type, String advisorName,
			String rule, String subjectName, String assignType, Boolean isAssignment, Boolean isSendToStudent,
			Boolean isSendToLecture, String booked, String isAttendance, Student student, Room room, Admin admin,
			Advisor advisor, Attendance attendance, Set<WaitingList> waitingLists, Set<Report> reports,
			Set<ConfirmationEmail> confirmationEmails, Set<Comment> comments) {
		super();
		this.sessionId = sessionId;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.type = type;
		this.advisorName = advisorName;
		this.rule = rule;
		this.subjectName = subjectName;
		this.assignType = assignType;
		this.isAssignment = isAssignment;
		this.isSendToStudent = isSendToStudent;
		this.isSendToLecture = isSendToLecture;
		this.booked = booked;
		this.isAttendance = isAttendance;
		this.student = student;
		this.room = room;
		this.admin = admin;
		this.advisor = advisor;
		this.attendance = attendance;
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
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getAssignType() {
		return assignType;
	}
	public void setAssignType(String assignType) {
		this.assignType = assignType;
	}
	public Boolean getIsAssignment() {
		return isAssignment;
	}
	public void setIsAssignment(Boolean isAssignment) {
		this.isAssignment = isAssignment;
	}
	public Boolean getIsSendToStudent() {
		return isSendToStudent;
	}
	public void setIsSendToStudent(Boolean isSendToStudent) {
		this.isSendToStudent = isSendToStudent;
	}
	public Boolean getIsSendToLecture() {
		return isSendToLecture;
	}
	public void setIsSendToLecture(Boolean isSendToLecture) {
		this.isSendToLecture = isSendToLecture;
	}
	public String getBooked() {
		return booked;
	}
	public void setBooked(String booked) {
		this.booked = booked;
	}
	public String getIsAttendance() {
		return isAttendance;
	}
	public void setIsAttendance(String isAttendance) {
		this.isAttendance = isAttendance;
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
	public Advisor getAdvisor() {
		return advisor;
	}
	public void setAdvisor(Advisor advisor) {
		this.advisor = advisor;
	}
	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
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
