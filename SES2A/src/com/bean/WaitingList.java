package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class WaitingList {
	private Integer waitingListId;
	//private Student student;
	private String waitingDateTime;
	private String waitingStatus;
	private String firstName;
	private String lastName;
	private String workShopId;

	private Session session;//n:1
	private Set<Admin> admins = new HashSet<Admin>();//n:n
	private Set<Report> reports = new HashSet<Report>();//n:n
	private Set<Student> students = new HashSet<Student>();//n:n
	public WaitingList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WaitingList(Integer waitingListId, String waitingDateTime, String waitingStatus, String firstName,
			String lastName, Session session, Set<Admin> admins, Set<Report> reports, Set<Student> students) {
		super();
		this.waitingListId = waitingListId;
		this.waitingDateTime = waitingDateTime;
		this.waitingStatus = waitingStatus;
		this.firstName = firstName;
		this.lastName = lastName;
		this.session = session;
		this.admins = admins;
		this.reports = reports;
		this.students = students;
		this.workShopId=workShopId;
	}
	public Integer getWaitingListId() {
		return waitingListId;
	}
	public void setWaitingListId(Integer waitingListId) {
		this.waitingListId = waitingListId;
	}
	public String getWaitingDateTime() {
		return waitingDateTime;
	}
	public void setWaitingDateTime(String waitingDateTime) {
		this.waitingDateTime = waitingDateTime;
	}
	public String getWaitingStatus() {
		return waitingStatus;
	}
	public void setWaitingStatus(String waitingStatus) {
		this.waitingStatus = waitingStatus;
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
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	public Set<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}
	public Set<Report> getReports() {
		return reports;
	}
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public String getWorkShopId() {
		return workShopId;
	}
	public void setWorkShopId(String workShopId) {
		this.workShopId = workShopId;
	
	
	
}
}
