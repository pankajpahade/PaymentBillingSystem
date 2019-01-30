<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
 <script type="text/javascript" src="generalinfo.js"></script> 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="generalinfo.css">
</head>
<body>
 
  <div class="container" align="center">

  <header>
    <img align="left" id="logo" src="images/unilogo.png"/>
    <h1>PAYMENT BILLING SYSTEM</h1>
  </header>
  
  <h2 style="align:center">REGISTRATION FORM</h2>
    <html:form action="/mygeneralinfo" method="POST" styleId="gnInfoForm">
    
     <table>
      <tr> 
       <td> Enrollment Number :</td>
       <td><input id="enroll" type="text" name="enrollment" placeholder="Enrollment Number"><div id="enr" style="font-size: 13px;"></div></td>
      </tr>
      
      <tr> 
       <td>Password   :</td>
       <td><input id="checkPass" type="password" name="password" placeholder="Password"/>
      </tr>
      
      <tr>
       <td>Confirm Password :</td>
       <td><input id="checkConfPass" type="password" name="confirmPassword" placeholder="Confirm Password" onmouseleave="check()"/><div id="cpass" style="font-size: 13px;"></div></td>
      </tr>
      
      <tr>
       <td><html:button disabled="false" style="width:100%" value="REGISTER" property="submitBtn" onclick="findEnrollment()"></html:button></td>
       <td><html:button style="width:100%" property="cancelBtn" onclick="this.form.reset();">CANCEL</html:button></td>
      </tr>
     </table>
      
    </html:form>
   </div>   
  
 </body>
</html>