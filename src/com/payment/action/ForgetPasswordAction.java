package com.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ForgetPasswordAction extends Action {

	String status = "";
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String enrollemnt = request.getParameter("enrollment");
		
		if (enrollemnt != null) {
			status = "success";
		} else {
            status = "error";
		}
		return mapping.findForward(status);
	}

   
}
