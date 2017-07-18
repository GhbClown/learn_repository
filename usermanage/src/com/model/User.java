package com.model;

public class User {
	private String yhId;
	private String yhName;
	private String yhPass;
	private String yhSexId;
	private String yhDeptId;
	private Sex sex;
	private Dept dept;

	public String getYhId() {
		return yhId;
	}

	public void setYhId(String yhId) {
		this.yhId = yhId;
	}

	public String getYhName() {
		return yhName;
	}

	public void setYhName(String yhName) {
		this.yhName = yhName;
	}

	public String getYhPass() {
		return yhPass;
	}

	public void setYhPass(String yhPass) {
		this.yhPass = yhPass;
	}

	public String getYhSexId() {
		return yhSexId;
	}

	public void setYhSexId(String yhSexId) {
		this.yhSexId = yhSexId;
	}

	public String getYhDeptId() {
		return yhDeptId;
	}

	public void setYhDeptId(String yhDeptId) {
		this.yhDeptId = yhDeptId;
	}

	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
}
