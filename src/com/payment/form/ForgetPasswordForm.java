package com.payment.form;

import org.apache.struts.action.ActionForm;

/**
 * @author pankaj
 * created on 04-02-2019
 */
public class ForgetPasswordForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	private String enrollment;

	public String getEnrollment() {
		return enrollment;
	}

	public void setEnrollment(String enrollment) {
		this.enrollment = enrollment;
	}

	
}
