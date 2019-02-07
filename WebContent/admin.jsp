<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

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
	function openTab(evt, cityName) {
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
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
		if(evt.currentTarget.id != 'mas'){
			document.getElementById("mas").style.background = "#f1f1f1";
		}else{
			document.getElementById("mas").style.background = "#ccc";
		}
	}

	function addRow() {
		var count = $('#myTable tr').length;
		var branch = count - 2 ;
		$('#myTable tr.dynamicRows')
				.before(
						'<tr id="tr_'+count+'" class="dynRows"><td>Branch '+branch+' :-</td><td><input type="text" name="branchsName" class="branchName" style=" width:120px;"></td><td><input type="button" value="X" onClick="del('
								+ count + ');"></td></tr>');

	}

	function del(id) {
		var trID = "tr_" + id;
		var elem = document.getElementById(trID);
		elem.parentElement.removeChild(elem);
	}
	
	function delRows(){
		$('#myTable tr.dynRows').remove();
	}
	
	function clearField(){
		document.getElementById("insClgMsg").style.visibility = "hidden";
	}
	
	function saveData(field){
		var url ;
		var fieldValue ;
		var clgName = "", deptName = "", branchNames = "";
		var branches = [];
		
		if(field == 'clg'){
			url = "./college.do?action=execute";
			clgName = document.getElementById('collegeName').value;
			/* alert(field+"---"+url+"---"+clgName); */
			$.ajax({  
			    type: "POST",  
			    url:url,
			    data: {"clgName":clgName},
			    dataType: "text",
			    success: function(response){  
			    	document.getElementById("insClgMsg").style.visibility = "visible";
			    },  
			    error: function(e){  
			      alert('Error: ' + e);  
                }  
			  });
		}else if(field = 'dept'){
			url = "./dept.do?action=execute";
			deptName = document.getElementById('departmentName').value;
			
			var inputs = $(".branchName");
			for(var i = 0; i < inputs.length; i++){
			   branches.push($(inputs[i]).val());
			}
			alert(deptName+"---"+branches);
			$.ajax({  
			    type: "POST",  
			    url:url,
			    data: {"deptName":deptName,"branchName":JSON.stringify(branches)},
			    dataType: "text",
			    success: function(response){  
			    	document.getElementById("insDeptMsg").style.visibility = "visible";
			    },  
			    error: function(e){  
			      alert('Error: ' + e);  
                }  
			  });
		}
	}
	
	
	function selectDepartment(evt){
		 var id=document.getElementById('myid').value;
		 var colId = document.getElementById('colId').value;
		 var xmlhttp=new XMLHttpRequest();
		 var el = document.getElementsByTagName('select')[1];
		 xmlhttp.onreadystatechange = function(data){
			 if (this.readyState == 4 && this.status == 200) {
				 localStorage.setItem("id","master");
				 window.location.href = "admin.jsp";
			 }
		 };
		 xmlhttp.open("GET","master.do?method=populate&id="+id+"&colId="+colId+"&selIds="+getSelectValues(el),true);
		 xmlhttp.send();
		 openTab(event, 'master');
	 };
	 
	 function selectCollege(evt){
		 var colId = document.getElementById('colId').value;
		 var xmlhttp=new XMLHttpRequest();
		 xmlhttp.onreadystatechange = function(data){
			 if (this.readyState == 4 && this.status == 200) {
				 localStorage.setItem("id","master");
				 window.location.href = "admin.jsp";
			 }
		 };
		 xmlhttp.open("GET","master.do?method=populate&colId="+colId,true);
		 xmlhttp.send();
		 openTab(event, 'master');
	 };

	function getSelectValues(select) {
		 var result = [];
		 var options = select && select.options;
		 var opt;
		
		 for (var i=0, iLen=options.length; i<iLen; i++) {
		   opt = options[i];
		
		   if (opt.selected) {
		     result.push(opt.value || opt.text);
		   }
		 }
		 return result;
	}
	
	function mytab(event){
		if(localStorage.getItem("id")){
			openTab(event,'master');
			localStorage.clear(); 
			document.getElementById("mas").style.background = "#ccc";
		}else{
			openTab(event,'clg');
		}
	}
	
	function masterSave(){
		var el = document.getElementsByTagName('select')[1];
		localStorage.setItem("id","save");
	}
	
	function masterReset(){
		localStorage.setItem("id","reset");
	}
</script>


