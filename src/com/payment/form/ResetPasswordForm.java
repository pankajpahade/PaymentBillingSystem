package com.payment.form;

import org.apache.struts.action.ActionForm;

/**
 * @author pankaj
 * created on 12-02-2019
 */
public class ResetPasswordForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String password;
	private String confirmPassword;

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
