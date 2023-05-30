package com.example.biz.user;

public class UserVO {
	private String id;				//사원번호
	private String password;		//비밀번호
	private String name;			//사원이름
	private String role;			//사원직책
	private String team;			//소속부서
	private String phone;			//사원연락처
	private String phone1;			//사원연락처
	private String phone2;			//사원연락처
	private String phone3;			//사원연락처
	
	
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone1, String phone2, String phone3) {
		this.phone = phone1+"-"+phone2+"-"+phone3;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", role=" + role + "]";
	}
	
	
}
