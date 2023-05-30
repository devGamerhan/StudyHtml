package com.example.biz.util;

public class RefuseParameter {
	private int seq;
	private String refuse;
	private String reason;
	public RefuseParameter(int seq, String refuse, String reason) {
		this.seq = seq;
		this.refuse = refuse;
		this.reason = reason;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRefuse() {
		return refuse;
	}
	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
