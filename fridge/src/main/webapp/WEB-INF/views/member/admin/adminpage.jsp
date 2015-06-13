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
 $(document).ready(function(){
 	$("select").change(function(){	
 		alert($("#memberLevel option:selected").text());
 		
 		alert($(this).text().split("★").length);
 		/* var re= new RegExp($(this).text(),"★");
 		var resultArray = $(this).text().match(re); */
 		/*alert(resultArray.length); */
 		
		/*  location.href="${initParam.root}admin_levelChange.do?id="+$(this).val();  */
	}); 
});  
/*  function levelChange(id){
	alert(id);
	 location.href="${initParam.root}admin_levelChange.do?id="+id; 
} */ 
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
					<select id="memberLevel">
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
	<!-- 페이징 처리 -->	
	<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
		   이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
		   이전 페이지 그룹의 마지막 페이지 번호로 한다. 
	 --%>
	 <p class="paging">
	 <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
	 <a href=
	 "${initParam.root}admin_adminpage.do?pageNo=${requestScope.lvo.pagingBean.
	 startPageOfPageGroup-1}">◀&nbsp;</a>
	 </c:if>
	 &nbsp;&nbsp;
	<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
		   시작페이지~~마지막페이지까지 화면에 보여준다. 
		   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
		   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
	 --%>	
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
	<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
			이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
			다음 그룹의 시작 페이지로 링크한다. 
			right_arrow_btn.gif
	 --%>
	 <c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
	 <a href="admin_adminpage.do?pageNo=${requestScope.lvo.pagingBean.endPageOfPageGroup+1}">
	 ▶
	 </a>
	 </c:if>	
	 </p>	 
</body>
</html>