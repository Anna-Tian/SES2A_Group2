package com.bean;

import java.util.HashSet;
import java.util.Set;


public class Room {
	private Integer roomId;
	private String roomLocation;
	
	private Set<WorkShop> workShops = new HashSet<WorkShop>();//1:n
	private Set<Session> sessions = new HashSet<Session>();//1:n
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Room(Integer roomId, String roomLocation, Set<WorkShop> workShops, Set<Session> sessions) {
		super();
		this.roomId = roomId;
		this.roomLocation = roomLocation;
		this.workShops = workShops;
		this.sessions = sessions;
	}
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getRoomLocation() {
		return roomLocation;
	}
	public void setRoomLocation(String roomLocation) {
		this.roomLocation = roomLocation;
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
