package com.example.biz.board;


public class VacationVO {
	private int seq;				//번호
	private String team;			//소속
	private String role;			//직책
	private String vacationType;	//휴가 종류
	private String name;			//이름

	private String startDate;		//휴가 시작일
	private String endDate;			//휴가 마지막일
	private String phone;			//연락처

	private String subTeam;			//대행 소속
	private String subRole;			//대행 직책
	private String subName;			//대행 이름
	private String work;			//인수 내용
	
	private String accept;			//승인 여부
	private String reason;			//승인 거부 이유
	
	private int page;				//페이지
	private int totalCount;			//전체 페이지
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getVacationType() {
		return vacationType;
	}
	public void setVacationType(String vacationType) {
		this.vacationType = vacationType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSubTeam() {
		return subTeam;
	}
	public void setSubTeam(String subTeam) {
		this.subTeam = subTeam;
	}
	public String getSubRole() {
		return subRole;
	}
	public void setSubRole(String subRole) {
		this.subRole = subRole;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}

	
}
