var chk = 1;
/*function findEnrollment() {
	 var enrollNo = document.getElementById('enroll').value;
	 var chekEmpty = document.getElementById('eId').value;
	 var chekEmptyPass = document.getElementById('checkPass').value;
	 var chekEmptyCPass = document.getElementById('checkConfPass').value;
              $.ajax({
	            type: 'GET',
	            url: 'http://10.114.37.63:8080/UniversityEnrollmentService/rest/enrollment/getdata/'+enrollNo,
	            
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
	}*/

// Function For Check Avaibility Of Enrollment Number Into Univarsity Database  
var flag = true;
function findEnrollment() {
	flag = true;
	 var enrollment = document.getElementById('enroll').value;
	 $.ajax({
         type: 'GET',
         url: 'http://10.114.37.63:8080/UniversityEnrollmentService/rest/enrollment/getdata/'+enrollment,
         
         success: function(response) {
         	if(response == "YEsss"){
         		document.getElementById("enr").innerHTML='';       		
         	}else{
         		flag = false;
         	    document.getElementById("enr").innerHTML='Invalide Enrollment Number';
         		document.getElementById("enr").style.color="red";   
         	}
         },
         error: function(error) {
             console.log(error);
         }
	 });
}

//function to check format of email id
function checkPatternOfEmail(){
	
      var patternMatch=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;	
      var emailId=document.getElementById('eId').value;
      
      if(!patternMatch.test(emailId)){
    	    document.getElementById('emailId').innerHTML='Please enter valid email Id';	
		    document.getElementById('emailId').style.color="red";
		    return false;
        }else{
    	    document.getElementById('emailId').innerHTML='';	 
  		    return true;
    	}
}

// Function For Password Suggestion 
function instructPassword(){
	 var password = document.getElementById('checkPass').value;
	if (password != "") {
		document.getElementById('div1').innerHTML="";
	} else {
		document.getElementById('div1').innerHTML='Password Should Consist Atleast 1 Small Alphabet, 1 Capital Alphabet and 1 Numbers With Minimum 6 Characters';	
		document.getElementById('div1').style.color="green";
	}	
}

// Function For Check Password Pattern
function validatePassword() {
	
    var p = document.getElementById('checkPass').value;
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
    if(re.test(p)){
    	document.getElementById('div1').innerHTML='';	
    	return true;
    }else{
    	if (p == "") {
    		document.getElementById('div1').innerHTML='Please fill Password';	
    		document.getElementById('div1').style.color="red";
    		return false;
		} else {
			document.getElementById('div1').innerHTML='Password Should Consist Atleast 1 Small Alphabet, 1 Capital Alphabet and 1 Numbers With Minimum 6 Characters';	
			document.getElementById('div1').style.color="red";
			return false;
		}
    }
}

// Function For Check Empty Confirm Password
function checkConfPassword(){
	
	var pass = document.getElementById("checkPass").value;
	var confPass = document.getElementById("checkConfPass").value;
	
	if (pass != '' || confPass != '') {
		if (pass != confPass) {
			document.getElementById('cpass').innerHTML='Please Enter Confirm Password';	
			document.getElementById('cpass').style.color="red";
			chk = 0;
			return false;
		}else{
			document.getElementById('cpass').innerHTML='';
			chk = 1;
			return true;
		}
	}	
}

// Function For Submit Form After All True Validations
function submitValidate(){
	
	debugger;
	var i = document.getElementById('emptyform')
	var emptyEnroll = document.getElementById('enroll').value;
	var emptyEmail = document.getElementById('eId').value;
	var emptyPass = document.getElementById('checkPass').value;
	var emptyConfPass = document.getElementById('checkConfPass').value;
	
	if (emptyEnroll == "" || emptyEmail == "" || emptyPass == "" || emptyConfPass == "") {
		//document.getElementById('emptyform').innerHTML="Please Fill this Field";
		
		if (emptyEnroll == "") {
			document.getElementById('enr').innerHTML="Please Fill Enrollment Number";
			document.getElementById('enr').style.color="red";
		}
		if (emptyEmail == "") {
			document.getElementById('emailId').innerHTML="Please Fill Email";
			document.getElementById('emailId').style.color="red";
		}
		if (emptyPass == "") {
			document.getElementById('div1').innerHTML="Please Fill Password";
			document.getElementById('div1').style.color="red";
		}
		if (emptyConfPass == "") {
			document.getElementById('cpass').innerHTML="Please Fill Confirm Password";
			document.getElementById('cpass').style.color="red";
		}
	} else {	
		var enrollment = document.getElementById('enroll').value;
		var email = document.getElementById('eId').value;
		var password = document.getElementById('checkPass').value;
		
		if(flag){
		$.ajax({
			type : "GET",
			url : "./mygeneralinfo.do?action=execute",
			data: {"enrollment":enrollment, "email":email, "password":password},
			dataType: "text",
			success: function(response) {	
				if (response) { 
					location.href = "studentlogin.jsp";
				} else {
					document.getElementById("enr").innerHTML='Enrollment Number Already Registered';
	         		document.getElementById("enr").style.color="red";
	         		return false;
				}
			},
			error: function(error) {
	             console.log(error);
	        }
		});
		}
	}	
}