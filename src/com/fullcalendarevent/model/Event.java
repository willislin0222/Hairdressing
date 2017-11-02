package com.fullcalendarevent.model;

import java.sql.Date;

public class Event {
	private String id;
	private String Title;
	private Date Start;
	private Date End;
	private boolean AllDay;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public Date getStart() {
		return Start;
	}
	public void setStart(Date start) {
		Start = start;
	}
	public Date getEnd() {
		return End;
	}
	public void setEnd(Date end) {
		End = end;
	}
	public boolean isAllDay() {
		return AllDay;
	}
	public void setAllDay(boolean allDay) {
		AllDay = allDay;
	}
}
