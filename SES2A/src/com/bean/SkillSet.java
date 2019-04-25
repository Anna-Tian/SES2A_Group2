package com.bean;

import java.util.HashSet;
import java.util.Set;

public class SkillSet {
	private Integer skillSetId;
	private String name;
	private String shortName;
	
	private Admin admin;//n:1
	private Set<WorkShop> workShops = new HashSet<WorkShop>();//1:n
	public SkillSet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SkillSet(Integer skillSetId, String name, String shortName, Admin admin, Set<WorkShop> workShops) {
		super();
		this.skillSetId = skillSetId;
		this.name = name;
		this.shortName = shortName;
		this.admin = admin;
		this.workShops = workShops;
	}
	public Integer getSkillSetId() {
		return skillSetId;
	}
	public void setSkillSetId(Integer skillSetId) {
		this.skillSetId = skillSetId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Set<WorkShop> getWorkShops() {
		return workShops;
	}
	public void setWorkShops(Set<WorkShop> workShops) {
		this.workShops = workShops;
	}
	
	
}
