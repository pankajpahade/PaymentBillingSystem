package com.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.form.DepartmentForm;

public class DepartmentAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		System.out.println("Came in Action");
		
		String status = "success";
		
		DepartmentForm formBean = (DepartmentForm) form;
		
		System.out.println("---->"+formBean.getDeptName()+"---"+formBean.getBranchName());
		
		
		
		return mapping.findForward(status);
		
	}

}
 