package com.payment.form;

import org.apache.struts.action.ActionForm;

/**
 * @author pankaj
 * created on 26-01-2019
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
