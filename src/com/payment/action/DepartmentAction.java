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
		
		String status = "error";
		connection = new DBConnection();
		DepartmentForm departmentFormBean = (DepartmentForm) form;
		
		int get=1;
		String getBranchNameReplace = departmentFormBean.getBranchName().replace("[","").replace("]","").replace("\"", "");
		String getBranchName[]=getBranchNameReplace.split(",");
		
		
		try 
		{
			Connection getConnection = connection.getDbConn();
			
			CallableStatement scallStatement= getConnection.prepareCall("{call INSERTDEPARTMNTANDBRANCH(?,?)}");
			scallStatement.setString(1, departmentFormBean.getDeptName());
			
			for(int i=0;i<getBranchName.length;i++)
			  {scallStatement.setString(2, getBranchName[i]);
			  get=scallStatement.executeUpdate();
			  }
			
			
		   if(get==0)
			{
				status = "success";
			}
			
			else 
			{
				status="error";
			}
			
		 
		}
		  catch (Exception e) {
			e.printStackTrace();
		}	
		
		  return mapping.findForward(status);
		
	}

	
}
 