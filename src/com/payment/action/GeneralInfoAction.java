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

public class GeneralInfoAction extends Action {

	DBConnection conn = null;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		 conn = new DBConnection();
		 String status = "";
		GeneralInfoForm formBean = (GeneralInfoForm) form;
		
		//GeneralInfo generalInfo = new GeneralInfo();
		
		/*generalInfo.setFirstname(formBean.getFirstname());
		generalInfo.setLastname(formBean.getLastname());
		generalInfo.setEmail(formBean.getEmail());
        generalInfo.setUsername(formBean.getUsername());
        generalInfo.setPassword(formBean.getPassword());*/
		
String sql = "insert into generalinfo (firstname, lastname, email, username, password) values(?, ?, ?, ?, ?)";
		
		String firstname = formBean.getFirstname();
		String lastname = formBean.getLastname();
		String email = formBean.getEmail();
		String username = formBean.getUsername();
		String password = formBean.getPassword();
		String confirmPassword = formBean.getConfirmPassword();
		
		if (password.equals(confirmPassword)) {
			
			if (firstname.isEmpty() || lastname.isEmpty() || email.isEmpty() || username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
				status="error";
			} else {
				try {
					Connection connection = conn.getDbConn();
					
					PreparedStatement ps = connection.prepareStatement(sql);
					
					ps.setString(1, firstname);
					ps.setString(2, lastname);
					ps.setString(3, email);
					ps.setString(4, username);
					ps.setString(5, password);
					
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
