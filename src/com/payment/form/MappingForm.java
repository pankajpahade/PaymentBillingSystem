package com.payment.form;

public class MappingForm {
	
	private int parentId;
	private int childId;
	private String fieldName;
	
	
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getChildId() {
		return childId;
	}
	public void setChildId(int childId) {
		this.childId = childId;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	public MappingForm(int parentId, int childId, String fieldName) {
		super();
		this.parentId = parentId;
		this.childId = childId;
		this.fieldName = fieldName;
	}
	@Override
	public String toString() {
		return "MappingForm [parentId=" + parentId + ", childId=" + childId + ", fieldName=" + fieldName + "]";
	}
	
	

}
