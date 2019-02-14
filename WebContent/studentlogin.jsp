<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="studentlogin.js"></script>
<link rel="stylesheet" type="text/css" href="studentlogin.css">
</head>
<body>
<div align="center">
 <jsp:include page="header.jsp"></jsp:include>
 
 <div>
   <h2 style="align:center">STUDENT LOGIN</h2>
   <html:form action="/studentlogin" method="POST" styleId="signInForm">
    <span id="invalid"></span>
    <span id="invalid2" style="font-size:13px;"></span>
     <table>
        <tr>
          <td><label><b>Enrollment Number </b></label><span class="star">*</span></td>
        </tr>
        <tr>
          <td style="padding-bottom: 15px;"><html:text styleId="chekEnroll" property="enrollment"></html:text><span id="enrollEmpty" style="font-size: 13px;"></span></td>
        </tr>
        
        <tr>
          <td><label><b>Password </b></label><span class="star">*</span></td>
        </tr>
        <tr>
          <td><html:password property="password" styleId="checkPass"></html:password><span id="passEmpty" style="font-size: 13px;"></span></td>
        </tr>
                
        <tr>
          <td>
           <html:button styleId="subBtn" style="width:65px; height:30px" property="send" onclick="checkAvailable()" value="LOGIN"></html:button>
           <html:button styleClass="mybuttonclass" styleId="cancl" property="cancel" onclick="history.go(0)" value="CANCEL"></html:button>
          </td>
        </tr>
        
        <tr>
          <td><a id="ref" href="forgetPassword.jsp">Forget Password?</a></td>
        </tr>
     </table>    
   </html:form>  
 </div>
</div> 
</body>
</html>