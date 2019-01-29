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

 
 
/*function findEnrollment() {
	 var enrollNo = document.getElementById('enroll').value;
	 //const btnfield = document.getElementById('btn');


	 	//alert(pass);
              $.ajax({
	            type: 'GET',
	            url: 'http://localhost:8088/UniversityEnrollmentService/rest/enrollment/getdata/'+enrollNo,
	            
	            success: function(response) {
	            	if(response == "YEsss"){
//	            		document.getElementById("gnInfoForm").submit();
	            		$( "#gnInfoForm" ).submit();
	            		//alert(response+"hi");
	            		//document.getElementById("sub").style.visibility = "visible";
	            		//document.getElementById("errmsg").style.visibility = "hidden";
	            	}else{
	            	    document.getElementById("enr").innerHTML='Invalide Enrollment ID';
	            		document.getElementById("enr").style.color="red";
	            		
	            		//document.getElementById('validEnroll').innerHTML='Invalide Enrollment ID';
	            		//document.getElementById("errmsg").style.visibility = "visible";
	            		//alert("Invalid Enrollment Number, Please Enter Valid One");
	            		
	            	}
	            },
	            error: function(error) {
	                console.log(error);
	            }
	    	  }); 
	}
*/
function check(){
	var pass = document.getElementById("checkPass");
	var confPass = document.getElementById("checkConfPass");
	
	if (pass == confPass) {
		document.getElementById('message').style.visibility = "visible";	
	}
}