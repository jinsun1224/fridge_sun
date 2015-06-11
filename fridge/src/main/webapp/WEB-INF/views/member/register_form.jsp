<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Spring Expression Language (SpEL) 선언부 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery-1.11.0.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#id").keyup(function(){
			var id=$("#id").val().trim();
			$("#id_error").html("");
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!");
				checkResultId="";
				return;
			}
			
			$.ajax({
				type:"POST",
				url:"member_memberIdCheck.do",
				data:"id="+id,	
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup Id
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
	     $("#cancelBtn").click(function(){
	    	 location.href="${initParam.root}home.do";
	    	 
	     });
	});//ready
</script>
<form:form action="${initParam.root}member_register.do" commandName="memberVO">
 아이디 :   <form:input path="id" id="id" />
  <font color="red"><form:errors id="id_error" path="id"></form:errors></font>
  <span id="idCheckView"></span><br>   
 패스워드 : <form:password path="password" id="password" />
   <font color="red"><form:errors id="pass_error" path="password"></form:errors></font>
   <span id="passwordSizeView"></span><br>
패스워드 확인 <input type="password" id="password2">
   <span id="passwordCheckView"></span> <br>
 이름 : <form:input path="name" id="name" />
   <font color="red"><form:errors path="name"></form:errors></font><br>   
 닉네임 : <form:input path="nick" id="nick" /> 
   <font color="red"><form:errors path="nick"></form:errors></font><br>   
  성별 : 남<input type="radio" value="1" name="gender">
  			 여<input type="radio" value="2" name="gender">
<font color="red"><form:errors path="gender"></form:errors></font><br>   
 e-mail : <form:input path="email" id="email" />
   <font color="red"><form:errors path="email"></form:errors></font><br>   
 질문 : 가장 좋아하는 요리는?<br>
 답 : <form:input path="answer" id="answer" />
   <font color="red"><form:errors path="answer"></form:errors></font><br>   
   <input type="submit" value="회원가입">
   <input type="button" value="취소" id="cancelBtn">
</form:form>
</body>
</html>