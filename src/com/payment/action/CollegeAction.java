package com.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.form.CollegeForm;

public class CollegeAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		String status = "success";
		
		CollegeForm formBean =  (CollegeForm) form;
		
		System.out.println(formBean.getClgName());
		System.out.println("Came in action");
		return mapping.findForward(status);
	}

}
