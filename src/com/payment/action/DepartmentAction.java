package com.payment.action;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.db.DBConnection;
import com.payment.form.DepartmentForm;

public class DepartmentAction extends Action
{
	DBConnection connection=null;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		String departName="",branchName="";
		String status = "error";
		connection = new DBConnection();
		DepartmentForm departmentFormBean = (DepartmentForm) form;
		System.out.println(departmentFormBean.getBranchName());
		int get=1;
		String getBranchNameReplace = departmentFormBean.getBranchName().replace("[","").replace("]","").replace("\"", "");
		String getBranchName[]=getBranchNameReplace.split(",");
		System.out.println("BranchNames::"+getBranchName[0]+ "     " +getBranchName[1]);
		ResultSet resultSet=null;
		
		try 
		{
			Connection getConnection = connection.getDbConn();
			String sqlQuery="select dName,bName from paybill.branches,paybill.department where dName=? and bName=?";
			PreparedStatement ps=getConnection.prepareStatement(sqlQuery);
			ps.setString(1, departmentFormBean.getDeptName());
			for(int i=0;i<getBranchName.length;i++)
			 {
				ps.setString(2,getBranchName[i]);
			     resultSet = ps.executeQuery();
			 }
			
			while(resultSet.next())
			{
				departName=resultSet.getString("dName");
				branchName=resultSet.getString("bName");
			}	
		
			if(departName!=departmentFormBean.getDeptName() && branchName!=departmentFormBean.getBranchName())
			{CallableStatement scallStatement= getConnection.prepareCall("{call INSERTDEPARTMNTANDBRANCH(?,?)}");
			scallStatement.setString(1, departmentFormBean.getDeptName());
			
			for(int i=0;i<getBranchName.length;i++)
			  {scallStatement.setString(2, getBranchName[i]);
			  get=scallStatement.executeUpdate();
			  }
			  get=scallStatement.executeUpdate();
			
		   if(get==0)
			{
				status = "success";
			}
			
			else 
			{
				status="error";
			}
			}
		 
		}
		  catch (Exception e) {
			e.printStackTrace();
		}	
		
		  return mapping.findForward(status);
		
	}

	
}
 