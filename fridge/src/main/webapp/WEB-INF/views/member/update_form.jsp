<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#password").keyup(function(){
			$("#pass_error").html("");
	          var password= $("#password").val();
	          if(password.length<4 || password.length>10){
	                  $("#passwordSizeView").html("비밀번호 4자이상 10자이하");
	               }else{
	                  $("#passwordSizeView").html("");
	               }
	      });//keyup Password1
		$("#password2").keyup(function(){
	          $("#pass_error").html("");
	          var password = $("#password").val();
	         var password2 = $("#password2").val();
	         if(password.length<4 || password.length>10){
	            $("#passwordCheckView").html("");
	         }else if (password2!=password) {
	            $("#passwordCheckView").html("비밀번호가 서로 같지 않아요");            
	         }else if(password2==password){
	            $("#passwordCheckView").html("같네요");
	         }
	      }); 
		 $("#regForm").submit(function(){
	         var password = $("#password").val();
	            var password2 = $("#password2").val();
	            if(password!=password2){
	               alert("패스워드 확인 해주세요");
	               return false;
	            }
	      });
	      
	      $("#resetBtn").click(function(){
	    	 $("#password").val("");
	    	 $("#password2").val("");
	    	 $("#name").val("${mvo.name}");
	    	 $("#nick").val("${mvo.nick}");
	    	 $("#email").val("${mvo.email}");
	    	 $("#answer").val("${mvo.answer}");

	     }); 
	});//ready
</script>

<form:form action="${initParam.root}member_update.do" commandName="memberVO" id="regForm">
  <p>아이디 : ${sessionScope.mvo.id }</p>
  <input type="hidden" name="id" value="${sessionScope.mvo.id }">
  <input type="hidden" name="gender" value="${sessionScope.mvo.gender }">
     <input type="hidden" name="level" value="${sessionScope.mvo.level }">
  <%-- <font color="red"><form:errors id="id_error" path="id"></form:errors></font><br> --%>
<%-- 아이디 : <input type=text  value=${sessionScope.mvo.id } readonly></input><br> --%>
 변경할 패스워드 : <form:password path="password" id="password" />
   <font color="red"><form:errors id="pass_error" path="password"></form:errors></font>
   <span id="passwordSizeView"></span><br>
변경할 패스워드 확인 <input type="password" id="password2">
  <font color="red"><form:errors id="pass_error" path="password"></form:errors></font>
   <span id="passwordCheckView"></span> <br>
 이름 : <form:input path="name" id="name" value="${sessionScope.mvo.name }"/> 
   <font color="red"><form:errors path="name"></form:errors></font><br>   
 닉네임 : <form:input path="nick" id="nick" value="${sessionScope.mvo.nick }" /> 
   <font color="red"><form:errors path="nick"></form:errors></font><br>   
 e-mail : <form:input path="email" id="email" value="${sessionScope.mvo.email }" />
   <font color="red"><form:errors path="email"></form:errors></font><br>   
 질문 : 가장 좋아하는 요리는?<br>
 답 : <form:input path="answer" id="answer" value="${sessionScope.mvo.answer }" />
   <font color="red"><form:errors path="email"></form:errors></font><br>   
   <input type="submit" value="수정완료">	
 <input type="button" value="초기화" id="resetBtn">
   </form:form>
    



</body>
</html>