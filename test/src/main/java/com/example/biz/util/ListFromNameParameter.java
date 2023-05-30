package com.example.biz.util;

public class ListFromNameParameter {
	private String name;
	private int page;
	
	public ListFromNameParameter(String name, int page) {
		this.name = name;
		this.page = page;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
