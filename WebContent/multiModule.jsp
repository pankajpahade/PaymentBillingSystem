<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page import = "java.io.*,java.util.*" %>

<%@page import="org.json.JSONObject"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>PBS</title>
<link rel="stylesheet" type="text/css" href="admin.css"> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style type="text/css">
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: blue;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  border: 1px solid #ccc;
  width: 80%;
  border-left: none;
  height: 500px;
  display: none;
}
</style>

<script>
	function openTab(evt, tabName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		
		document.getElementById(tabName).style.display = "block";
				
		evt.currentTarget.className += " active";
		if(evt.currentTarget.id != 'mas'){
			document.getElementById("mas").style.background = "#f1f1f1";
		}else{
			document.getElementById("mas").style.background = "#ccc";
		}
	}

	
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#branchNames").children('option:gt(0)').hide(); //clg
    $("#deptNames").children('option:gt(0)').hide(); //dept
    $("#semester").children('option:gt(0)').hide();
    $("#clgNames").change(function() {
    	 $("#deptNames").children("option:gt(0)").show(); //dept
    })
    $("#deptNames").change(function() { //clg
        $("#branchNames").children('option').hide();//dept
        $("#branchNames").children("option[value^=" + $(this).val() + "]").show()//dept
    })
    $("#branchNames").change(function() { //dept
    	 $("#semester").children("option:gt(0)").show();
    })
    $("#semester").change(function() {
    	var x = Math.floor((Math.random() * 10000) + 1000);
  	    document.getElementById("fees").value = x+".00";
    })
})
</script>


</head>

<body>

  <div class="container">
  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>PAYMENT MODULES</h1>
  </header>
   
  <br/>
   
  <div class="tab">
	  <button class="tablinks" onclick="openTab(event, 'exam')">EXAM FEES</button>
	  <button class="tablinks" onclick="openTab(event, 'university')">UNIVERSITY FEES</button>
	  <button class="tablinks" id="mas" onclick="openTab(event, 'college')">COLLEGE FEES</button>
  </div>
  
  
  
  <div id="exam" class="tabcontent">
	    <fieldset style="width: 50%  height: 80%">
           <legend>EXAM FEES</legend>
           <table>
             <tr>
               <td>Select College: </td>
               <td>
               <select name="clgNames" id="clgNames">
                <option>---Select College---</option>
                <logic:iterate name="colleges" id="college">
                  <c:set var="id"><bean:write name="college" property="parentId" format="0"/>  </c:set>  
                  <c:set var="college"><bean:write name="college" property="fieldName"/></c:set> 
                 <option id="${id}" value="${college}">${college}</option>
                </logic:iterate>
               </select>
               </td>
               
              </tr>
              <tr>
               <td>Select Department: </td>
               <td>
               <select name="deptNames" id="deptNames" >
                <option>---Select Department---</option>
                <logic:iterate name="depts" id="dept">
                 <c:set var="id"><bean:write name="dept" property="parentId" format="0"/>  </c:set> 
                 <c:set var="dept"><bean:write name="dept" property="fieldName"/></c:set>
                   <option id="${id}" value="${id}">${dept}</option>
                </logic:iterate>
               </select>
               </td>
              </tr>
              
              <tr> 
               <td>Select Branch: </td>
               <td>
               <select name="branchNames" id="branchNames" >
               <option>---Select Branch---</option>
                <logic:iterate name="branches" id="branch">
                 <c:set var="pId"><bean:write name="branch" property="parentId" format="0"/></c:set>
                 <c:set var="cId"><bean:write name="branch" property="childId" format="0"/></c:set>
                 <c:set var="branch"><bean:write name="branch" property="fieldName"/></c:set>
                 <option id="${cId}" value="${pId}">${branch}</option> 
                </logic:iterate>
               </select>
               </td>
               </tr> 
               
               <tr>
                <td>Select Semester: </td>
                <td>
                <select name="semesters" id="semester">
                <option>---Select Semester---</option>
                <option id="sem1">Semester 1</option>
                <option id="sem2">Semester 2</option>
                <option id="sem3">Semester 3</option>
                <option id="sem4">Semester 4</option>
                <option id="sem5">Semester 5</option>
                <option id="sem6">Semester 6</option>
                <option id="sem7">Semester 7</option>
                </select>
                </td>
               </tr>
               
               <tr>
                <td>Exam Fees: </td>
                <td><input type="text" readonly="readonly" id="fees" style="background: #dddddd" value="" /></td>
               </tr>
               
               <tr>
               <td></td>
               <td><input type="button" value="PAY" /></td>
               </tr>
           </table>
        </fieldset>
  </div>
  
  <div id="university" class="tabcontent">
     <%-- <html:form action="/dept" method="POST" style="height: 80%, width:80%" styleId="deptForm"> --%>
        <fieldset style="width: 80%  height: 80%">
           <legend>UNIVERSITY FEES</legend>
           
           
           
        </fieldset>
     <%--  </html:form> --%>
  </div>
   
   <div id="college" class="tabcontent">
   		<%-- <html:form action="/master" method="POST" style="height: 80%, width:80%" styleId="masterForm"> --%>
   		   <fieldset style="width: 80%,  height: 80%">
           <legend>COLLEGE FEES</legend>
           		
            
           </fieldset>
   		<%-- </html:form> --%>
   </div>
   
  </div>   

</body>
</html>