package com.payment.action;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;

import com.payment.db.MasterDao;
import com.payment.form.MasterForm;

public class MasterFormAction extends DispatchAction{
	
	public ActionForward populate(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		
		MasterForm inputForm = (MasterForm) form;
		MasterDao dao = new MasterDao();
    	List<LabelValueBean> collegeList = new ArrayList<LabelValueBean>();
    	List<LabelValueBean> departmentList = new ArrayList<LabelValueBean>();
    	Set<LabelValueBean> branchList = new LinkedHashSet<LabelValueBean>();
    	
    	String collegeId = request.getParameter("colId");
        String deptIds = request.getParameter("selIds");
        String[] ids = null;
        if(deptIds!=null) {
        	ids = deptIds.split(",");
        }
    	
        collegeList = dao.getCollegeData();
        if(collegeId!=null) {
        	departmentList = dao.getDepartmentData();
        }
        
        if(ids!=null) {
        	branchList = dao.getBranchData(ids);
        }

        inputForm.setCollegeList(collegeList);
        inputForm.setDepartmentList(departmentList);
        inputForm.setBranchList(branchList);
        inputForm.setBranchIds(new String[0]);
        inputForm.setDepartment(ids);
        inputForm.setCollegeId(request.getParameter("colId"));
        inputForm.setMessage("");
		
		return mapping.findForward("success");
	}
	
	 public ActionForward save(ActionMapping mapping, ActionForm  form,
	            HttpServletRequest request, HttpServletResponse response)
	            throws Exception {
	    	boolean flag = false;
	    	String collegeId = request.getParameter("collegeId");
	        String[] deptIds = request.getParameterValues("department");
	        String[] branchIds = request.getParameterValues("branchIds");
	        
	        MasterForm myform = (MasterForm) form;
	        MasterDao dao = new MasterDao();
	        
	        if(deptIds!=null && branchIds!=null) {
	        	flag = dao.saveMasterData(collegeId, dao.toCommaSepString(deptIds), dao.toCommaSepString(branchIds));
	        }
	        
	        if(flag) {
	        	myform.setMessage("success");
	        }else {
	        	myform.setMessage("error");
	        }
	        return mapping.findForward("success");
	    }
	    
	    public ActionForward reset(ActionMapping mapping, ActionForm  form,
	            HttpServletRequest request, HttpServletResponse response)
	            throws Exception {
	    	MasterForm myform = (MasterForm) form;
	    	myform.setMessage("");
	    	response.sendRedirect("master.do?method=populate");
	    	return mapping.findForward(null);
	    }
	
}
