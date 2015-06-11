<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.root}member_passwordCheck_update.do">
비밀번호 <input type="text"  name="password"> 
<input type="hidden" name="id" value="${sessionScope.mvo.id}">
<input type="submit" value="수정">
</form>
	
</body>
</html>