package com.payment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.sql.ResultSet;
import com.payment.db.DBConnection;
import com.payment.db.UtilDao;
import com.payment.form.GeneralInfoForm;

/**
 * @author pankaj
 * created on 17-01-2019
 */
public class GeneralInfoAction extends Action {

	DBConnection conn = null;
	String enrlmnt = null;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		conn = new DBConnection();
		String status = "";
		UtilDao utilDao = new UtilDao();
		 
		GeneralInfoForm formBean = (GeneralInfoForm) form;
        String insertSql = "insert into generalinfo (enrollment, email, password) values(?, ?, ?)";
        
        String password = formBean.getPassword();
        //String confirmPassword = formBean.getConfirmPassword();
        String email = formBean.getEmail();
        String enrollment = formBean.getEnrollment();
        
       // String enrollment = req.getParameter("enrollment");
       // String enrollment = req.getParameter("enrollment");
       // String email = req.getParameter("email");
       // String password = req.getParameter("password");
	   // String confirmPassword = req.getParameter("confirmPassword");
        
        ResultSet resultSet = utilDao.checkEnrollment(enrollment);
        
        while (resultSet.next()) {
        	enrlmnt = resultSet.getString("enrollment");
		}
        
        if (enrollment.equals(enrlmnt)) {
        	 status = null;
		} else {
			 try {
	             Connection connection = conn.getDbConn();
			     PreparedStatement ps = connection.prepareStatement(insertSql);
	        
	             ps.setString(1, enrollment);
			     ps.setString(2, email);
			     ps.setString(3, password);
	        
			     int i = ps.executeUpdate();
			
	             if (i == 1) {
	        	     status = "success";
			     } else {
				     status = null;
			     }
	        }catch (Exception e) {
				e.printStackTrace();
			}   
		}
        System.out.println(status+" llllllllll");
		return mapping.findForward(status);
  }
}
