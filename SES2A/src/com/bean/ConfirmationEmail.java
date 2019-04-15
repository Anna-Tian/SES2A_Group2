package com.bean;

public class ConfirmationEmail {
	private Integer confirmationId;
	private Boolean isSessConfSent;
	private String SessConfDateTime;
	private Boolean isWkshConfSent;
	private String WkshConfDateTime;
	
	private Student student;//n:1
	private Session session;//n:1
	private WorkShop workShop;//n:1
	private Admin admin;//n:1
	private ReminderEmail reminderEmail;//1:1
	public ConfirmationEmail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ConfirmationEmail(Integer confirmationId, Boolean isSessConfSent, String sessConfDateTime,
			Boolean isWkshConfSent, String wkshConfDateTime, Student student, Session session, WorkShop workShop,
			Admin admin, ReminderEmail reminderEmail) {
		super();
		this.confirmationId = confirmationId;
		this.isSessConfSent = isSessConfSent;
		SessConfDateTime = sessConfDateTime;
		this.isWkshConfSent = isWkshConfSent;
		WkshConfDateTime = wkshConfDateTime;
		this.student = student;
		this.session = session;
		this.workShop = workShop;
		this.admin = admin;
		this.reminderEmail = reminderEmail;
	}
	public Integer getConfirmationId() {
		return confirmationId;
	}
	public void setConfirmationId(Integer confirmationId) {
		this.confirmationId = confirmationId;
	}
	public Boolean getIsSessConfSent() {
		return isSessConfSent;
	}
	public void setIsSessConfSent(Boolean isSessConfSent) {
		this.isSessConfSent = isSessConfSent;
	}
	public String getSessConfDateTime() {
		return SessConfDateTime;
	}
	public void setSessConfDateTime(String sessConfDateTime) {
		SessConfDateTime = sessConfDateTime;
	}
	public Boolean getIsWkshConfSent() {
		return isWkshConfSent;
	}
	public void setIsWkshConfSent(Boolean isWkshConfSent) {
		this.isWkshConfSent = isWkshConfSent;
	}
	public String getWkshConfDateTime() {
		return WkshConfDateTime;
	}
	public void setWkshConfDateTime(String wkshConfDateTime) {
		WkshConfDateTime = wkshConfDateTime;
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
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public ReminderEmail getReminderEmail() {
		return reminderEmail;
	}
	public void setReminderEmail(ReminderEmail reminderEmail) {
		this.reminderEmail = reminderEmail;
	}
	
	
}
