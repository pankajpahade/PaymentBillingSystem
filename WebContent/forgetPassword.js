function mngform() {
	var checkEnrollField = document.getElementById("enrllText").value;;
	
	if(checkEnrollField != ''){
		document.getElementById("fgtPass").submit();
	}else {
		document.getElementById("enrollFill").innerHTML="Please Fill Enrollment Number";
		document.getElementById("enrollFill").style.color="red";
	}	
}