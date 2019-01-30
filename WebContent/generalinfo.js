 /*function sayHello() {
	 alert("call");
	 var enrollNo = document.getElementById('enroll').value;
	 var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      alert(this.responseText);
	    }else{
	    	alert("error");
	    }
	  };
	 xhttp.open("GET","http://localhost:8088/UniversityEnrollmentService/rest/enrollment/getdata/"+enrollNo,true);
	 xhttp.send();
         }*/

 
/*function test(){
	alert("call");
	 var xhttp=new XMLHtttpRequest();
	 
	 var enrollNo = document.getElementById('enroll').value;
	 xhttp.onreadystatechange= function() {
		    if (this.readyState == 4 && this.status == 200) {
		        alert(this.responseText);
		      }else{
		    	  alert("errorrr");
		      }
	 }
	 xhttp.open("GET","http://localhost:8088/UniversityEnrollmentService/rest/enrollment/getdata/"+enrollNo,true);
	 xhttp.send();
 }*/

 
var chk = 1;
function findEnrollment() {
	 var enrollNo = document.getElementById('enroll').value;
	 //const btnfield = document.getElementById('btn');
	 
		/* if(document.getElementById("enroll").value=='RTM09'){
					document.getElementById("gnInfoForm").submit();
				}else{
					document.getElementById("enr").innerHTML = "Invalid Enrollment Number";
				} */
		 


	 	//alert(pass);
              $.ajax({
	            type: 'GET',
	            url: 'http://localhost:8080/UniversityEnrollmentService/rest/enrollment/getdata/'+enrollNo,
	            
	            success: function(response) {
	            	if(response == "YEsss"){
	            		if(chk == 1){
	            		  document.getElementById("gnInfoForm").submit();
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
		//alert(pass +" "+confPass);
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