package com.bean;

import java.util.HashSet;
import java.util.Set;

public class Advisor {
	private Integer advisorId;
	private String staffNumber;
	private String firstName;
	private String lastName;
	private String email;
	private Set<Session> sessions = new HashSet<Session>();//1:n
	public Advisor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Advisor(Integer advisorId, String staffNumber, String firstName, String lastName, String email,
			Set<Session> sessions) {
		super();
		this.advisorId = advisorId;
		this.staffNumber = staffNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.sessions = sessions;
	}
	public Integer getAdvisorId() {
		return advisorId;
	}
	public void setAdvisorId(Integer advisorId) {
		this.advisorId = advisorId;
	}
	public String getStaffNumber() {
		return staffNumber;
	}
	public void setStaffNumber(String staffNumber) {
		this.staffNumber = staffNumber;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<Session> getSessions() {
		return sessions;
	}
	public void setSessions(Set<Session> sessions) {
		this.sessions = sessions;
	}
	
	
}