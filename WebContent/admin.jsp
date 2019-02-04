
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 

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
  padding: 0px 12px;
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
	}

	function addRow() {
		var count = $('#myTable tr').length;
		var branch = count - 1 ;
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
</script>


</head>
<body>

  <div class="container">
  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>ADMINISTRATOR</h1>
  </header>
   
  <br/>
   
  <div class="tab">
	  <button class="tablinks" onclick="openTab(event, 'clg')">Add College</button>
	  <button class="tablinks" onclick="openTab(event, 'dept')">Add Department</button>
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
   
  </div>   

</body>
</html>