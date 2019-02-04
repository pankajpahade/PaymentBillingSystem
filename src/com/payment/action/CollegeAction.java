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
import com.payment.form.CollegeForm;

public class CollegeAction extends Action{
	

	DBConnection connection=null;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		connection = new DBConnection();
		 String status = "";
		
		CollegeForm collegeFormBean =  (CollegeForm) form;
		
		String sql = "insert into collegeinfo (CName) values(?)";
		try {
			Connection getConnection = connection.getDbConn();
			
			PreparedStatement ps = getConnection.prepareStatement(sql);
			
			ps.setString(1, collegeFormBean.getClgName());
			
			
			int i = ps.executeUpdate();
			
			if (i == 1) {
				status="success";
				
			}
			else
			{
				status = "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
	
		
	
		return mapping.findForward(status);
	}

}
