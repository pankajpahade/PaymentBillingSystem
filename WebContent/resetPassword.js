function resetPassSub(){
	var pass = document.getElementById("passId").value;
	var confPass = document.getElementById("confPassId").value;
	
	if ((pass != "" && confPass != "")) {
		alert("Success "+pass+" = "+confPass);
	} else {
        alert("fail");
        if (pass == "") {
        	document.getElementById("passEmpty").innerHTML="Please fill Password";
        	document.getElementById('passEmpty').style.color="red";
		}
        
        if (confPass == "") {
        	document.getElementById("emptyConfPass").innerHTML="Please fill Confirm Password";
        	document.getElementById('emptyConfPass').style.color="red";
		}
        
	}
}