</head>
<body onload="mytab(event)">

  <div class="container">
  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>ADMINISTRATOR</h1>
  </header>
   
  <br/>
   
  <div class="tab">
	  <button class="tablinks" onclick="openTab(event, 'clg')">Add College</button>
	  <button class="tablinks" onclick="openTab(event, 'dept')">Add Department</button>
	  <button class="tablinks" id="mas" onclick="openTab(event, 'master')">Master Link</button>
  </div>
  
  <div id="clg" class="tabcontent">
	  <html:form action="/college" method="POST" style="height: 80%, width:80%">
        <fieldset style="width: 80%  height: 80%">
           <legend>Add College:</legend>
           
           <table id="myTable1">
             <tr id="insClgMsg" style="visibility: hidden; color: green; height: 10px;"><td></td><td colspan="2">Clg Saved Successfully !</td></tr>
             <tr>
               <td>Add College :- </td>
               <td>
                 <html:text property="clgName" style=" width:120px;" styleId="collegeName"></html:text>
               </td>
               <td>
                 <input type="button" value="X" onClick="this.form.reset();clearField();" />
               </td>
              </tr>
                    
             <tr>
               <td></td>
               <%-- <td><html:submit style="width:100%" value="SAVE" property="send"></html:submit></td> --%>
                <td><html:button style="width:100%" value="SAVE" property="send" onclick="saveData('clg');"></html:button></td>
               <td colspan="2"></td>
             </tr>
           </table>
           
        </fieldset>
      </html:form>
  </div>
  
  <div id="dept" class="tabcontent">
     <html:form action="/dept" method="POST" style="height: 80%, width:80%">
        <fieldset style="width: 80%  height: 80%">
           <legend>Add/Update Department:</legend>
           
           <table id="myTable">
              <tr id="insDeptMsg" style="visibility: hidden; color: green;"><td></td><td colspan="2">Dept/Branch Saved Successfully !</td></tr>
             <tr>
               <td>Department :- </td>
               <td>
                 <html:text property="deptName" style=" width:120px;" styleId="departmentName"></html:text> 
              </td>
               <td>
                 <input type="button" value="X" onClick="this.form.reset(); delRows();" />
               </td>
               <td>  
                 <html:button property="myButton" onclick="addRow();">Add Branch</html:button>
               </td>
             </tr>
                    
             <tr class="dynamicRows">
               <td></td>
               <%-- <td><html:submit style="width:100%" value="SAVE" property="send"></html:submit></td> --%>
               <td><html:button style="width:100%" value="SAVE" property="send" onclick="saveData('dept')"></html:button></td>
               <td colspan="2"></td>
             </tr>
           </table>
           
        </fieldset>
      </html:form>
  </div>
   
   <div id="master" class="tabcontent">
   		<html:form action="/master" method="POST" style="height: 80%, width:80%" styleId="masterForm">
   		   <fieldset style="width: 80%,  height: 80%">
           <legend>Link Master Data</legend>
           		
            <table>
            	<tr>
            		<td colspan="2">
						<logic:equal name="masterForm" property="message" value="success">
							<p style="color:green">Master data linked successfully</p>
						</logic:equal>
						<logic:equal name="masterForm" property="message" value="error">
							<p style="color:red">Fail to link master data</p>
						</logic:equal>
					</td>
            	</tr>
            	<tr>
                    <td>
                        Select College :
                    </td>
                    <td>
                        <html:select property="collegeId" style='width:300px;padding:5px' styleId="colId" onchange="selectCollege(event)">
                            <html:option value="0">Select College</html:option>
                            <html:optionsCollection name="masterForm" property="collegeList" label="label" value="value"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Departement :
                    </td>
                    <td>
                        <html:select property="department" styleId="myid" multiple="true" onchange="selectDepartment()" style='width:300px;;height:100px;'>
                            <html:option value="0">Select Departement</html:option>
                            <html:optionsCollection name="masterForm" property="departmentList" label="label" value="value"/>
                        </html:select>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Select Branch :
                    </td>
                    <td>
                        <html:select property="branchIds" multiple="true" style='width:300px;height:150px;' styleId="m">
                            <html:option value="0">Select Branch</html:option>
                            <html:optionsCollection name="masterForm" property="branchList" label="label" value="value"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                	<td></td>
                    <td colspan="2">
                        <html:submit property="method" value="save" onclick="masterSave()"/>
                        <html:submit property="method" value="reset" onclick="masterReset()" />
                    </td>
                </tr>
            </table>
            </fieldset>
   		</html:form>
   </div>
   
  </div>   

</body>
</html>