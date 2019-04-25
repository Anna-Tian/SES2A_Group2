package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class WorkShop {
	private Integer workShopId;
	private String name;
	private Date startDate;
	private Date endDate;
	private String days;
	private String maximumPlace;
	private String placeAvailable;
	private String noOfSessions;
	private String targetGroup;
	private String description;
	
	private Admin admin;//n:1
	private Room room;//n:1
	private SkillSet skillSet;//n:1
	private Set<ConfirmationEmail> confirmationEmails = new HashSet<ConfirmationEmail>();//1:n
	private Set<Attendance> attendances = new HashSet<Attendance>();//1:n
	private Set<Report> reports = new HashSet<Report>();//n:n
	private Set<Student> students = new HashSet<Student>();//n:n
	public WorkShop() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WorkShop(Integer workShopId, String name, Date startDate, Date endDate, String days, String maximumPlace,
			String placeAvailable, String noOfSessions, String targetGroup, String description, Admin admin, Room room,
			SkillSet skillSet, Set<ConfirmationEmail> confirmationEmails, Set<Attendance> attendances,
			Set<Report> reports, Set<Student> students) {
		super();
		this.workShopId = workShopId;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.days = days;
		this.maximumPlace = maximumPlace;
		this.placeAvailable = placeAvailable;
		this.noOfSessions = noOfSessions;
		this.targetGroup = targetGroup;
		this.description = description;
		this.admin = admin;
		this.room = room;
		this.skillSet = skillSet;
		this.confirmationEmails = confirmationEmails;
		this.attendances = attendances;
		this.reports = reports;
		this.students = students;
	}
	public Integer getWorkShopId() {
		return workShopId;
	}
	public void setWorkShopId(Integer workShopId) {
		this.workShopId = workShopId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getMaximumPlace() {
		return maximumPlace;
	}
	public void setMaximumPlace(String maximumPlace) {
		this.maximumPlace = maximumPlace;
	}
	public String getPlaceAvailable() {
		return placeAvailable;
	}
	public void setPlaceAvailable(String placeAvailable) {
		this.placeAvailable = placeAvailable;
	}
	public String getNoOfSessions() {
		return noOfSessions;
	}
	public void setNoOfSessions(String noOfSessions) {
		this.noOfSessions = noOfSessions;
	}
	public String getTargetGroup() {
		return targetGroup;
	}
	public void setTargetGroup(String targetGroup) {
		this.targetGroup = targetGroup;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public SkillSet getSkillSet() {
		return skillSet;
	}
	public void setSkillSet(SkillSet skillSet) {
		this.skillSet = skillSet;
	}
	public Set<ConfirmationEmail> getConfirmationEmails() {
		return confirmationEmails;
	}
	public void setConfirmationEmails(Set<ConfirmationEmail> confirmationEmails) {
		this.confirmationEmails = confirmationEmails;
	}
	public Set<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(Set<Attendance> attendances) {
		this.attendances = attendances;
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
	
	
	
}
