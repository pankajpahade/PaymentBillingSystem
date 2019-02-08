package com.payment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.db.DBConnection;
import com.payment.form.StudentLoginForm;

/**
 * @author pankaj
 * created on 26-01-2019
 */
public class StudentLoginAction extends Action {

	DBConnection conn = null;
	String enroll = null;
	String pass = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		String status = "";
		StudentLoginForm formBean = (StudentLoginForm) form;		
		String enrollment = formBean.getEnrollment();
		String password = formBean.getPassword();
		
		ResultSet resultSet = this.checkEnrollment(enrollment);
		
		while (resultSet.next()) {
			enroll = resultSet.getString("enrollment");
			pass = resultSet.getString("password");
		}
		
		if ((enroll != null && pass != null) && (!enroll.isEmpty() && !pass.isEmpty()) && (pass.equals(password) && enroll.equals(enrollment))) {
			status = "success";
		}else {
			status=null;
		}
		return mapping.findForward(status);
	}
	
	public ResultSet checkEnrollment(String enrollment) throws SQLException {
		conn = new DBConnection();
		String sql = "select * from generalinfo where enrollment = ?";
		Connection connection = conn.getDbConn();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, enrollment);
		ResultSet resultSet = ps.executeQuery();
		return resultSet;
	}
}
