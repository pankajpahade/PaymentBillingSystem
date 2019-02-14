
/*Working Logic of dojo Ajax for restservices*/
/*require(
		[ "dojo/on", "dojo/dom", "dojo/_base/lang", "dojo/request", "dojo/dom-form", "dojo/json", "dojo/domReady!" ],
		function(on, dom, lang, request, domForm, JSON) {
			
			var enrollBtn = dom.byId("enrollBtn"),
 
			myObject = {
				id : "myObject",
				onClick : function(evt) {
					var enrolltxt = dom.byId("enrllText").value;
					if (enrolltxt) {
						alert("hiiii"+enrolltxt);
						on(dom.byId("enrollBtn"), "click", function(evt){
							alert("failfffff");
							 request.get("http://10.114.37.63:8080/UniversityEnrollmentService/rest/enrollment/getdata/"+enrolltxt,{
							 request.get("./forgetPassword.do?action=execute"+enrolltxt,{
								 query: {
									 enrolltxt: "enrolltxt"
								      },
								 handleAs: "text",
								 headers: { 
								        'Accept': 'text/plain',
								        'Content-Type': 'text/plain' 
								    }
							 }		
							 ).then(
							    function(response){
							    	alert("submittttt "+response);
							    	if (response) {
							    		alert("submit "+response);
							    		dom.byId("fgtPass").submit();
									} else {
										alert("error");
										document.getElementById("enrollFill").innerHTML='Enrollment Number Not Register';
						         		document.getElementById("enrollFill").style.color="red";
									}							    	
							    },
							    function(error){
							    	alert("fail");
							    }
							 ) .otherwise(function(err) {
								    console.error(err);
							  });
						});
					} else {
						dom.byId("enrollFill").innerHTML = "Please Fill Enrollment Number";
						dom.byId("enrollFill").style.color = "red";
					}
				}
			};

			on(enrollBtn, "click", myObject.onClick);
		});*/

function mngform() {
	var enrollment = document.getElementById("enrllText").value;
	if (enrollment != '') {
		$.ajax({
			type : "GET",
			url : "./forgetPassword.do?action=execute",
			data: {"enrollment":enrollment},
			dataType: "text",
			success: function(response) {			
				if (response) {
					document.getElementById("mailSuccess").innerHTML='Please Check Your Registered Email For Reset Password Link';
					document.getElementById("mailSuccess").style.color="green";
				} else {
					document.getElementById("enrollFill").innerHTML='Enrollment Number Not Register';
	         		document.getElementById("enrollFill").style.color="red";
				}
			},
			error: function(error) {
	             console.log(error);
	        }
		});	
	} else {
		document.getElementById("enrollFill").innerHTML = "Please Fill Enrollment Number";
		document.getElementById("enrollFill").style.color = "red";
	}	
}