package com.bean;

import java.util.HashSet;
import java.util.Set;

public class Message {
	private Integer messageId;
	private String messageLocation;
	private String messageDetailed;
	
	private Set<StudentProfile> studentProfiles = new HashSet<StudentProfile>();//1:n

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(Integer messageId, String messageLocation, String messageDetailed,
			Set<StudentProfile> studentProfiles) {
		super();
		this.messageId = messageId;
		this.messageLocation = messageLocation;
		this.messageDetailed = messageDetailed;
		this.studentProfiles = studentProfiles;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getMessageLocation() {
		return messageLocation;
	}

	public void setMessageLocation(String messageLocation) {
		this.messageLocation = messageLocation;
	}

	public String getMessageDetailed() {
		return messageDetailed;
	}

	public void setMessageDetailed(String messageDetailed) {
		this.messageDetailed = messageDetailed;
	}

	public Set<StudentProfile> getStudentProfiles() {
		return studentProfiles;
	}

	public void setStudentProfiles(Set<StudentProfile> studentProfiles) {
		this.studentProfiles = studentProfiles;
	}
	
	
}
