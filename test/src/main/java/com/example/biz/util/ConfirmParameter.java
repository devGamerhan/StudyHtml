package com.example.biz.util;

public class ConfirmParameter {
	private int seq;
	private String accept;
	public ConfirmParameter(int seq, String accept) {
		this.seq = seq;
		this.accept = accept;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
}
