package com.example.domain;

import java.sql.Date;

public class EnrollmentsVO {
	private String lcode;
	private String scode;
	private int grade;
	private Date edate;
	
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	
	@Override
	public String toString() {
		return "EnrollmentsVO [lcode=" + lcode + ", scode=" + scode + ", grade=" + grade + ", edate=" + edate + "]";
	}	
	
}
