package com.payment.form;

import org.apache.struts.action.ActionForm;

/**
 * 
 */
public class StudentLoginForm extends ActionForm {

	private static final long serialVersionUID = 1L;

    private String enrollment;
    private String password;
    
	public String getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(String enrollment) {
		this.enrollment = enrollment;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
