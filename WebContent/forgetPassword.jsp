<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.4/dojo/dojo.js"></script>
<link rel="stylesheet" type="text/css" href="forgetPassword.css">
<script type="text/javascript" src="forgetPassword.js"></script>
</head>
<body>
 <div align="center">
  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>PAYMENT BILLING SYSTEM</h1>
  </header>
  
  <div>
    <h3 style="align:center">Please Enter Your Enrollment Number</h3>
    
    <html:form action="/forgetPassword" method="POST" styleId="fgtPass">
    <span id="enrollFill"></span>
     <table>
      <tr>
       <td><input id="enrllText" type="text" name="enrollment"/><div id="checkAvailable"></div></td>
       <td><html:button styleId="enrollBtn" property="subBtn" >SUBMIT</html:button></td>
      </tr>
     </table>    
    </html:form>
  </div>
 </div>
 
</body>
</html>