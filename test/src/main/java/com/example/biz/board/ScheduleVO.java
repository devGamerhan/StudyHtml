package com.example.biz.board;

public class ScheduleVO {
	private String scheduleName;	// 스케줄 이름
	private String choiceColor;		// 선택 색상
	private String startDate;		// 시작일
	private String endDate;			// 종료일
	public String getScheduleName() {
		return scheduleName;
	}
	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}
	public String getChoiceColor() {
		return choiceColor;
	}
	public void setChoiceColor(String choiceColor) {
		this.choiceColor = choiceColor;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
