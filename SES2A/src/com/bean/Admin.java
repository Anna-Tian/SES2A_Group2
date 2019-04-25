package com.bean;

import java.util.HashSet;
import java.util.Set;

public class Admin {
	private Integer adminId;
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	
	private Set<SkillSet> skillSets = new HashSet<SkillSet>();//1:n
	private Set<Comment> comments = new HashSet<Comment>();//1:n
	private Set<ConfirmationEmail> confirmationEmails = new HashSet<ConfirmationEmail>();//1:n
	private Set<StudentProfile> studentProfiles = new HashSet<StudentProfile>();//n:n
	private Set<WaitingList> waitingLists = new HashSet<WaitingList>();//n:n
	private Set<Report> reports = new HashSet<Report>();//1:n
	private Set<WorkShop> workShops = new HashSet<WorkShop>();//1:n
	private Set<Session> sessions = new HashSet<Session>();//1:n
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(Integer adminId, String firstName, String lastName, String password, String email,
			Set<SkillSet> skillSets, Set<Comment> comments, Set<ConfirmationEmail> confirmationEmails,
			Set<StudentProfile> studentProfiles, Set<WaitingList> waitingLists, Set<Report> reports,
			Set<WorkShop> workShops, Set<Session> sessions) {
		super();
		this.adminId = adminId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
		this.skillSets = skillSets;
		this.comments = comments;
		this.confirmationEmails = confirmationEmails;
		this.studentProfiles = studentProfiles;
		this.waitingLists = waitingLists;
		this.reports = reports;
		this.workShops = workShops;
		this.sessions = sessions;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<SkillSet> getSkillSets() {
		return skillSets;
	}
	public void setSkillSets(Set<SkillSet> skillSets) {
		this.skillSets = skillSets;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Set<ConfirmationEmail> getConfirmationEmails() {
		return confirmationEmails;
	}
	public void setConfirmationEmails(Set<ConfirmationEmail> confirmationEmails) {
		this.confirmationEmails = confirmationEmails;
	}
	public Set<StudentProfile> getStudentProfiles() {
		return studentProfiles;
	}
	public void setStudentProfiles(Set<StudentProfile> studentProfiles) {
		this.studentProfiles = studentProfiles;
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
	
	
	
}
