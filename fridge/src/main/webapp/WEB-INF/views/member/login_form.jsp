<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery-1.11.0.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#findMyInfo").click(function() {
          location.href = "${initParam.root}member_findMyInfo.do";
      });
   
   });
</script>
</head>
<body>
로그인 <br><br>
<form method="get" action="member_login.do" id="registerForm">
아이디<input type="text" name="id"><br>
패스워드<input type="text" name="password"><br>
<input type="submit" value="로그인">
<input type="button" value="아이디/비밀번호 찾기" id="findMyInfo">
</form>
</body>
</html>