package com.bean;

import java.util.HashSet;
import java.util.Set;


public class StudentProfile {
	private Integer profileId;
	private String preferredFirstName;
	private String bestContactNum;
	private String gender;
	private String degree;
	private String year;
	private String type;
	private String status;
	private String firstLanguage;
	private String countryOfOrigin;
	private String eduBgMark;
	private String eduBg;
	
	private Student student;//1:1
	private Message message;//n:1
	private Set<Report> reports = new HashSet<Report>();//n:n
	private Set<Admin> admins = new HashSet<Admin>();//n:n
	public StudentProfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentProfile(Integer profileId, String preferredFirstName, String bestContactNum, String gender,
			String degree, String year, String type, String status, String firstLanguage, String countryOfOrigin,
			String eduBgMark, String eduBg, Student student, Message message, Set<Report> reports, Set<Admin> admins) {
		super();
		this.profileId = profileId;
		this.preferredFirstName = preferredFirstName;
		this.bestContactNum = bestContactNum;
		this.gender = gender;
		this.degree = degree;
		this.year = year;
		this.type = type;
		this.status = status;
		this.firstLanguage = firstLanguage;
		this.countryOfOrigin = countryOfOrigin;
		this.eduBgMark = eduBgMark;
		this.eduBg = eduBg;
		this.student = student;
		this.message = message;
		this.reports = reports;
		this.admins = admins;
	}
	public Integer getProfileId() {
		return profileId;
	}
	public void setProfileId(Integer profileId) {
		this.profileId = profileId;
	}
	public String getPreferredFirstName() {
		return preferredFirstName;
	}
	public void setPreferredFirstName(String preferredFirstName) {
		this.preferredFirstName = preferredFirstName;
	}
	public String getBestContactNum() {
		return bestContactNum;
	}
	public void setBestContactNum(String bestContactNum) {
		this.bestContactNum = bestContactNum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFirstLanguage() {
		return firstLanguage;
	}
	public void setFirstLanguage(String firstLanguage) {
		this.firstLanguage = firstLanguage;
	}
	public String getCountryOfOrigin() {
		return countryOfOrigin;
	}
	public void setCountryOfOrigin(String countryOfOrigin) {
		this.countryOfOrigin = countryOfOrigin;
	}
	public String getEduBgMark() {
		return eduBgMark;
	}
	public void setEduBgMark(String eduBgMark) {
		this.eduBgMark = eduBgMark;
	}
	public String getEduBg() {
		return eduBg;
	}
	public void setEduBg(String eduBg) {
		this.eduBg = eduBg;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Set<Report> getReports() {
		return reports;
	}
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}
	public Set<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}
	@Override
	public String toString() {
		return "StudentProfile [profileId=" + profileId + ", preferredFirstName=" + preferredFirstName
				+ ", bestContactNum=" + bestContactNum + ", gender=" + gender + ", degree=" + degree + ", year=" + year
				+ ", type=" + type + ", status=" + status + ", firstLanguage=" + firstLanguage + ", countryOfOrigin="
				+ countryOfOrigin + ", eduBgMark=" + eduBgMark + ", eduBg=" + eduBg + ", student=" + student
				+ ", message=" + message + ", reports=" + reports + ", admins=" + admins + "]";
	}
	
	
	
	
}
