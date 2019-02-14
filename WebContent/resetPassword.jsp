<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resetPassword.css">
<script type="text/javascript" src="resetPassword.js"></script>
</head>
<body>
 <div align="center">
  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>PAYMENT BILLING SYSTEM</h1>
  </header>
  <h3 style="align:center">RESET PASSWORD</h3>
  <html:form action="/resetPassword" method="POST">
   <table style="padding-left: 15px; padding-top: 14px">
    <tr>
     <td><label><b>Password </b></label><span class="star">*</span></td>
    </tr>
    <tr>
     <td style="padding-bottom: 15px"><html:password styleId="passId" property="password"><span id="emptyPass" style="font-size: 13px;"></span></html:password></td>
    </tr>
    
    <tr>
     <td><label><b>Confirm Password </b></label><span class="star">*</span></td>
    </tr>
    <tr>
     <td style="padding-bottom: 5px;"><html:password styleId="confPassId" property="confirmPassword"></html:password><span id="emptyConfPass" style="font-size: 13px;"></span></td>
    </tr>
   
    <tr>
     <td id="btnstyle"><html:button styleId="btnId" property="subBtn" value="SUBMIT" onclick="resetPassSub()"></html:button></td>
    </tr>
   </table>
  
  </html:form>
  
 </div>
</body>
</html>