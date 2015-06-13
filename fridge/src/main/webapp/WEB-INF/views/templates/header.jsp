<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>
   <a href="${initParam.root}home.do">KOSTA</a>

   <c:choose>
      <c:when test="${sessionScope.mvo==null}">
         <a href="${initParam.root}member_joinclause_view.do">회원가입</a>
         <%-- <a href="${initParam.root}member_registerForm.do">회원가입</a> --%>
         <a href="${initParam.root}member_loginForm.do">로그인</a>
      </c:when>
      <c:otherwise>
      ${sessionScope.mvo.nick}님 접속중!!
      <a href="${initParam.root}member_mypage.do">마이페이지</a>
         <a href="${initParam.root}member_logout.do">로그아웃</a>
         <c:choose>
            <c:when test="${sessionScope.mvo.level=='6' }">
                <a href="${initParam.root}admin_adminpage.do">관리자페이지</a>
                									
            </c:when>
         </c:choose>
      </c:otherwise>
   </c:choose>
</h2>