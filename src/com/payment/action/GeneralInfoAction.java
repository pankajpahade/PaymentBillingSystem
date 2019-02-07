package com.payment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.db.DBConnection;
import com.payment.form.GeneralInfoForm;

/**
 * @author pankaj
 * created on 17-01-2019
 */
public class GeneralInfoAction extends Action {

	DBConnection conn = null;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		 conn = new DBConnection();
		 String status = "";
		 
		 GeneralInfoForm formBean = (GeneralInfoForm) form;
		 String getEnrollmentNumberQuery="select enrollment from generalinfo where enrollment=?";
	      
	
        String sql = "insert into generalinfo (enrollment, email, password) values(?, ?, ?)";
        String password = formBean.getPassword();
       // String enrollment = req.getParameter("enrollment");
        String enrollment = req.getParameter("enrollment");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		
		if (password.equals(confirmPassword)) {
			
			if (enrollment.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
				status="error";
			} else {
				try {
					Connection connection = conn.getDbConn();
					
					PreparedStatement ps = connection.prepareStatement(sql);
					
					ps.setString(1, enrollment);
					ps.setString(2, email);
					ps.setString(3, password);
					
					int i = ps.executeUpdate();
					
					if (i == 1) {
						status="success";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}	          
			}
		} else {
			status="error";
		}	
		return mapping.findForward(status);
  }
}
