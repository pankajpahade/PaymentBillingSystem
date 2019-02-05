var chk = 1;
function findEnrollment() {
	 var enrollNo = document.getElementById('enroll').value;
	 var chekEmpty = document.getElementById('eId').value;
	 var chekEmptyPass = document.getElementById('checkPass').value;
	 var chekEmptyCPass = document.getElementById('checkConfPass').value;
              $.ajax({
	            type: 'GET',
	            url: 'http://localhost:8080/UniversityEnrollmentService/rest/enrollment/getdata/'+enrollNo,
	            
	            success: function(response) {
	            	if(response == "YEsss"){
	            		if(chk == 1){
	            			if (chekEmpty != '' && chekEmptyPass != '' && chekEmptyCPass != '') {
	            				document.getElementById("gnInfoForm").submit();	            				
							}else {
								document.getElementById("emptyform").innerHTML='Please Fill All Entries';
				            	document.getElementById("emptyform").style.color="red";
							}
	            		} 
	            	}else{
	            	    document.getElementById("enr").innerHTML='Invalide Enrollment Number';
	            		document.getElementById("enr").style.color="red";
	            	}
	            },
	            error: function(error) {
	                console.log(error);
	            }
	    	  }); 
	}

function check(){
	var pass = document.getElementById("checkPass").value;
	var confPass = document.getElementById("checkConfPass").value;
	
	if (pass != '' || confPass != '') {
		if (pass != confPass) {
			document.getElementById('cpass').innerHTML='Please Enter Confirm Password';	
			document.getElementById('cpass').style.color="red";
			chk = 0;
		}else{
			document.getElementById('cpass').innerHTML='';
			chk = 1;
		}
	}	
}