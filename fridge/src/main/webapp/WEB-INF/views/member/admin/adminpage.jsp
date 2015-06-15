<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery-1.11.0.js"></script>
<script type="text/javascript">
function deleteMember(id) {
	if(confirm("삭제하시겠습니까?")){
	location.href="${initParam.root}admin_outMember.do?id="+id;
	}
}

function level_change(level) {
	if(level.options[level.selectedIndex].value){
		var star = level.options[level.selectedIndex].text;
		var selectLevel=0;
		if(star=="관리자"){
			selectLevel=6;
		}else{
			selectLevel = star.length;
		}
		var memberId = level.options[level.selectedIndex].value;
		location.href="${initParam.root}admin_levelChange.do?id="+memberId+"&level="+selectLevel; 
		};
	}
</script>
</head>
<body>
<table class="list">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="id">ID</th>
			<th class="name">이름</th>
			<th class="nick">닉네임</th>
			<th class="gender">성별</th>
			<th class="email">e-mail</th>
			<th class="level">레벨</th>
			<th class="registerDate">등록날짜</th>
			<th class="delete">삭제</th>
			</tr>		
		</thead>	
			<c:forEach var="mvo" items="${requestScope.lvo.list}">					
			<tr>
			    <td>${mvo.id }</td>
			    <td>${mvo.name }</td>					
				<td>${mvo.nick }</td>
				<td>
				<c:choose>
				<c:when test="${mvo.gender==1 }">
				남
				</c:when>
				<c:otherwise>
				여
				</c:otherwise>
				</c:choose>
				</td>
				<td>${mvo.email }</td>
				<td>
				<form name="levelForm">
					<select name="memberLevel" onchange="level_change(this)">
						<c:forEach var="index" begin="1" end="6" step="1">
						<c:choose>
							<c:when test="${index==mvo.level }">								
									<option value="${mvo.id}" selected>
										<c:choose>
											<c:when test="${index==6}">관리자</c:when>
											<c:otherwise>
												<c:forEach var="index3" begin="1" end="${index}" step="1">★</c:forEach>		
											</c:otherwise>										
										</c:choose>
									</option>
							</c:when>	
								<c:otherwise>
									<option value="${mvo.id}">
										<c:choose>
											<c:when test="${index==6}">관리자</c:when>
											<c:otherwise>
												<c:forEach var="index3" begin="1" end="${index}" step="1">★</c:forEach>				
											</c:otherwise>										
										</c:choose>	
									</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</form>
            </td>
				<td>${mvo.registerDate }</td>
				 <td>
				 <c:choose>
				 	<c:when test="${mvo.level!=6 }">
				 <input type="button" value="삭제"  onclick="deleteMember('${mvo.id }')">	
				 	</c:when>	
				 </c:choose>
				 </td> 
			</tr>				
			</c:forEach>
	</table><br></br>	
		<br></br>	
	<!-- 페이징 처리 -->		
	<br></br>	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <p class="paging">
	 <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
	 <a href=
	 "${initParam.root}admin_adminpage.do?pageNo=${requestScope.lvo.pagingBean.
	 startPageOfPageGroup-1}">◀&nbsp;</a>
	 </c:if>
	 &nbsp;&nbsp;
	<c:forEach var="i" 
	begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
	 end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
	 <c:choose>
	 <c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
	 <a href="${initParam.root}admin_adminpage.do?pageNo=${i}">${i}</a>
	 </c:when>
	 <c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	</c:forEach>	 
	&nbsp;&nbsp;
	 <c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
	 <a href="admin_adminpage.do?pageNo=${requestScope.lvo.pagingBean.endPageOfPageGroup+1}">
	 ▶
	 </a>
	 </c:if>	
	 </p>	 
</body>
</html>