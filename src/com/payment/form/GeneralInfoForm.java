package com.payment.form;

import org.apache.struts.action.ActionForm;

/**
 * @author pankaj
 * created on 17-01-2019
 */
public class GeneralInfoForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String enrollment;
	private String email;
	private String password;
	private String confirmPassword;
	
	public String getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(String enrollment) {
		this.enrollment = enrollment;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
