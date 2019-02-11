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

<jsp:include page="header.jsp"></jsp:include>
  
  <h2 style="align:center">REGISTRATION FORM</h2>
    <html:form action="/mygeneralinfo" method="POST" styleId="gnInfoForm">
    <div id="emptyform"></div>
     <table style="width: 80px">
      <tr> 
       <td style="padding-bottom: 0"><label><b>Enrollment Number </b></label><span class="star">*</span></td>
      </tr>
      <tr> 
      <!--  <td style="padding-bottom: 15px"><input id="enroll" type="text" name="enrollment" placeholder="Enrollment Number"><div id="enr" style="font-size: 13px;"></div></td> -->
         <td style="padding-bottom: 15px"><html:text styleId="enroll" property="enrollment" onmouseout="checkEnrollmentNumber()"></html:text><div id="enr" style="font-size: 13px;"></div></td>
 
      </tr>
      
      <tr>
       <td style="padding-bottom: 0"><label><b>Email Id </b></label><span class="star">*</span></td>      
      </tr> 
      <tr> 
       <!-- <td style="padding-bottom: 15px"><input id="eId" type="text" name="email" placeholder="Email Id"></td> -->
       <td style="padding-bottom: 15px"><html:text styleId="eId" property="email" onmouseout="checkPatternOfEmail()"></html:text><div id="emailId"></div></td>
      </tr>
      
      <tr> 
       <td style="padding-bottom: 0"><label><b>Password </b></label><span class="star">*</span></td>  
      </tr> 
      <tr>  
       <!-- <td style="padding-bottom: 15px"><input id="checkPass" type="password" name="password" placeholder="Password"/></td> -->
        <td style="padding-bottom: 15px"><html:password styleId="checkPass" property="password" onmouseout="validatePassword()"></html:password><div id="div1"></div></td>
      </tr>
      
      <tr>
       <td style="padding-bottom: 0"><label><b>Confirm Password </b></label><span class="star">*</span></td>  
      </tr>  
      <tr> 
      <!-- <!--   <td style="padding-bottom: 15px"><input id="checkConfPass" type="password" name="confirmPassword" placeholder="Confirm Password" onmouseleave="check()"/><div id="cpass" style="font-size: 13px;"></div></td> -->
               <td style="padding-bottom: 15px"><html:password styleId="checkConfPass" property="confirmPassword" onmouseout="check()"></html:password><div id="cpass" style="font-size: 13px;"></div></td> 
      </tr>
      
      <tr>
       <td><html:button styleClass="myBtn" disabled="false"  value="REGISTER" property="submitBtn" onclick="findEnrollment()"></html:button>
       <html:button styleClass="myBtn1" styleId="cnclBtn" property="cancelBtn" onclick="history.go(0)" value="CANCEL"></html:button></td>
      </tr>
     </table>
    </html:form>
   </div>     
 </body>
</html>