package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Report {
	private Integer reportId;
	private String title;
	private String description;
	private Date fromDate;
	private Date toDate;
	private String recordDate;
	
	private Set<WorkShop> workShops = new HashSet<WorkShop>();//n:n
	private Set<Session> sessions = new HashSet<Session>();//n:n
	private Set<WaitingList> waitingLists = new HashSet<WaitingList>();//n:n
	private Set<Attendance> attendances = new HashSet<Attendance>();//n:n
	private Set<StudentProfile> studentProfiles = new HashSet<StudentProfile>();//n:n
	private Admin admin;//n:1
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(Integer reportId, String title, String description, Date fromDate, Date toDate, String recordDate,
			Set<WorkShop> workShops, Set<Session> sessions, Set<WaitingList> waitingLists, Set<Attendance> attendances,
			Set<StudentProfile> studentProfiles, Admin admin) {
		super();
		this.reportId = reportId;
		this.title = title;
		this.description = description;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.recordDate = recordDate;
		this.workShops = workShops;
		this.sessions = sessions;
		this.waitingLists = waitingLists;
		this.attendances = attendances;
		this.studentProfiles = studentProfiles;
		this.admin = admin;
	}
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
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
	public Set<WaitingList> getWaitingLists() {
		return waitingLists;
	}
	public void setWaitingLists(Set<WaitingList> waitingLists) {
		this.waitingLists = waitingLists;
	}
	public Set<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(Set<Attendance> attendances) {
		this.attendances = attendances;
	}
	public Set<StudentProfile> getStudentProfiles() {
		return studentProfiles;
	}
	public void setStudentProfiles(Set<StudentProfile> studentProfiles) {
		this.studentProfiles = studentProfiles;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
