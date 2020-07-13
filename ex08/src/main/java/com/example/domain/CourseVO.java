package com.example.domain;

public class CourseVO {
	
	private String lcode;
	private String lname;
	private String pname;
	
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Override
	public String toString() {
		return "CourseVO [lcode=" + lcode + ", lname=" + lname + ", pname=" + pname + "]";
	}	
	
}
