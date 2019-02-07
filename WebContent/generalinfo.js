var chk = 1;
function findEnrollment() {
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

//Function to regular expression

function validatePassword() {
    var p = document.getElementById('checkPass').value,
        errors = [];
    if (p.length < 8 ) {
    	document.getElementById('div1').innerHTML='Your password length minimum of 8 characters';	
		document.getElementById('div1').style.color="red";
    }
    if (p.search(/[a-z]/i) < 0) {
    	document.getElementById('div1').innerHTML='Your password contains atleast one character';	
		document.getElementById('div1').style.color="red";
    }
    
    if (p.search(/[0-9]/) < 0) {
    	document.getElementById('div1').innerHTML='Your password contains atleast one number';	
		document.getElementById('div1').style.color="red";
    }
    
    if(p.length > 8 && p.search(/[a-z]/i) > 0 && p.search(/[0-9]/) > 0)
    	{
    	document.getElementById('div1').innerHTML='';	
    	return false;
    	}
    return true;
}


//function to check format of email id

function checkPatternOfEmail()
{
      var patternMatch=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;;	
      var emailId=document.getElementById('eId').value;
      
      if(!patternMatch.test(emailId))
    	  {
    	  document.getElementById('emailId').innerHTML='Please enter valid format of email Id';	
		     document.getElementById('emailId').style.color="red";
		     return true;
    	  }
      
      else
    	  {
    	    document.getElementById('emailId').innerHTML='';	
  		     
  		     return false;
    	  }

}

//function to check enrollment number through database
function checkEnrollmentNumber()
{
	 var enrollNo = document.getElementById('enroll').value;
     
	 $.ajax({  
		    type: "POST",  
		    url : "./mygeneralinfo.do?action=execute",
		   /* data: {"enrollment":enrollment,"email":email,"password":password},*/
		    data:{"enrollment":enrollment},
		    dataType: "text",
		    success: function(response){  
		    	
		    	 document.getElementById('enroll').innerHTML='';	
	  		     
	  		     
		    
		    },  
		    error: function(e){  
		    	document.getElementById('emailId').innerHTML='Please enter unregistered enrollment number';	
			     document.getElementById('emailId').style.color="red";
			     return true;
         }  
		  });
}