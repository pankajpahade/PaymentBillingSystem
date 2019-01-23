<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 --%><%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="C:/Users/pankaj.pahade/Documents/js/jquery-3.3.1.min"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="generalinfo.css">
</head>
<body>
 <center>
  <div class="container">
  <h1>Registration From</h1>
    <html:form action="/mygeneralinfo" method="POST">
    
     <table>
      <tr> 
       <td>Enrollment Number :</td>
       <td class="myinput"><html:text property="enrollment"></html:text></td>
      </tr>
      
      <tr> 
       <td>Password   :</td>
       <td class="myinput"><html:password property="password"></html:password></td>
      </tr>
      
      <tr> 
       <td>Confirm Password :</td>
       <td class="myinput"><html:password property="confirmPassword"></html:password></td>
      </tr>
      
      <tr> 
       <td><html:submit value="Submit" property="send"></html:submit></td>
       <td><html:cancel></html:cancel></td>
      </tr>
      </table>
    </html:form>
  </div>   
 </center> 
 
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#abc").attr("placeholder", "First Name");
});


 </script>
</body>
</html>