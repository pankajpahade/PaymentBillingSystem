<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.4/dojo/dojo.js"></script> -->
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
       <td><html:text styleId="enrllText" property="enrollment"></html:text></td>
       <td><html:button styleId="enrollBtn" property="sub" onclick="mngform()">SUBMIT</html:button></td>
      </tr>
     </table>    
    </html:form>
    <br> <br>
    <span id="mailSuccess"></span>
  </div>
 </div>
</body>
</html>