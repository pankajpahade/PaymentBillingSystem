package com.payment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.db.DBConnection;
import com.payment.db.UtilDao;
import com.payment.form.MappingForm;
import com.payment.form.StudentLoginForm;


/**
 * @author pankaj
 * created on 26-01-2019
 */
public class StudentLoginAction extends Action {

	DBConnection conn = null;
	String enroll = null;
	String pass = null;
	UtilDao utilDao = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		String status = "";
		StudentLoginForm formBean = (StudentLoginForm) form;		
		String enrollment = formBean.getEnrollment();
		String password = formBean.getPassword();
		utilDao = new UtilDao();
		ResultSet resultSet = utilDao.checkEnrollment(enrollment);
		
		while (resultSet.next()) {
			enroll = resultSet.getString("enrollment");
			pass = resultSet.getString("password");
		}
		
		if ((enroll != null && pass != null) && (!enroll.isEmpty() && !pass.isEmpty()) && (pass.equals(password) && enroll.equals(enrollment))) {
			status = "success";
		}else {
			status=null;
		}
		
        List<MappingForm> colleges = new ArrayList<MappingForm>();
        List<MappingForm> depts = new ArrayList<MappingForm>();
        List<MappingForm> branches = new ArrayList<MappingForm>();
        
		conn = new DBConnection();
		String cSql = "select distinct CId, CName from paybill.collegeinfo where CName is not null ";
		String dSql = "select distinct deptId, dName from paybill.department where dName is not null";
		String bsql = "select distinct branchId, deptId, bName from paybill.branches where bName is not null";
		
		Connection connection = conn.getDbConn();
		PreparedStatement cps = connection.prepareStatement(cSql);
		PreparedStatement dps = connection.prepareStatement(dSql);
		PreparedStatement bps = connection.prepareStatement(bsql);
		
		ResultSet crs = cps.executeQuery();
		ResultSet drs = dps.executeQuery();
		ResultSet brs = bps.executeQuery();
		
		while (crs.next()) {
			//colleges.add(crs.getString("CName"));
			colleges.add(new MappingForm(crs.getInt("CId"),-1,crs.getString("CName")));
		}
		
		while(drs.next()) {
			//depts.add(drs.getString("dName"));
			depts.add(new MappingForm(drs.getInt("deptId"),-1, drs.getString("dName")));
		}
		
		while(brs.next()) {
			//branches.add(brs.getString("bName"));	
			branches.add(new MappingForm(brs.getInt("deptId"), brs.getInt("branchId"), brs.getString("bName")));
		}
		
		
        System.out.println(colleges+"----"+depts +"-----"+ branches);
		req.setAttribute("branches", branches);
		req.setAttribute("colleges", colleges);
		req.setAttribute("depts", depts);
		
		return mapping.findForward(status);
	}
}
