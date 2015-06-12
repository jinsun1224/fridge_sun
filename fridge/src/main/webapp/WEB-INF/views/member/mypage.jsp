<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateBtn").click(function(){
			location.href = "${initParam.root}member_updateMemberForm.do";
		});
		$("#deleteBtn").click(function(){
	         location.href="${initParam.root}member_deleteMemberForm.do";
	      });
	
	});

</script>
</head>
<body>
마이페이지!!!!<br>
아이디 : ${sessionScope.mvo.id }<br>
이름 : ${sessionScope.mvo.name }<br>
닉네임 : ${sessionScope.mvo.nick }<br>
성별 : 
	<c:choose>
		<c:when test="${sessionScope.mvo.gender==1}">
      남자
      </c:when>
		<c:otherwise>
      여자
      </c:otherwise>
	</c:choose><br>
	e-mail : ${sessionScope.mvo.email }<br>
질문 : 가장 좋아하는 요리는?<br>
답 : ${sessionScope.mvo.answer }<br>
레벨: ${sessionScope.mvo.level }<br>
좋아요 수 : ${sessionScope.mvo.love }<br> 


<input type="button" value="수정하기" id="updateBtn">
 <input type="button" value="탈퇴하기" id="deleteBtn">

<%-- <a href="${initParam.root}member_updateMemberForm.do">수정하기</a>
<a href="${initParam.root}member_deleteMemberForm.do">탈퇴하기</a> --%>
</body>
</html>