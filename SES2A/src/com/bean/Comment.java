package com.bean;

import java.util.Date;

public class Comment {
	private Integer commentId;
	private String description;
	private Date date;
	private Date time;
	
	private Student student;//n:1
	private Session session;//n:1
	private Admin admin;//n:1
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(Integer commentId, String description, Date date, Date time, Student student, Session session,
			Admin admin) {
		super();
		this.commentId = commentId;
		this.description = description;
		this.date = date;
		this.time = time;
		this.student = student;
		this.session = session;
		this.admin = admin;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
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
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
