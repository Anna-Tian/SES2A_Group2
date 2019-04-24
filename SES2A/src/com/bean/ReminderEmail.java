package com.bean;

import java.util.Date;

public class ReminderEmail {
	private Integer reminderId;
	private Boolean isSessReminderSent;
	private Date SessReminderDateTime;
	private Boolean isWkshReminderSent;
	private Date wkshReminderSent;
	
	private Student student;//n:1
	private ConfirmationEmail confirmationEmail;//1:1
	public ReminderEmail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReminderEmail(Integer reminderId, Boolean isSessReminderSent, Date sessReminderDateTime,
			Boolean isWkshReminderSent, Date wkshReminderSent, Student student, ConfirmationEmail confirmationEmail) {
		super();
		this.reminderId = reminderId;
		this.isSessReminderSent = isSessReminderSent;
		SessReminderDateTime = sessReminderDateTime;
		this.isWkshReminderSent = isWkshReminderSent;
		this.wkshReminderSent = wkshReminderSent;
		this.student = student;
		this.confirmationEmail = confirmationEmail;
	}
	public Integer getReminderId() {
		return reminderId;
	}
	public void setReminderId(Integer reminderId) {
		this.reminderId = reminderId;
	}
	public Boolean getIsSessReminderSent() {
		return isSessReminderSent;
	}
	public void setIsSessReminderSent(Boolean isSessReminderSent) {
		this.isSessReminderSent = isSessReminderSent;
	}
	public Date getSessReminderDateTime() {
		return SessReminderDateTime;
	}
	public void setSessReminderDateTime(Date sessReminderDateTime) {
		SessReminderDateTime = sessReminderDateTime;
	}
	public Boolean getIsWkshReminderSent() {
		return isWkshReminderSent;
	}
	public void setIsWkshReminderSent(Boolean isWkshReminderSent) {
		this.isWkshReminderSent = isWkshReminderSent;
	}
	public Date getWkshReminderSent() {
		return wkshReminderSent;
	}
	public void setWkshReminderSent(Date wkshReminderSent) {
		this.wkshReminderSent = wkshReminderSent;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public ConfirmationEmail getConfirmationEmail() {
		return confirmationEmail;
	}
	public void setConfirmationEmail(ConfirmationEmail confirmationEmail) {
		this.confirmationEmail = confirmationEmail;
	}
	
	
}
