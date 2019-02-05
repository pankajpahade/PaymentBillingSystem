package com.payment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		conn = new DBConnection();
		String status = "";
		StudentLoginForm formBean = (StudentLoginForm) form;

		String sql = "select enrollment, password from generalinfo where enrollment = ?";
		
		String enrollment = formBean.getEnrollment();
		String password = formBean.getPassword();

		Connection connection = conn.getDbConn();
		
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, enrollment);
		
		ResultSet resultSet = ps.executeQuery();
		
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
}
