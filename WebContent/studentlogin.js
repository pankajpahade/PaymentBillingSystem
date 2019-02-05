function checkAvailable() {
	var enrollment = document.getElementById('chekEnroll').value;
	var password = document.getElementById('checkPass').value;
	
	if (enrollment != "" && password != "") {
		$.ajax({
			type : "GET",
			url : "./studentlogin.do?action=execute",
			data: {"enrollment":enrollment, "password":password},
			dataType: "text",
			success: function(response) {			
				if (response) {
					document.getElementById('signInForm').submit();
				} else {
					document.getElementById("invalid").innerHTML='Invalide Enrollment Number OR Password';
	         		document.getElementById("invalid").style.color="red";
				}
			},
			error: function(error) {
	             console.log(error);
	        }
		});
	} else {
		if (enrollment == "" && password == "") {
			document.getElementById('invalid2').innerHTML = "Please fill All Fields";
			document.getElementById('invalid2').style.color="red";
		} else {
			if (enrollment == "") {
				document.getElementById('enrollEmpty').innerHTML = "Please fill Enrollment Number";
				document.getElementById('enrollEmpty').style.color="red";
			}else{
				document.getElementById('passEmpty').innerHTML = "Please fill Password";
				document.getElementById('passEmpty').style.color="red";
			}
		}				
	}
}
