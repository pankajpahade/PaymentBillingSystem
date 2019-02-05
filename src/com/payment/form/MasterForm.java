package com.payment.form;

import java.util.List;
import java.util.Set;

import org.apache.struts.action.ActionForm;
import org.apache.struts.util.LabelValueBean;

public class MasterForm extends ActionForm{
	
	private String collegeId;
	private List<LabelValueBean> collegeList;
    private String[] department;
    private List<LabelValueBean> departmentList;
    private String branch;
    private Set<LabelValueBean> branchList;
    private String[] branchIds;
    private String message;
    
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public List<LabelValueBean> getCollegeList() {
		return collegeList;
	}
	public void setCollegeList(List<LabelValueBean> collegeList) {
		this.collegeList = collegeList;
	}
	public String[] getDepartment() {
		return department;
	}
	public void setDepartment(String[] department) {
		this.department = department;
	}
	public List<LabelValueBean> getDepartmentList() {
		return departmentList;
	}
	public void setDepartmentList(List<LabelValueBean> departmentList) {
		this.departmentList = departmentList;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public Set<LabelValueBean> getBranchList() {
		return branchList;
	}
	public void setBranchList(Set<LabelValueBean> branchList) {
		this.branchList = branchList;
	}
	public String[] getBranchIds() {
		return branchIds;
	}
	public void setBranchIds(String[] branchIds) {
		this.branchIds = branchIds;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
