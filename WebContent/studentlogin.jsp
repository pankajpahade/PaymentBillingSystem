<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="studentlogin.css">
</head>
<body>
<center>
 <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>PAYMENT BILLING SYSTEM</h1>
 </header>
 
 <div>
   <h2 style="align:center">STUDENT LOGIN</h2>
   <html:form action="/studentlogin" method="POST">
     <table>
        <tr>
          <td>Enrollment Number :</td>
          <td><html:text property="enrollment"></html:text></td>
        </tr>
        
        <tr>
          <td>Password :</td>
          <td><html:password property="password"></html:password></td>
        </tr>
        
        <tr>
          <td><html:submit style="width:100%" property="send">Login</html:submit></td>
          <td><html:cancel style="width:100%">Cancel</html:cancel></td>
        </tr>
     </table>
   </html:form>
 </div>
</center> 
</body>
</html>